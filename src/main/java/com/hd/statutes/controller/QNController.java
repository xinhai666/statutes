package com.hd.statutes.controller;

import com.google.gson.Gson;
import com.hd.statutes.service.others.QNService;
import com.qiniu.http.Response;
import com.qiniu.storage.model.DefaultPutRet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class QNController {

    @Autowired
    private QNService qnService;

    @Value("${qiniu.domainOfBucket}")
    private String path;

    @RequestMapping("init")
    public String init(){
        return "qiniuFile";
    }
    @SystemControllerLog(description = "上传了图片")
    @PostMapping("/shangchuan")
    @ResponseBody
    public String shangchuan(@RequestParam("logofile") MultipartFile logofile, Model model)throws Exception{
        Response response=qnService.uploadFile(logofile.getInputStream());
        DefaultPutRet putRet=new Gson().fromJson(response.bodyString(),DefaultPutRet.class);
        String url =path+"/"+putRet.key;
        model.addAttribute("url",url);
        System.out.println(url);
        return url;
    }
    @SystemControllerLog(description = "上传了PDF文件")
    @PostMapping("/pdfUpload")
    @ResponseBody
    public String pdfUpload(@RequestParam("pdffile") MultipartFile pdffile, Model model)throws Exception{
        Response response=qnService.uploadFile(pdffile.getInputStream());
        DefaultPutRet putRet=new Gson().fromJson(response.bodyString(),DefaultPutRet.class);
        String url =path+"/"+putRet.key;
        model.addAttribute("url",url);
        System.out.println(url);
        return url;
    }


}

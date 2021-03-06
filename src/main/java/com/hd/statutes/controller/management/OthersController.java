package com.hd.statutes.controller.management;

import com.alibaba.fastjson.JSON;
import com.hd.statutes.controller.SystemControllerLog;
import com.hd.statutes.model.entity.Companyemail;
import com.hd.statutes.model.entity.Opinions;
import com.hd.statutes.model.entity.Shortmessage;
import com.hd.statutes.model.entity.Sites;
import com.hd.statutes.service.others.OthersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class OthersController {
    @Autowired
    private OthersService othersService;
    @SystemControllerLog(description = "查询所有意见")
    @PostMapping("getAllOpinions")//查询所有意见
    @ResponseBody
    public String getAllOpinions(){
        List<Opinions> opinionsList=othersService.getAllOpinions();
        return JSON.toJSONString(opinionsList);
    }
    @SystemControllerLog(description = "查看意见")
    @GetMapping("getOpinionsById")//查看意见
    public String getOpinionsById(@RequestParam("opinionId") int opinionId,HttpServletRequest request){
        Opinions opinions=othersService.getOpinionsById(opinionId);
        request.setAttribute("opinions",opinions);
        return "opinion-show";
    }
    @SystemControllerLog(description = "删除意见")
    @PostMapping("delOpinionById")//删除意见
    @ResponseBody
    public String delOpinionById(int opinionId){
        return othersService.delOpinionById(opinionId)+"";
    }
    @SystemControllerLog(description = "查看公司信息")
    @GetMapping("getCompanyContent")
    @ResponseBody
    public String getCompanyContent(int companyType){
        return othersService.getCompanyContent(companyType);
    }

    @SystemControllerLog(description = "修改公司信息")
    @PostMapping("updateCompany")
    @ResponseBody
    public String updateCompany(@RequestParam("companyContent") String companyContent, @RequestParam("companyType") int companyType){
        int num=othersService.updateCompany(companyContent,companyType);
        if(num>0){
            return "true";
        }else {
            return "false";
        }
    }
    @SystemControllerLog(description = "修改公司邮箱设置")
    @PostMapping("addCompanyemail")
    @ResponseBody
    public String addCompanyemail(Companyemail companyemail){
        int num=othersService.addCompanyemail(companyemail);
        if(num>0){
            return "true";
        }else {
            return "false";
        }
    }
    @SystemControllerLog(description = "查看公司邮箱设置信息")
    @GetMapping("getCompanyemail")
    @ResponseBody
    public String getCompanyemail(HttpServletRequest request){
        Companyemail companyemail=othersService.getCompanyemail();
        String ce= JSON.toJSONString(companyemail);
        return ce;
    }
    @SystemControllerLog(description = "查看公司介绍")
    @GetMapping("getShormessage")
    @ResponseBody
    public String getShormessage(){
        Shortmessage shortmessage=othersService.getShormessage();
        return JSON.toJSONString(shortmessage.getShortmessageApikey());
    }
    @SystemControllerLog(description = "修改公司介绍信息")
    @PostMapping("updateShortmessage")
    @ResponseBody
    public String updateShortmessage(Shortmessage shortmessage){
        int num=othersService.updateShortmessage(shortmessage);
        if(num>0){
            return "true";
        }else {
            return "false";
        }
    }
    @SystemControllerLog(description = "查看网站设置")
    @GetMapping("getSites")
    public String getSites(HttpServletRequest request){
        Sites sites=othersService.getSites();
        request.setAttribute("sites",sites);
        return "system-base";
    }
    @SystemControllerLog(description = "修改网站设置")
    @PostMapping("updateSites")
    @ResponseBody
    public String updateSites(Sites sites){
        int num=othersService.updateSites(sites);
        if(num>0){
            return "true";
        }else {
            return "false";
        }
    }

}

package com.hd.statutes.controller.management;

import com.alibaba.fastjson.JSON;
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

    @GetMapping("getAllOpinions")//查询所有意见
    public String getAllOpinions(HttpServletRequest request){
        List<Opinions> opinionsList=othersService.getAllOpinions();
        request.setAttribute("opinionsList",opinionsList);
        return "opinion_list";
    }
    @GetMapping("getOpinionsById")//查看意见
    public String getOpinionsById(@RequestParam("opinionId") int opinionId,HttpServletRequest request){
        Opinions opinions=othersService.getOpinionsById(opinionId);
        request.setAttribute("opinions",opinions);
        return "opinion-show";
    }
    @PostMapping("delOpinionById")
    @ResponseBody
    public String delOpinionById(int opinionId){
        return othersService.delOpinionById(opinionId)+"";
    }
    @GetMapping("getCompanyContent")
    @ResponseBody
    public String getCompanyContent(int companyType){
        return othersService.getCompanyContent(companyType);
    }

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
    @GetMapping("getCompanyemail")
    @ResponseBody
    public String getCompanyemail(HttpServletRequest request){
        Companyemail companyemail=othersService.getCompanyemail();
        String ce= JSON.toJSONString(companyemail);
        return ce;
    }
    @GetMapping("getShormessage")
    @ResponseBody
    public String getShormessage(){
        Shortmessage shortmessage=othersService.getShormessage();
        return JSON.toJSONString(shortmessage.getShortmessageApikey());
    }

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
    @GetMapping("getSites")
    public String getSites(HttpServletRequest request){
        Sites sites=othersService.getSites();
        request.setAttribute("sites",sites);
        return "system-base";
    }

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

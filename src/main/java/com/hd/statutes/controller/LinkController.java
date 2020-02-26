package com.hd.statutes.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class LinkController {
    @SystemControllerLog(description = "访问 登录页")
    @GetMapping("login") //登录
    public String login(){
        return "login";
    }
    @SystemControllerLog(description = "访问 后台首页")
    @GetMapping("goindex")//后台首页
    public String goindex(){
        return "index";
    }
    @SystemControllerLog(description = "访问 法规列表页")
    @GetMapping("gostatuteTable")//法规列表
    public String gostatuteTable(){
        return "member-list";
    }
    @SystemControllerLog(description = "访问 添加法规页")
    @GetMapping("articleadd")//添加法规
    public String articleadd(){
        return "article-add";
    }
    @SystemControllerLog(description = "访问 法规类型管理页")
    @GetMapping("statypelist")//法规类型管理页
    public String statypelist(){
        return "statutype-list";
    }
    @SystemControllerLog(description = "访问 添加法规类型页")
    @RequestMapping("statutetypeAdd")//添加法规类型页
    public String statutetypeAdd(){
        return "statutetype-add";
    }
    @SystemControllerLog(description = "访问 法规目录管理页")
    @RequestMapping("contentsPage") //法规目录管理页
    public String contentsPage(){ return "contents-list";}
    @SystemControllerLog(description = "访问 添加目录页")
    @RequestMapping("addContentsPage")//添加目录页
    public String addContentsPage(){
        return "addmulu";
    }
    @SystemControllerLog(description = "访问 公司介绍页")
    @RequestMapping("showcompany")//公司介绍
    public String showcompany(){
        return "showcompany";
    }
    @SystemControllerLog(description = "访问 用户管理页页")
    @RequestMapping("usersList")//用户管理页
    public String usersList(){
        return "users-list";
    }
    @SystemControllerLog(description = "访问 咨询管理页页")
    @RequestMapping("consultsList")//咨询管理页
    public String consultsList(){
        return "consults-list";
    }
    @SystemControllerLog(description = "访问 服务协议页")
    @RequestMapping("serverAgreements")//服务协议
    public String serverAgreements(){
        return "server-agreements";
    }
    @SystemControllerLog(description = "访问 网站设置页")
    @RequestMapping("systemBase")//网站设置页
    public String systemBase(){
        return "system-base";
    }
    @SystemControllerLog(description = "访问 邮件设置页")
    @RequestMapping("emailSmtp")//邮件设置
    public String emailSmtp(){ return "email-smtp";}
    @SystemControllerLog(description = "访问 短信设置页")
    @RequestMapping("shortMessage")// 短信设置
    public String shortMessage(){
        return "short-message";
    }
    @SystemControllerLog(description = "访问 管理员管理页")
    @RequestMapping("adminManage")//管理员管理页
    public String adminManage(){
        return "admin-manage";
    }
    @SystemControllerLog(description = "访问 意见反馈页")
    @RequestMapping("opinionInfo")//意见反馈页
    public String opinionInfo(){
        return "opinion_list";
    }
    @SystemControllerLog(description = "访问 条款管理页")
    @RequestMapping("clauseList")//条款管理页
    public String clauseList(){return "clause-list";}
    @SystemControllerLog(description = "访问 新增条款页")
    @RequestMapping("clauseAdd")//新增条款页
    public String clauseAdd(){return "clause-add";}
    @RequestMapping("go404")
    public String go404(){ return "404"; }

}

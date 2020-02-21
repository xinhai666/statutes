package com.hd.statutes.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class LinkController {
    @GetMapping("login") //登录
    public String login(){
        return "login";
    }
    @GetMapping("goindex")//后台首页
    public String goindex(){
        return "index";
    }
    @GetMapping("gostatuteTable")//法规列表
    public String gostatuteTable(){
        return "member-list";
    }
    @GetMapping("articleadd")//添加法规
    public String articleadd(){
        return "article-add";
    }
    @GetMapping("statypelist")//法规类型管理页
    public String statypelist(){
        return "statutype-list";
    }
    @RequestMapping("statutetypeAdd")//添加法规类型页
    public String statutetypeAdd(){
        return "statutetype-add";
    }
    @RequestMapping("contentsPage") //法规目录管理页
    public String contentsPage(){ return "contents-list";}
    @RequestMapping("addContentsPage")//添加目录页
    public String addContentsPage(){
        return "addmulu";
    }
    @RequestMapping("showcompany")//公司介绍
    public String showcompany(){
        return "showcompany";
    }
    @RequestMapping("usersList")//用户管理页
    public String usersList(){
        return "users-list";
    }
    @RequestMapping("consultsList")//咨询管理页
    public String consultsList(){
        return "consults-list";
    }
    @RequestMapping("serverAgreements")//服务协议
    public String serverAgreements(){
        return "server-agreements";
    }
    @RequestMapping("systemBase")//网站设置页
    public String systemBase(){
        return "system-base";
    }
    @RequestMapping("emailSmtp")//邮件设置
    public String emailSmtp(){
            return "email-smtp";
    }
    @RequestMapping("shortMessage")// 短信设置
    public String shortMessage(){
        return "short-message";
    }
    @RequestMapping("adminManage")//管理员管理页
    public String adminManage(){
        return "admin-manage";
    }
    @RequestMapping("opinionInfo")//意见反馈页
    public String opinionInfo(){
        return "opinion_list";
    }
    @RequestMapping("clauseList")//条款管理页
    public String clauseList(){return "clause-list";}
    @RequestMapping("clauseAdd")//新增条款页
    public String clauseAdd(){return "clause-add";}

}

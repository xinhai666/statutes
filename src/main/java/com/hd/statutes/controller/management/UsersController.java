package com.hd.statutes.controller.management;

import com.alibaba.fastjson.JSON;
import com.hd.statutes.model.entity.Admins;
import com.hd.statutes.model.entity.Consults;
import com.hd.statutes.model.entity.Users;
import com.hd.statutes.service.users.UsersService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class UsersController {
    @Autowired
    private UsersService usersService;
    @GetMapping("getAllUsers")
    public String getAllUsers(HttpServletRequest request){
        List<Users> usersList=usersService.getAllUsers();
        request.setAttribute("usersList",usersList);
        return "users-list";
    }
    @PostMapping("getAllConsultsByUserId")
    @ResponseBody
    public String getAllConsultsByUserId(@RequestParam(value = "userId",defaultValue = "0") int userId){
        List<Consults> consultsList=usersService.getAllConsultsByUserId(userId);
        return JSON.toJSONString(consultsList);
    }
    @GetMapping("consultShow")
    public String consultShow(@RequestParam("consultId") int consultId,HttpServletRequest request){
        Consults consults=usersService.getConsultsById(consultId);
        request.setAttribute("consults",consults);
        return "consult-show";
    }
    @PostMapping("delConsultById")
    @ResponseBody
    public String delConsultById(@RequestParam("consultId") int consultId){
        int num=usersService.delConsultById(consultId);
        if(num>0){
            return "true";
        }else {
            return "false";
        }
    }
    @PostMapping("addAdmin")
    @ResponseBody
    public String addAdmin(Admins admins){
        int num=usersService.addAdmin(admins);
        if(num>0){
            return "true";
        }else {
            return "false";
        }
    }
    @GetMapping("getAllAdmin")
    @ResponseBody
    public String getAllAdmin(){
        List<Admins> list=usersService.getAllAdmin();
        return JSON.toJSONString(list);
    }
    //删除管理员
    @PostMapping("delAdminById")
    @ResponseBody
    public String delAdminById(@RequestParam("adminId") int adminId){
        return usersService.delAdminById(adminId)+"";
    }
    //修改管理员
    @PostMapping("updateAdmins")
    @ResponseBody
    public String updateAdmins(Admins admins){
        int num=usersService.updateAdmins(admins);
        if(num>0){
            return "true";
        }else {
            return "false";
        }
    }
    //管理员登录
    @PostMapping("adminLogin")
    public String adminLogin(Admins admins,HttpServletRequest request){
        HttpSession session=request.getSession();
        Admins a=usersService.adminLogin(admins);
        if(a!=null){
            session.setAttribute("admins",a);
            return "index";
        }else {
            request.setAttribute("fail","账号或密码错误，请重试");
            return "login";
        }
    }
}

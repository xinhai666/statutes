package com.hd.statutes.controller.management;

import com.alibaba.fastjson.JSON;
import com.hd.statutes.controller.SystemControllerLog;
import com.hd.statutes.model.entity.Admins;
import com.hd.statutes.model.entity.Consults;
import com.hd.statutes.model.entity.Users;
import com.hd.statutes.service.users.UsersService;
import org.apache.ibatis.annotations.Param;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Enumeration;
import java.util.List;

@Controller
public class UsersController {
    @Autowired
    private UsersService usersService;

    @SystemControllerLog(description = "查询所有用户")
    @GetMapping("getAllUsers")
    public String getAllUsers(HttpServletRequest request){
        List<Users> usersList=usersService.getAllUsers();
        request.setAttribute("usersList",usersList);
        return "users-list";
    }
    @SystemControllerLog(description = "查询用户所有咨询")
    @PostMapping("getAllConsultsByUserId")
    @ResponseBody
    public String getAllConsultsByUserId(@RequestParam(value = "userId",defaultValue = "0") int userId){
        List<Consults> consultsList=usersService.getAllConsultsByUserId(userId);
        return JSON.toJSONString(consultsList);
    }
    @SystemControllerLog(description = "查询一个咨询")
    @GetMapping("consultShow")
    public String consultShow(@RequestParam("consultId") int consultId,HttpServletRequest request){
        Consults consults=usersService.getConsultsById(consultId);
        request.setAttribute("consults",consults);
        return "consult-show";
    }
    @SystemControllerLog(description = "删除一条咨询")
    @RequestMapping("/delConsultById")
    @ResponseBody
    public String delConsultById(@RequestParam("consultId") int consultId){
        int num=usersService.delConsultById(consultId);
        if(num>0){
            return "true";
        }else {
            return "false";
        }
    }
    @SystemControllerLog(description = "添加管理员")
    @RequestMapping("addAdmin")
    @ResponseBody
    public String addAdmin(Admins admin){
        int num=usersService.addAdmin(admin);
        if(num>0){
            return "true";
        }else {
            return "false";
        }
    }
    @SystemControllerLog(description = "查看所有管理员")
    @GetMapping("getAllAdmin")
    @ResponseBody
    public String getAllAdmin(){
        List<Admins> list=usersService.getAllAdmin();
        return JSON.toJSONString(list);
    }
    //删除管理员
    @SystemControllerLog(description = "删除一个管理员")
    @RequestMapping("/delAdminById")
    @ResponseBody
    public String delAdminById(@RequestParam("adminId") int adminId){
        int num=usersService.delAdminById(adminId);
        if(num>0){
            return "true";
        }else {
            return "false";
        }
    }
    //修改管理员
    @SystemControllerLog(description = "修改管理员")
    @PostMapping("updateAdmins")
    @ResponseBody
    public String updateAdmins(@RequestBody Admins admin){
        int num=usersService.updateAdmins(admin);
        if(num>0){
            return "true";
        }else {
            return "false";
        }
    }

    /**
     * 管理员登录 shiro
     * @param admins
     * @param request
     * @return
     */
    @PostMapping("/adminLogin")
    public String adminLogin(Admins admins, HttpServletRequest request){
        //获取Subject
        Subject subject=SecurityUtils.getSubject();
        //封装用户数据
        UsernamePasswordToken token=new UsernamePasswordToken(admins.getAdminPhone(),admins.getPassword());
        try {
            //验证登录信息
            subject.login(token);
            if(subject.isAuthenticated()){// 验证通过
                //从shiro的session中取出我们保存的对象，该对象在登录认证成功后保存的
                Object object=subject.getPrincipal();
                if(object instanceof Admins){
                    object=(Admins)object;
                }
                subject.getSession().setAttribute("admins",object);
                //Admins a=usersService.adminLogin(admins);//没使用shiro验证时使用的后台登录
                //request.getSession().setAttribute("admins",a);
                //验证成功，进入主页
                return "index";
            }else {
                token.clear();
                return "login";
            }
        } catch (UnknownAccountException e) {
            //登录失败:用户名不存在，UnknownAccountException是Shiro抛出的找不到用户异常
            System.out.println("无效的用户名！");
            request.setAttribute("fail","登录账号不存在");
            return "login";
            //return "noAuth";
        }catch (IncorrectCredentialsException e){
            //登录失败:密码错误，IncorrectCredentialsException是Shiro抛出的密码错误异常
            System.out.println("密码错误！");
            request.setAttribute("fail","密码错误，请重试");
            return "login";
           // return "noPass";
        }
    }

    //管理员登录
//    @SystemControllerLog(description = "管理员后台登录")
//    @PostMapping("adminLogin")
//    public String adminLogin(Admins admins, HttpSession session, Model model){
//        Admins adm=usersService.adminLogin(admins);
//        if(adm!=null){
//            session.setAttribute("admins",adm);
//            return "index";
//        }else {
//            model.addAttribute("fail","账号或密码错误，请重试");
//            return "login";
//        }
//    }

    //管理员退出登录
    @SystemControllerLog(description = "管理员退出登录")
    @GetMapping("tologout")
    public String tologout(HttpServletRequest request){
        Enumeration em = request.getSession().getAttributeNames();
        while(em.hasMoreElements()){
            request.getSession().removeAttribute(em.nextElement().toString());
        }
        return "login";
    }
}

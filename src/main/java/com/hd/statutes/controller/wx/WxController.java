package com.hd.statutes.controller.wx;

import com.alibaba.fastjson.JSON;
import com.hd.statutes.model.entity.Admins;
import com.hd.statutes.model.entity.Clause;
import com.hd.statutes.model.entity.Contents;
import com.hd.statutes.model.entity.Statute;
import com.hd.statutes.model.vo.ClauseVO;
import com.hd.statutes.model.vo.StatuteVO;
import com.hd.statutes.service.laws.StatuteService;
import com.hd.statutes.service.users.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class WxController {
    @Autowired
    private StatuteService statuteService;
    @Autowired
    private UsersService usersService;

    @PostMapping(value = "wxCheckAllStatutes")
    @ResponseBody
    public String wxCheckAllStatutes(@RequestParam(value = "statutestypeId",defaultValue = "0") int statutestypeId,
                                 @RequestParam(value = "statutesplitId",defaultValue = "0") int statutesplitId){
        List<StatuteVO> list=statuteService.getAllStatutes(statutestypeId,statutesplitId);
        String listStr= JSON.toJSONString(list);
        //System.out.println(listStr);
        return listStr;
    }
    @PostMapping(value = "wxLogin")
    @ResponseBody
    public String wxLogin(Admins admins, HttpServletRequest request){
       Admins admins1=usersService.adminLogin(admins);
       if(admins1!=null){
           return "欢迎 "+admins1.getAdminName()+" 登录";
       }else {
           return "账号或密码错误";
       }
    }
    @PostMapping("checkStatuteByName")
    @ResponseBody
    public String checkStatuteByName(@RequestParam(value = "statuteName",defaultValue = "") String statuteName){
        List<Statute> list=statuteService.checkStatuteByName(statuteName);
        if(list.size()>0){
            //System.out.println(JSON.toJSONString(list));
            return JSON.toJSONString(list);
        }else {
            return "[{\"statuteName\":\"没有找到相关内容\"}]";
        }
    }

    /**
     * 查询一个条款
     * @param clauseId
     * @return
     */
    @PostMapping("wxcheckClauseById")
    @ResponseBody
    public String wxcheckClauseById(@RequestParam("clauseId")int clauseId){
        ClauseVO clauseVO=statuteService.checkClauseById(clauseId);
        if(clauseVO!=null){
            return JSON.toJSONString(clauseVO);
        }else {
            return "未找到";
        }
    }

    /**
     * 根据法规查所有目录
     * @param contentsLevel
     * @param conId
     * @param staId
     * @return
     */
    @PostMapping("wxgetAllContentsBystaId")
    @ResponseBody
    public String wxgetAllContentsBystaId(@RequestParam(value = "contentsLevel",defaultValue = "0")int contentsLevel,
                                            @RequestParam(value = "conId",defaultValue = "0") int conId,
                                            @RequestParam(value = "staId",defaultValue = "0") int staId ){
        List<Contents> list=statuteService.getAllContentsByStatuteId(contentsLevel,conId,staId);
        String listStr=JSON.toJSONString(list);
        System.out.println(listStr);
        return listStr;
    }

}

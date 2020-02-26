package com.hd.statutes.controller.management;

import com.alibaba.fastjson.JSON;
import com.hd.statutes.controller.SystemControllerLog;
import com.hd.statutes.model.entity.*;
import com.hd.statutes.model.vo.ClauseVO;
import com.hd.statutes.model.vo.StatuteVO;
import com.hd.statutes.service.laws.StatuteService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class StatuteController {
    @Resource
    private StatuteService statuteService;
    @SystemControllerLog(description = "查询所有法规类型")
    @GetMapping("getAllStatype") //查询所有法规类型
    @ResponseBody
    public String getAllStatype(){
        List<Statutestype> list=statuteService.getAllStatype();
        return JSON.toJSONString(list);
    }
    @SystemControllerLog(description = "添加法规类型")
    @PostMapping("addSatatueType")
    @ResponseBody
    public String addSatatueType(@RequestParam("statutestypeName")String statutestypeName){
        int num=statuteService.addSatatueType(statutestypeName);
        if(num>0){
            return "true";
        }else {
            return "false";
        }
    }
    @SystemControllerLog(description = "删除法规类型")
    @RequestMapping("delStatueTypeById")
    @ResponseBody
    public String delStatueTypeById(@RequestParam("statutestypeId")int statutestypeId){
        int num=statuteService.delStatueTypeById(statutestypeId);
        if(num>0){
            return "true";
        }else {
            return "false";
        }
    }
    @SystemControllerLog(description = "根据法规类型id查询所有该法规主分支")
    @GetMapping("getAllStaSplit")
    @ResponseBody
    public String getAllStaSplit(@RequestParam("statutestypeId") int statutestypeId){
        List<Statutesplit> list=statuteService.getAllStaSplit(statutestypeId);
        return JSON.toJSONString(list);
    }
    @SystemControllerLog(description = "添加法规分支页")
    @RequestMapping("stasplitAdd")//添加法规分支页
    public String stasplitAdd(@RequestParam("statutestypeId") int statutestypeId,Model model){
        model.addAttribute("statutestypeId",statutestypeId);
        return "stasplit-add";
    }
    @SystemControllerLog(description = "查询所有法规")
    @GetMapping(value = "getAllStatutes")
    @ResponseBody
    public String getAllStatutes(@RequestParam(value = "statutestypeId",defaultValue = "0") int statutestypeId,
                                 @RequestParam(value = "statutesplitId",defaultValue = "0") int statutesplitId){
        List<StatuteVO> list=statuteService.getAllStatutes(statutestypeId,statutesplitId);
        return JSON.toJSONString(list);

    }
    @SystemControllerLog(description = "查询一个法规类型")
    @GetMapping("stasplitlist")
    public String stasplitlist(@RequestParam("statutestypeId")int statutestypeId, Model model){
        Statutestype statutestype=statuteService.getStatutesTypeById(statutestypeId);
        //System.out.println(statutestype.getStatutestypeName());
        model.addAttribute("statutestype",statutestype);
        return "statusplit-list";
    }
    @SystemControllerLog(description = "添加主分支")
    @PostMapping("addStaSplit")
    @ResponseBody
    public String addStaSplit(Statutesplit statutesplit){
        //System.out.println(statutesplit.getStatutesplitName());
        int num=statuteService.addStaSplit(statutesplit);
        if(num>0){
            return "true";
        }else {
            return "false";
        }
    }
    @SystemControllerLog(description = "删除分支")
    @PostMapping("delStatueSplitById")
    @ResponseBody
    public String delStatueSplitById(@RequestParam("statutesplitId") int statutesplitId){
        int num=statuteService.delStatueSplitById(statutesplitId);
        if(num>0){
            return "true";
        }else {
            return "false";
        }
    }

    //添加法规
    @SystemControllerLog(description = "添加法规")
    @PostMapping(value = "addStatute",produces = "text/html;charset=utf-8")
    @ResponseBody
    public String addStatute(Statute sta) {
        int num=statuteService.addStatute(sta);
        if(num>0) {
            return "true";
        }else {
            return "false";
        }
    }

    /**
     * 根据法规查询目录
     * @param contentsLevel
     * @param conId
     * @param staId
     * @return
     */
    @SystemControllerLog(description = "根据法规查询所有目录")
   @RequestMapping("getAllContentsByStatuteId")
   @ResponseBody
   public String getAllContentsByStatuteId(@RequestParam(value = "contentsLevel",defaultValue = "0")int contentsLevel,
                                             @RequestParam(value = "conId",defaultValue = "0") int conId,
                                             @RequestParam(value = "staId",defaultValue = "0") int staId ){
       List<Contents> list=statuteService.getAllContentsByStatuteId(contentsLevel,conId,staId);
       String listStr=JSON.toJSONString(list);
       //System.out.println(listStr);
       return listStr;
    }
    @SystemControllerLog(description = "添加目录")
    @PostMapping("addContents")
    @ResponseBody
    public String addContents(Contents contents){
        System.out.println(statuteService.getContentsById(contents.getConId()));
        int contentsLevel=1;
        if(contents.getConId()>0){
            contentsLevel=statuteService.getContentsById(contents.getConId()).getContentsLevel()+1;
        }
        contents.setContentsLevel(contentsLevel);
       int num=statuteService.addContents(contents);
       if(num>0){
           return "true";
       }else {
           return "false";
       }
    }

    /**
     * 新增条款
     * @param clause
     * @return
     */
    @SystemControllerLog(description = "新增条款")
    @PostMapping("addClause")
    @ResponseBody
    public String addClause(Clause clause){
       int num=statuteService.addClause(clause);
       if(num>0){
           return "true";
       }else {
           return "false";
       }
    }

    /**
     * 根据法规查询所有条款
     * @param staId
     * @return
     */
    @SystemControllerLog(description = "根据法规查询所有条款")
    @PostMapping("getClauseVoBystaId")
    @ResponseBody
    public String getClauseVoBystaId(@RequestParam(value = "staId",defaultValue = "0") int staId){
        List<ClauseVO> list=statuteService.getClauseVoBystaId(staId);
        return JSON.toJSONString(list);
    }

    /**
     * 删除条款
     * @param clauseId
     * @return
     */
    @SystemControllerLog(description = "删除条款")
    @PostMapping("delClauseById")
    @ResponseBody
    public String delClauseById(@RequestParam("clauseId")int clauseId){
        int num=statuteService.delClauseById(clauseId);
        if(num>0){
            return "true";
        }else {
            return "false";
        }
    }
    /**
     * 查询一个条款
     * @param clauseId
     * @return
     */
    @SystemControllerLog(description = "查询一个条款")
    @GetMapping("checkClauseById")
    public String checkClauseById(@RequestParam("clauseId") int clauseId, HttpServletRequest request){
        ClauseVO clauseVO=statuteService.checkClauseById(clauseId);
        //System.out.println(clauseVO.getClauseAnothername());
        request.setAttribute("clause",clauseVO);
        return "clause-update";
    }

    /**
     * 修改条款
     * @param clause
     * @return
     */
    @SystemControllerLog(description = "修改条款")
    @PostMapping("updateClause")
    @ResponseBody
   public void updateClause(Clause clause){
        statuteService.updateClause(clause);
   }

    /**
     * 根据目录id删除目录
     * @param contentsId
     */
    @SystemControllerLog(description = "根据目录id删除目录")
    @PostMapping("delContents")
    @ResponseBody
    public String delContents(@RequestParam("contentsId") int contentsId) {
        int num=statuteService.delContents(contentsId);
        if(num>0){
            return "true";
        }else {
            return "false";
        }
    }
    /**
     * 修改目录页面
     */
    @SystemControllerLog(description = "修改目录页面")
    @GetMapping("updateContentsPage")
    public String updateContentsPage(@RequestParam("contentsId") int contentsId,HttpServletRequest request){
        Contents contents=statuteService.getContentsById(contentsId);
        request.setAttribute("contents",contents);
        return "contents-update";
    }

    /**
     * 修改目录
     * @param contents
     */
    @SystemControllerLog(description = "修改目录")
    @PostMapping("updateContents")
    @ResponseBody
    public void updateContents(Contents contents){
        int contentsLevel=1;
        if(contents.getConId()>0){
            contentsLevel=statuteService.getContentsById(contents.getConId()).getContentsLevel()+1;
        }
        contents.setContentsLevel(contentsLevel);
        statuteService.updateContents(contents);
    }

    /**
     * 查询一条法规
     * @param statuteId
     * @return
     */
    @SystemControllerLog(description = "查询一条法规")
    @GetMapping("getStatuteById")
    public String getStatuteById(@RequestParam("statuteId") int statuteId,HttpServletRequest request){
        Statute statute=statuteService.getStatuteById(statuteId);
        request.setAttribute("statute",statute);
        return "article-update";
    }

    /**
     * 修改法规
     * @param statute
     * @return
     */
    @SystemControllerLog(description = "修改法规")

    @PostMapping("updateStatute")
    @ResponseBody
    public String updateStatute(Statute statute){
        int num=statuteService.updateStatute(statute);
        if(num>0){
            return "true";
        }else {
            return "false";
        }
    }
    @SystemControllerLog(description = "删除法规")
    @PostMapping("delStatuteById")//删除法规
    @ResponseBody
    public String delStatuteById(int statuteId){
        int num=statuteService.delStatuteById(statuteId);
        if(num>0){
            return "true";
        }else {
            return "false";
        }
    }
}

package com.hd.statutes.controller.management;

import com.alibaba.fastjson.JSON;
import com.hd.statutes.model.entity.Contents;
import com.hd.statutes.model.entity.Statute;
import com.hd.statutes.model.entity.Statutesplit;
import com.hd.statutes.model.entity.Statutestype;
import com.hd.statutes.service.laws.StatuteService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
public class StatuteController {
    @Resource
    private StatuteService statuteService;

    @GetMapping("getAllStatype") //
    @ResponseBody
    public String getAllStatype(){
        List<Statutestype> list=statuteService.getAllStatype();
        return JSON.toJSONString(list);
    }
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
    @GetMapping("getAllStaSplit")
    @ResponseBody
    public String getAllStaSplit(@RequestParam("statutestypeId") int statutestypeId){
        List<Statutesplit> list=statuteService.getAllStaSplit(statutestypeId);
        return JSON.toJSONString(list);
    }
    @RequestMapping("stasplitAdd")//添加法规分支页
    public String stasplitAdd(@RequestParam("statutestypeId") int statutestypeId,Model model){
        model.addAttribute("statutestypeId",statutestypeId);
        return "stasplit-add";
    }

    @GetMapping(value = "getAllStatutes")
    @ResponseBody
    public String getAllStatutes(@RequestParam(value = "statutestypeId",defaultValue = "0") int statutestypeId,
                                 @RequestParam(value = "statutesplitId",defaultValue = "0") int statutesplitId){
        List<Statute> list=statuteService.getAllStatutes(statutestypeId,statutesplitId);
        String listStr= JSON.toJSONString(list);
        //System.out.println(listStr);
        return listStr;
    }
    @GetMapping("stasplitlist")
    public String stasplitlist(@RequestParam("statutestypeId")int statutestypeId, Model model){
        Statutestype statutestype=statuteService.getStatutesTypeById(statutestypeId);
        //System.out.println(statutestype.getStatutestypeName());
        model.addAttribute("statutestype",statutestype);
        return "statusplit-list";
    }
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
    @PostMapping(value = "addStatute",produces = "text/html;charset=utf-8")
    @ResponseBody
    public String addStatute(Statute sta, MultipartFile icofile) {
        StringBuffer txpath=new StringBuffer();
        if(!icofile.isEmpty()) {
            //原文件名
            String oldFileName=icofile.getOriginalFilename();
            String fileName= sta.getStatuteId()+"--"+UUID.randomUUID().toString().substring(2,7);
            fileName+=System.currentTimeMillis()+oldFileName;
            File file=new File("D:/File",fileName);
                if(!file.exists()) {
                    file.mkdir();
                }
                try {
                    icofile.transferTo(file);
                    txpath.append("/File/"+file.getName());
                    sta.setStatuteIconpath(txpath.toString());
                } catch (IllegalStateException | IOException e) {
                    e.printStackTrace();
                }
            }
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
   @RequestMapping("getAllContentsByStatuteId")
   @ResponseBody
   public String getAllContentsByStatuteId(@RequestParam(value = "contentsLevel",defaultValue = "0")int contentsLevel,
                                             @RequestParam(value = "conId",defaultValue = "0") int conId,
                                             @RequestParam(value = "staId",defaultValue = "0") int staId ){
       List<Contents> list=statuteService.getAllContentsByStatuteId(contentsLevel,conId,staId);
       String listStr=JSON.toJSONString(list);
       System.out.println(listStr);
       return listStr;
    }
    @PostMapping("addContents")
    @ResponseBody
    public String addContents(Contents contents){
        /*System.out.println(contents.getContentsName());
        System.out.println(contents.getConId());*/
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

}

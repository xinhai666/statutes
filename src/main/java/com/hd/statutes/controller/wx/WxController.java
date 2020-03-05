package com.hd.statutes.controller.wx;

import com.alibaba.fastjson.JSON;
import com.hd.statutes.model.entity.*;
import com.hd.statutes.model.vo.ClauseVO;
import com.hd.statutes.model.vo.StatuteVO;
import com.hd.statutes.service.laws.StatuteService;
import com.hd.statutes.service.users.UsersService;
import com.hd.statutes.utils.MD5;
import com.hd.statutes.utils.RedisUtils;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.annotations.ApiIgnore;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.*;

@RestController
public class WxController {
    @Autowired
    private StatuteService statuteService;
    @Autowired
    private UsersService usersService;
    @Resource
    private RedisUtils redisUtils;

    /**
     * 加载所有法规
     * @param statutestypeId
     * @param statutesplitId
     * @return
     */
    @ApiOperation(value="加载所有法规", notes="进入小程序自动加载所有法规，展示在首页")
    @PostMapping(value = "wxCheckAllStatutes")
    public String wxCheckAllStatutes(@RequestParam(value = "statutestypeId",defaultValue = "0") int statutestypeId,
                                 @RequestParam(value = "statutesplitId",defaultValue = "0") int statutesplitId){
        List<StatuteVO> list=statuteService.getAllStatutes(statutestypeId,statutesplitId);
        String listStr= JSON.toJSONString(list);
        System.out.println(listStr);
        return listStr;
    }
    @ApiIgnore
    @PostMapping(value = "wxLogin")
    public String wxLogin(Admins admins, HttpServletRequest request){
       Admins admins1=usersService.adminLogin(admins);
       if(admins1!=null){
           return "欢迎 "+admins1.getAdminName()+" 登录";
       }else {
           return "账号或密码错误";
       }
    }

    /**
     * 模糊查询法规
     * @param statuteName
     * @return
     */
    @ApiOperation(value="模糊查询法规", notes="输如关键字，模糊匹配法规名或关键字")
    @ApiImplicitParam(name = "statuteName", value = "要搜索的关键字",dataType = "String",example = "运输")
    @PostMapping("checkStatuteByName")
    public ResponseEntity<JsonResult> checkStatuteByName(@RequestParam(value = "statuteName",defaultValue = "") String statuteName){
        JsonResult r = new JsonResult();
        try {
            List<Statute> list=statuteService.checkStatuteByName(statuteName);
            r.setStatus("ok");
            if(list.size()>0){
               r.setResult(list);
            }else {
                Statute statute=new Statute();
                statute.setStatuteName("没有找到您需求的数据");
                list.add(statute);
                r.setResult(list);
            }
        } catch (Exception e) {
            r.setStatus("error");
            e.printStackTrace();
        }
        return ResponseEntity.ok(r);
    }

    /**
     * 查询一个条款
     * @param clauseId
     * @return
     */
    @ApiOperation(value="根据id查询条款", notes="提供条款id，查询该条款详细信息")
    @ApiImplicitParam(name = "clauseId", value = "条款id编号",dataType = "Integer",example = "5")
    @PostMapping("wxcheckClauseById")
    public ResponseEntity<JsonResult> wxcheckClauseById(@RequestParam("clauseId")int clauseId){
        JsonResult r=new JsonResult();
        try {
            ClauseVO clauseVO=statuteService.checkClauseById(clauseId);
            r.setStatus("ok");
            if(clauseVO!=null){
                r.setResult(clauseVO);
            }else {
                r.setResult("未查到");
            }
        } catch (Exception e) {
            r.setStatus("error");
            e.printStackTrace();
        }
        return ResponseEntity.ok(r);
    }

    /**
     * 根据法规查所有目录
     * @param contentsLevel
     * @param conId
     * @param staId
     * @return
     */
    @ApiOperation(value="查询某法规的所有目录", notes="提供法规id，查询该法规的所有目录")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "staId", value = "法规的id",required =false,defaultValue = "0",dataType = "Integer",example = "4"),
            @ApiImplicitParam(name = "contentsLevel", value = "目录所在层级",required =false,defaultValue = "0",dataType = "Integer",example = "0"),
            @ApiImplicitParam(name = "conId", value = "父级目录id",required =false,defaultValue = "0",dataType = "Integer",example = "0")
    })
    @PostMapping("wxgetAllContentsBystaId")
    public ResponseEntity<JsonResult> wxgetAllContentsBystaId(@RequestParam(value = "contentsLevel",defaultValue = "0")int contentsLevel,
                                            @RequestParam(value = "conId",defaultValue = "0") int conId,
                                            @RequestParam(value = "staId",defaultValue = "0") int staId ){
        JsonResult r=new JsonResult();
        String listStr= null;
        try {
            List<Contents> list=statuteService.getAllContentsByStatuteId(contentsLevel,conId,staId);
            r.setStatus("ok");
            r.setResult(list);
        } catch (Exception e) {
            r.setStatus("error");
            e.printStackTrace();
        }
        return ResponseEntity.ok(r);
    }

    /**
     * 用户登录
     * @param userPhone
     * @param password
     * @return
     */
    @ApiOperation(value="用户登录", notes="输入用户手机号、密码登录，手机号、密码正确则返回该用户信息，否则返回空字符串")
    @ApiImplicitParams({
            @ApiImplicitParam(name="userPhone",value = "用户手机号",dataType = "String",example = "13810770045"),
            @ApiImplicitParam(name="password",value = "登录密码",dataType = "String",example = "111111"),
    })
    @PostMapping("wxUserLogin")
    public ResponseEntity<JsonResult> wxUserLogin(@RequestParam("userPhone") String userPhone, @RequestParam("password") String password){
        JsonResult r=new JsonResult();
        try {
            Users user=usersService.userLogin(userPhone,password);
            r.setStatus("ok");
            if(user!=null){
                Map<String,Object> map=new HashMap<>();
                //r.setResult(user);
                //登录成功生成token
                String token = this.createToken(user);
                map.put("token",token);
                map.put("user",user);
                r.setResult(map);
                //保存到redis
                this.saveToken(token, user);
            }else {
                r.setResult("");
            }
        } catch (Exception e) {
            r.setResult("error");
            e.printStackTrace();
        }
        return ResponseEntity.ok(r);
    }
    //生成token字符串
    private String createToken(Users user) {
        StringBuilder builder = new StringBuilder();
        builder.append("us"+user.getUserId()+"-token-");
        String info = MD5.getMD5(user.getUserId().toString(), 32);
        builder.append(info + "-");
        builder.append(new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()));
        builder.append(UUID.randomUUID().toString().substring(0, 6));
        return builder.toString();
    }
    //保存token到redis服务器
    private void saveToken(String token, Users user) {

        String tokenKey = ("user" + user.getUserId());
        String tokenValue = null;
        //确保登录信息唯一
        if ((tokenValue = (String) redisUtils.get(tokenKey)) != null) {
            redisUtils.delete(tokenKey);
            redisUtils.delete(tokenValue);
        }
        redisUtils.setReids(tokenKey, token, 30000);
        redisUtils.setReids(token, JSON.toJSONString(user), 30000);
    }

    /**
     * 查询用户咨询历史
     * @param userId
     * @param request
     * @return
     */
    @ApiOperation(value="查询某用户咨询历史", notes="提供用户ID号，返回该用户的所有咨询")
    @ApiImplicitParam(name = "userId", value = "用户的Id号",dataType = "Integer",example = "1")
    @PostMapping(value = "wxGetAllConsultsByUserId")
    public ResponseEntity<JsonResult> wxGetAllConsultsByUserId(@RequestParam(value = "userId",defaultValue = "0") int userId, HttpServletRequest request){
        JsonResult r=new JsonResult();
        try {
            List<Consults> consultsList=usersService.getAllConsultsByUserId(userId);
            r.setStatus("ok");
            r.setResult(consultsList);
        } catch (Exception e) {
            r.setStatus("error");
            e.printStackTrace();
        }
        return ResponseEntity.ok(r);
    }

    /**
     * 用户注册
     * @param userName
     * @param userPhone
     * @param password
     * @return
     */
    @ApiOperation(value="注册新用户", notes="输入新注册的用户名、手机号、密码登录，注册一个新用户")
    @ApiImplicitParams({
            @ApiImplicitParam(name="userName",value = "用户名称",dataType = "String",example = "小辣椒"),
            @ApiImplicitParam(name="userPhone",value = "用户手机号",dataType = "String",example = "13810661212"),
            @ApiImplicitParam(name="password",value = "登录密码",dataType = "String",example = "111111"),
    })
    @PostMapping("wxAddUsers")
    public ResponseEntity<JsonResult> wxAddUsers(@RequestParam("userName")String userName, @RequestParam("userPhone")String userPhone, @RequestParam("password")String password){
        JsonResult r=new JsonResult();
        try {
            int num=usersService.addUsers(userName,userPhone,password);
                r.setStatus("ok");
            if(num>0){
                r.setResult("注册完成");
            }else {
                r.setResult("注册失败");
            }
        } catch (Exception e) {
            r.setStatus("error");
            e.printStackTrace();
        }
        return ResponseEntity.ok(r);
    }

    /**
     * 收藏条款
     * @param userId
     * @param claId
     * @return
     */
    @ApiOperation(value="用户收藏条款", notes="提供用户id和条款id，添加用户收藏该条款的记录")
    @ApiImplicitParams({
            @ApiImplicitParam(name="userId",value = "用户的id",dataType = "Integer",example = "1"),
            @ApiImplicitParam(name="claId",value = "条款的id",dataType = "Integer",example = "8"),
    })
    @PutMapping("wxAddCollects")
    public ResponseEntity<JsonResult> wxAddCollects(@RequestParam("userId") int userId,@RequestParam("claId") int claId){
        JsonResult r=new JsonResult();
        try {
            if(statuteService.checkClauseVOByUserId(userId,claId).size()>0){
                r.setStatus("warn");
                r.setResult("您已收藏过该条款，无需重复收藏！");
                return ResponseEntity.ok(r);
            }else if(statuteService.wxAddCollects(userId,claId)>0) {
                r.setStatus("ok");
                r.setResult("添加收藏成功");
            }
        } catch (Exception e) {
            r.setStatus("error");
            e.printStackTrace();
        }
        return ResponseEntity.ok(r);
    }
    @ApiOperation(value="查询用户收藏的条款", notes="提供用户id，查询用户收藏的所有条款;claId用于收藏条款时查询曾经是否收藏过该条款")
    @ApiImplicitParams({
            @ApiImplicitParam(name="userId",value = "用户的id",dataType = "Integer",example = "1"),
            @ApiImplicitParam(name="claId",value = "条款的id",required = false,defaultValue = "0",dataType = "Integer",example = "0"),
    })
    @GetMapping("checkClauseVOByUserId")
    public ResponseEntity<JsonResult> checkClauseVOByUserId(@RequestParam("userId") int userId,@RequestParam(value = "claId",defaultValue = "0") int claId){
        JsonResult r=new JsonResult();
        try {
            List<ClauseVO> list=statuteService.checkClauseVOByUserId(userId,claId);
            r.setStatus("ok");
            r.setResult(list);
        } catch (Exception e) {
            r.setStatus("error");
            e.printStackTrace();
        }
        return ResponseEntity.ok(r);
    }
    @ApiOperation(value="用户提交意见反馈", notes="输入意见内容，提交到网站后台")
    @ApiImplicitParam(name="opinionContent",value = "用户的意见内容",dataType = "String")
    @PostMapping("addOpinions")
    public ResponseEntity<JsonResult> addOpinions(String opinionContent){
        JsonResult r=new JsonResult();
        try {
            statuteService.addOpinions(opinionContent);
            r.setStatus("ok");
            r.setResult("提交意见反馈成功！");
        } catch (Exception e) {
            r.setStatus("error");
            e.printStackTrace();
        }
        return ResponseEntity.ok(r);
    }
    @ApiOperation(value="模糊查找条款", notes="输入要查找的条款号或关键字，返回模糊查找到的条款集合,不输入任何内容则查询所有")
    @ApiImplicitParam(name="keyword",value = "条款号、关键字",dataType = "String",defaultValue = "许可")
    @PostMapping(value = "wxLoadAllClause")
    public ResponseEntity<JsonResult> wxLoadAllClause(@RequestParam(value = "keyword",defaultValue = "") String keyword){
        JsonResult r=new JsonResult();
        try {
            List<ClauseVO> list=statuteService.wxLoadAllClause(keyword);
            r.setStatus("ok");
            r.setResult(list);
        } catch (Exception e) {
            r.setStatus("error");
            e.printStackTrace();
        }
        return ResponseEntity.ok(r);
    }
}

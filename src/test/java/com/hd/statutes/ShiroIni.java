package com.hd.statutes;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.mgt.DefaultSecurityManager;
import org.apache.shiro.realm.text.IniRealm;
import org.apache.shiro.subject.Subject;
import org.junit.Assert;
import org.junit.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class ShiroIni {
    //创建IniRealm，加载ini文件
    IniRealm iniRealm=new IniRealm("classpath:users.ini");

    @Test
    public void testIni(){
        //构建SecurityManager环境,将iniRealm设置到SecurityManager环境中
        DefaultSecurityManager securityManager=new DefaultSecurityManager();
        securityManager.setRealm(iniRealm);
        //得到 SecurityManager 实例 并绑定给 SecurityUtils
        SecurityUtils.setSecurityManager(securityManager);
        Subject subject=SecurityUtils.getSubject();
        //token中的username、password为用户登录输入的信息
        UsernamePasswordToken token=new UsernamePasswordToken("zhangsan","111111");
        try {
            subject.login(token);//身份验证
            subject.checkRole("zuzhang");// 角色验证
            subject.checkPermission("user:delete"); //权限验证
        } catch (AuthenticationException e) {
            //身份验证失败
            e.printStackTrace();
        }
       // Assert.assertEquals(true, subject.isAuthenticated()); //断言用户已经登录
        System.out.println("result:"+subject.isAuthenticated());// 输出验证结果

        //退出
        subject.logout();
    }
}

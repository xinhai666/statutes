package com.hd.statutes;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.mgt.DefaultSecurityManager;
import org.apache.shiro.realm.SimpleAccountRealm;
import org.apache.shiro.subject.Subject;
import org.junit.Before;
import org.junit.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class TestShiro {
    //创建简单的realm
    SimpleAccountRealm simpleAccountRealm=new SimpleAccountRealm();

    //认证之前在Realm中添加一个用户
    @Before
    public void addUser(){
        simpleAccountRealm.addAccount("13888888888","111111","admin","user");
    }

    @Test
    public void test(){
        //构建securitymanager环境
        DefaultSecurityManager securityManager=new DefaultSecurityManager();
        //加载realm认证逻辑
        securityManager.setRealm(simpleAccountRealm);

        //subject(主体)提交认证
        SecurityUtils.setSecurityManager(securityManager);
        Subject subject=SecurityUtils.getSubject();
        //传入登录数据
        UsernamePasswordToken token=new UsernamePasswordToken("13888888888","111111");
        //验证信息
        subject.login(token);
        //checkRole检查主体角色
        subject.checkRole("admin");
        //checkRoles检查主体权限
        //subject.checkRoles("admin","user");
        //验证结果，直接调用
        System.out.println("验证结果是："+subject.isAuthenticated());
    }
}

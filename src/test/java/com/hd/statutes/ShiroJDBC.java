package com.hd.statutes;

import com.alibaba.druid.pool.DruidDataSource;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.mgt.DefaultSecurityManager;
import org.apache.shiro.realm.jdbc.JdbcRealm;
import org.apache.shiro.subject.Subject;
import org.junit.Test;
import org.springframework.boot.test.context.SpringBootTest;


@SpringBootTest
public class ShiroJDBC {
    //数据源（DruidDataSource为数据库连接工具类，类似于c3p0，用在这里是为了方便测试）
    DruidDataSource dataSource=new DruidDataSource();
    //以下{}中的为数据库连接信息
    {
        dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
        dataSource.setUrl("jdbc:mysql://localhost:3306/statutes?useUnicode=true&characterEncoding=UTF-8&serverTimezone=GMT-8");
        dataSource.setUsername("root");
        dataSource.setPassword("000000");
    }

    @Test
    public void testJDBC(){
        //登录用户输入的验证信息
        UsernamePasswordToken token=new UsernamePasswordToken("13810770036","111111");
        //创建JdbcRealm
        JdbcRealm jdbcRealm=new JdbcRealm();
        //设置数据源
        jdbcRealm.setDataSource(dataSource);
        // 注意：验证权限必须是将jdbcRealm.setPermissionsLookupEnabled(true)设为ture，不然会验证失败。
        jdbcRealm.setPermissionsLookupEnabled(true);
        //准备SQL语句
        String sql="select password from admins where admin_phone=?";
        jdbcRealm.setAuthenticationQuery(sql);

        //构建SecurityManager环境,将jdbcRealm设置到SecurityManager环境中，验证用户登陆，以及角色和权限。
        DefaultSecurityManager securityManager=new DefaultSecurityManager();
        securityManager.setRealm(jdbcRealm);

        SecurityUtils.setSecurityManager(securityManager);
        Subject subject=SecurityUtils.getSubject();
        subject.login(token); //进行认证验证
        System.out.println("result:"+subject.isAuthenticated()); //认证结果（true或false）

    }
}

package com.hd.statutes.dao.usersDao;

import com.hd.statutes.model.entity.Admins;
import com.hd.statutes.model.entity.Consults;
import com.hd.statutes.model.entity.Users;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface UsersDao {
    //查询所有用户
    List<Users> getAllUsers();
    //查询所有咨询、某个用户所有咨询
    List<Consults> getAllConsultsByUserId(@Param("userId") int userId);
    //查询一个咨询
    Consults getConsultsById(@Param("consultId") int consultId);
    //删除咨询
    int delConsultById(@Param("consultId") int consultId);
    //添加管理员
    int addAdmin(Admins admins);
    //加载所有管理员
    List<Admins> getAllAdmin();
    //删除管理员
    int delAdminById(@Param("adminId") int adminId);
    //修改管理员
    int updateAdmins(Admins admins);
    //管理员登录
    Admins adminLogin(Admins admins);
    //用户登录
    Users userLogin(@Param("userPhone") String userPhone,@Param("password") String password);
    //用户注册
    int addUsers(@Param("userName")String userName,@Param("userPhone")String userPhone,@Param("password")String password);
    //根据登录手机号查管理员
    Admins findByPhone(@Param("adminPhone") String adminPhone);
}

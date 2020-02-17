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
}

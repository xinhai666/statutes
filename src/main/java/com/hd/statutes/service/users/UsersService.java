package com.hd.statutes.service.users;

import com.hd.statutes.model.entity.Admins;
import com.hd.statutes.model.entity.Consults;
import com.hd.statutes.model.entity.Users;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UsersService {
    /**
     * 查询所有用户
     * @return
     */
    List<Users> getAllUsers();

    /**
     * 根据用户查询所有咨询
     * @param userId
     * @return
     */
    List<Consults> getAllConsultsByUserId(int userId);

    /**
     * 查询一个咨询
     * @param consultsId
     * @return
     */
    Consults getConsultsById(int consultsId) ;

    /**
     * 删除一条咨询
     * @param consultId
     * @return
     */
    int delConsultById(int consultId);
    /**
     * 添加管理员
     * @param admins
     * @return
     */
    int addAdmin(Admins admins);

    /**
     * 所有管理员
     * @return
     */
    List<Admins> getAllAdmin();

    /**
     *  删除管理员
     * @param adminId
     * @return
     */
    int delAdminById(int adminId);

    /**
     * 修改管理员
     * @param admins
     * @return
     */
    int updateAdmins(Admins admins);

    /**
     * 管理员登录
     * @param admins
     * @return
     */
    Admins adminLogin(Admins admins);

    /**
     * 用户登录
     * @param userPhone
     * @param password
     * @return
     */
    Users userLogin(String userPhone,String password);

    /**
     * 用户注册
     * @param userName
     * @param userPhone
     * @param password
     * @return
     */
    int addUsers(String userName,String userPhone,String password);
}

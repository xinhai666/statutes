package com.hd.statutes.service.users;

import com.hd.statutes.model.entity.Admins;
import com.hd.statutes.model.entity.Consults;
import com.hd.statutes.model.entity.Users;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UsersService {
    List<Users> getAllUsers();
    List<Consults> getAllConsultsByUserId(int userId);
    Consults getConsultsById(int consultsId) ;
    int delConsultById(int consultId);
    /**
     * 添加管理员
     * @param admins
     * @return
     */
    int addAdmin(Admins admins);
    //所有管理员
    List<Admins> getAllAdmin();
    //删除管理员
    int delAdminById(int adminId);
}

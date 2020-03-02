package com.hd.statutes.service.users.impl;

import com.hd.statutes.dao.usersDao.UsersDao;
import com.hd.statutes.model.entity.Admins;
import com.hd.statutes.model.entity.Consults;
import com.hd.statutes.model.entity.Users;
import com.hd.statutes.model.vo.ClauseVO;
import com.hd.statutes.service.users.UsersService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UsersServiceImpl implements UsersService {
    @Resource
    private UsersDao usersDao;

    @Override
    public List<Users> getAllUsers() {
        return usersDao.getAllUsers();
    }

    @Override
    public List<Consults> getAllConsultsByUserId(@Param("userId") int userId) {
        return usersDao.getAllConsultsByUserId(userId);
    }

    @Override
    public Consults getConsultsById(@Param("consultId") int consultsId) {
        return usersDao.getConsultsById(consultsId);
    }

    @Override
    public int delConsultById(int consultId) {
        return usersDao.delConsultById(consultId);
    }

    @Override
    public int addAdmin(Admins admins) {
        return usersDao.addAdmin(admins);
    }

    @Override
    public List<Admins> getAllAdmin() {
        return usersDao.getAllAdmin();
    }

    @Override
    public int delAdminById(int adminId) {
         return usersDao.delAdminById(adminId);
    }

    @Override
    public int updateAdmins(Admins admins) {
        return usersDao.updateAdmins(admins);
    }

    @Override
    public Admins adminLogin(Admins admins) {
        return usersDao.adminLogin(admins);
    }

    @Override
    public Users userLogin(String userPhone, String password) {
        return usersDao.userLogin(userPhone,password);
    }

    @Override
    public int addUsers(String userName, String userPhone, String password) {
        return usersDao.addUsers(userName,userPhone,password);
    }

}

package com.hd.statutes.service.others.impl;

import com.hd.statutes.dao.othersDao.OthersDao;
import com.hd.statutes.model.entity.Companyemail;
import com.hd.statutes.model.entity.Opinions;
import com.hd.statutes.model.entity.Shortmessage;
import com.hd.statutes.model.entity.Sites;
import com.hd.statutes.service.others.OthersService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class OthersServiceImpl implements OthersService {
    @Resource
    private OthersDao othersDao;

    @Override
    public List<Opinions> getAllOpinions() {
        return othersDao.getAllOpinions();
    }

    @Override
    public Opinions getOpinionsById(int opinionId) {
        return othersDao.getOpinionsById(opinionId);
    }

    @Override
    public int delOpinionById(int opinionId) {
        return othersDao.delOpinionById(opinionId);
    }

    @Override
    public String getCompanyContent(int companyType) {
        return othersDao.getCompanyContent(companyType);
    }

    @Override
    public int updateCompany(String companyContent, int companyType) {
        return othersDao.updateCompany(companyContent,companyType);
    }

    @Override
    public int addCompanyemail(Companyemail companyemail) {
        return othersDao.addCompanyemail(companyemail);
    }

    @Override
    public Companyemail getCompanyemail() {
        return othersDao.getCompanyemail();
    }

    @Override
    public Shortmessage getShormessage() {
        return othersDao.getShormessage();
    }

    @Override
    public int updateShortmessage(Shortmessage shortmessage) {
        return othersDao.updateShortmessage(shortmessage);
    }

    @Override
    public Sites getSites() {
        return othersDao.getSites();
    }

    @Override
    public int updateSites(Sites sites) {
        return othersDao.updateSites(sites);
    }


}

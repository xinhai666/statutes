package com.hd.statutes.dao.othersDao;

import com.hd.statutes.model.entity.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface OthersDao {
    List<Opinions> getAllOpinions();
    Opinions getOpinionsById(@Param("opinionId") int opinionId);
    int delOpinionById(@Param("opinionId") int opinionId);
    String getCompanyContent(@Param("companyType") int companyType);
    int updateCompany(@Param("companyContent") String companyContent,@Param("companyType") int companyType);
    int addCompanyemail(Companyemail companyemail);
    Companyemail getCompanyemail();
    Shortmessage getShormessage();
    int updateShortmessage(Shortmessage shortmessage);
    Sites getSites();
    int updateSites(Sites sites);
}

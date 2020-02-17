package com.hd.statutes.service.others;

import com.hd.statutes.model.entity.Companyemail;
import com.hd.statutes.model.entity.Opinions;
import com.hd.statutes.model.entity.Shortmessage;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OthersService {
    List<Opinions> getAllOpinions();
    Opinions getOpinionsById(int opinionId);
    int delOpinionById(int opinionId);
    String getCompanyContent(int companyType);
    int updateCompany(String companyContent,int companyType);
    int addCompanyemail(Companyemail companyemail);
    Companyemail getCompanyemail();
    Shortmessage getShormessage();
    int updateShortmessage(Shortmessage shortmessage);
}

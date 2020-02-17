package com.hd.statutes.model.entity;


import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Consults {
  private Integer consultId;
  private Integer userId;
  private String consultUserName;
  private String consultPhone;
  private String consultContent;
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  @JSONField(format = "yyyy-MM-dd")
  private Date consultCreatetime;
  private String consultWorkunit;
  private String consultEmail;
  private String consultWechat;
  private String consultClauseNumbers;

  public String getConsultPhone() {
    return consultPhone;
  }

  public void setConsultPhone(String consultPhone) {
    this.consultPhone = consultPhone;
  }

  public Integer getConsultId() {
    return consultId;
  }

  public void setConsultId(Integer consultId) {
    this.consultId = consultId;
  }


  public Integer getUserId() {
    return userId;
  }

  public void setUserId(Integer userId) {
    this.userId = userId;
  }


  public String getConsultUserName() {
    return consultUserName;
  }

  public void setConsultUserName(String consultUserName) {
    this.consultUserName = consultUserName;
  }


  public String getConsultContent() {
    return consultContent;
  }

  public void setConsultContent(String consultContent) {
    this.consultContent = consultContent;
  }


  public Date getConsultCreatetime() {
    return consultCreatetime;
  }

  public void setConsultCreatetime(Date consultCreatetime) {
    this.consultCreatetime = consultCreatetime;
  }


  public String getConsultWorkunit() {
    return consultWorkunit;
  }

  public void setConsultWorkunit(String consultWorkunit) {
    this.consultWorkunit = consultWorkunit;
  }


  public String getConsultEmail() {
    return consultEmail;
  }

  public void setConsultEmail(String consultEmail) {
    this.consultEmail = consultEmail;
  }


  public String getConsultWechat() {
    return consultWechat;
  }

  public void setConsultWechat(String consultWechat) {
    this.consultWechat = consultWechat;
  }


  public String getConsultClauseNumbers() {
    return consultClauseNumbers;
  }

  public void setConsultClauseNumbers(String consultClauseNumbers) {
    this.consultClauseNumbers = consultClauseNumbers;
  }

}

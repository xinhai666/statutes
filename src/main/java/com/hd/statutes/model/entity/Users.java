package com.hd.statutes.model.entity;


import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Users {

  private Integer userId;
  private String userName;
  private String userPhone;
  private Integer userSex;
  private Integer userMember;
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  @JSONField(format = "yyyy-MM-dd")
  private Date userCreatetime;


  public Integer getUserId() {
    return userId;
  }

  public void setUserId(Integer userId) {
    this.userId = userId;
  }


  public String getUserName() {
    return userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }


  public String getUserPhone() {
    return userPhone;
  }

  public void setUserPhone(String userPhone) {
    this.userPhone = userPhone;
  }


  public Integer getUserSex() {
    return userSex;
  }

  public void setUserSex(Integer userSex) {
    this.userSex = userSex;
  }


  public Integer getUserMember() {
    return userMember;
  }

  public void setUserMember(Integer userMember) {
    this.userMember = userMember;
  }


  public Date getUserCreatetime() {
    return userCreatetime;
  }

  public void setUserCreatetime(Date userCreatetime) {
    this.userCreatetime = userCreatetime;
  }

}

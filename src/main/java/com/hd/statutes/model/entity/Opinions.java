package com.hd.statutes.model.entity;


import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Opinions {

  private Integer opinionId;
  private String opinionContent;
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  private Date opinionCreatetime;


  public Integer getOpinionId() {
    return opinionId;
  }

  public void setOpinionId(Integer opinionId) {
    this.opinionId = opinionId;
  }


  public String getOpinionContent() {
    return opinionContent;
  }

  public void setOpinionContent(String opinionContent) {
    this.opinionContent = opinionContent;
  }


  public Date getOpinionCreatetime() {
    return opinionCreatetime;
  }

  public void setOpinionCreatetime(Date opinionCreatetime) {
    this.opinionCreatetime = opinionCreatetime;
  }

}

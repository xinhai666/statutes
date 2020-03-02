package com.hd.statutes.model.entity;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(description = "返回信息的类")
public class JsonResult {
    @ApiModelProperty(value = "执行的状态")
    private String status;
    @ApiModelProperty(value = "返回的结果")
    private Object result;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Object getResult() {
        return result;
    }

    public void setResult(Object result) {
        this.result = result;
    }
}

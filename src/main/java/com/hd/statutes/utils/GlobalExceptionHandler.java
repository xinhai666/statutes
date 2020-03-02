package com.hd.statutes.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;


//@ControllerAdvice
//public class GlobalExceptionHandler {
//    private static Logger exlog = LoggerFactory.getLogger(Exception.class);
//
//    /*
//     * 处理异常
//     * */
//    @ExceptionHandler(value = Exception.class)
//    public String ExceptionDeal(HttpServletRequest request,Exception e){
//        exlog.warn("捕获异常，异常信息："+e.getMessage());
//        return "404";
//    }
//}

package com.hd.statutes.controller;

import com.alibaba.fastjson.JSON;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.hd.statutes.utils.AlipayConfig;
import com.hd.statutes.utils.OrderCodeUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

@Controller
public class AliPayController {

    @RequestMapping("membervip")
    public String membervip(){
        return "member-vip";
    }

    @RequestMapping("/sendAlipay")
    @ResponseBody
    public void sendAlipay(HttpServletResponse httpResponse, HttpServletRequest request)throws AlipayApiException,Exception{
    AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
    //设置请求参数
    AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);

    //商户订单号，商户网站订单系统中唯一订单号，必填
    String out_trade_no = OrderCodeUtil.GetCode();
    System.out.println("订单号:"+out_trade_no);
    //付款金额，必填
    String total_amount =request.getParameter("WIDtotal_amount");
    //订单名称，必填
    String subject = request.getParameter("WIDsubject");
    //商品描述，可空
    String body = request.getParameter("WIDbody");

    alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","+
         "\"total_amount\":\""+ total_amount +"\","+
         "\"subject\":\""+ subject +"\","+
         "\"body\":\""+ body +"\","+
        "\"passback_params\":\"merchantBizType%3d3C%26merchantBizNo%3d2016010101111\"," +
        "\"extend_params\":{" +
        "\"sys_service_provider_id\":\"2088511846\"" +"},"+
         "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

    //请求
    String result = alipayClient.pageExecute(alipayRequest).getBody();
    //输出
    httpResponse.setContentType("text/html;charset=" + AlipayConfig.charset);
    httpResponse.getWriter().write(result);
    httpResponse.getWriter().flush();
    httpResponse.getWriter().close();
    }

    @RequestMapping("/callBack")
    public String callBack(HttpServletRequest request)throws Exception {
        Map<String, String> params = new HashMap<String, String>();
        Map<String, String[]> requestParams = request.getParameterMap();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext(); ) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            // 乱码解决，这段代码在出现乱码时使用
//            valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);
        }
        boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type); //调用SDK验证签名
        if(signVerified) {//验证成功
            return "goindex";
        }else {//验证失败
            return "404";
        }
    }
}

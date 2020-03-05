package com.hd.statutes.utils;

import org.springframework.context.annotation.Configuration;

@Configuration
public class AlipayConfig {
	  // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
		public static String app_id = "2016101600702725";
		
		// 商户私钥，您的PKCS8格式RSA2私钥
		public static String merchant_private_key = "MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQDtdENGDgdazqtvHIk/A5qpQOb0um1/cNl9F8iEZIG/ClZS/ANl1Jbzzg2ZppTAtu8X5yRzQEqor7WmsfFR0gLJEFsVMNPrADxlMxtIAkFBvYb3wL68ggjkWmAbe8nXcrwcFXWszh1t6w9u/nL1WwYNqx2J1KLCFai+3n+/yRxyYYjAg9Y5ss6KG7HgV4CG0+qv77dpAQgdGJ7CxT9fXbOAHIf+rDIe3UEt+VE4WBSsUqd9++SqKHV4FyfXtDhxjiE1sxy7He63Xy3ouUiPRgZu9VcEnch3/3/TrEKY8gT5l9FF2BzDqSZ+YKNDOEXFHiiTQssj5nfGN29pEDZkyU0jAgMBAAECggEAbDbe7c845NZo5HNBzPjshBPy7TcE7d5VD6BGHqfbRWAFpT36om62+JdANXToN8dmwSLyxp9XJvcktrpDewFViaItkEO3YFK0M36OAUwdx0MDfmdVxX0RZlgVkpDglJJSTg4tmbo5ST2lw/SsGUsJQDNqe8TvA7pxM8Mcvx99Glad+Bn4vTTN/gZo74+bQB7FY7/48VneqE/BGJoHDL6l8nnYTrBQ0QgpiPEinemeFVxoK+Btogko4/7ztLVBftwvCoSVJFISvi6ZHCqAfKvenmmgjnUNc5yCobB0evHqZIczAcFmKo/pQdfHvm6Qa6I73Je7IBVhtQUDAspnIkOgsQKBgQD9WCuqv2C4fDKuqQU/ln1TR1baYpMtdqQBES5uhxv1m8emNiVI2hbiOmu71IJNGO5wGnK9OYNCM9KAxop9xjvsO/MevUAXh4NGEPTjjDaJI6XNAPVLots2W2LqRH4KY2wASKalBw3BN3VrPa416fQax36kmeuc2UAD94ufVaqkKwKBgQDv8XOzy3X2y9Auhvy40eAjy0I1t+84nb5X1ZQ/VMihqCmf0oQNeJJWisETSQoBN9huNWiExPAFImmqipW3uD2pjFt2P5BhgkleHLN+sK/bSPXFlZaklKsjP6NIV0c3ad6TU8cA/WWldhYn+5xue1+/wWX9AP9BCoOnrzgrMRKm6QKBgQCByzJUAEhlO/wbT6zIryj2CY6NxALzP902Tr8jEUVZx725gfQIJvOiY5veVzmKlkNSW7p9B4If4LzwDMfXOEBq/yvHi93SMDMpKnbMPYGTMRg4t0z0uzLj3l4G96A7YkRqwM3froV1gBxAHRGrvXi6X4qaeeEkMomBfsmhkBokkQKBgQC1a0qgVuYKhHATvdy3oXhnl/enxjsKA7s3jjVY7TIFiLBwNyvBQ7jh1mfFvSPjZ+Ys7hTozj7souhiGga5soRs/cLp1YXFNE1k6y6MS+urUa8Chegw6He9XxCGUfd23oV7v4xoIzAHuxFlicjtgDsVMZV7hpV5CAojb0h439HKgQKBgQDlYAXfbuLirgdUfBCafdUMADkvftPzP/RgGTiVXtLpQeE87OCxM1/LGGOrSSR15wN9CKEHLl2/t2h7xgxKEWJTfvjMHXI7PKbZlun4kZrAbmYlSQtTv4vxl5us6oxyLAd5gWPCRNJGFRHTSsxY61ZmrtxWOp3kf3TdChO7buYQKg==";
		// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
	    public static String alipay_public_key ="MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAi28Njz6oIdg3cEp7xhaxjXxdGdN3QKnytpSPJEE0OlFT5XKTmUyXNbwZQmflV3v3SKrXjCWBEIrcqt37OV/v7pN6vmTQMufM/p/osyIUechhsOB12rjoNq/cSZarOskcbE+irMN81Il+dJnV+Bk5c3FXyOhhSnYRvWbp29DyhQ5arPBKD0bmtZ7ZpkbVdroB6oulXyraGQ93ZzWURackpK97k9m6gGVNKDpWjHtKenebcqXK1tCBqEyZ4887B7uISj4xd7JvJcESKc1gana5DBWgXqjLmfgrEulkOx3Y0kIYaxi0RnI1jxrGVJD8889AtyTy2w2erY8hhF1nVEU9lwIDAQAB";
		// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
		public static String notify_url = "http://localhost:8181/alipay.trade.page.pay-JAVA-UTF-8/notify_url.jsp";

		// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
		public static String return_url = "http://localhost:8181/callBack";

		// 签名方式
		public static String sign_type = "RSA2";
		
		// 字符编码格式
		public static String charset = "utf-8";
		
		// 支付宝网关
		public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
		
		// 支付宝网关
//		public static String log_path = "C:\\";
}

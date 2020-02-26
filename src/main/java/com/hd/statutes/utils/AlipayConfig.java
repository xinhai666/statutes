package com.hd.statutes.utils;

public class AlipayConfig {
	
	  // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
		public static String app_id = "2016101600702725";
		
		// 商户私钥，您的PKCS8格式RSA2私钥
		public static String merchant_private_key = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDXXI7x/jdWMXmQiWss8JPxmejU7poJi8+9kcNzVWECP5htsuP6lKy00fnc0xaJla8o6ssK2kudi7newk/Kq2bAfkGwSz75gzDaLB7lnA4swaZHaFl/ubA3+G9E92kCQpcyfB109PJSAQy9olM3V4YREAOI51bmIsM2MJB8GiuSfp9h8P/fI5epHgR5ASBCIL87hj0pA5tGoZfmDhEWgaih9Djb0nNoAU+VIMdgchHy0od9x3PPiK1euSYybO0lpjAbVU4ghWwU4YD8Zyih5UJkyE4u3b3bdff9nF2ls5JKh979qahv5owUUDt49IkO50rAygeO0zbQtJz0Su3B0/KvAgMBAAECggEBAILHzG6cCBKpnL7vFEyIE+9lnYShGJ2vb4oZGG3TbUOmRvRm7BbhbjeoQ2mcLlWCtonMe1ytz7lufoMN0NKsX4uJoG5kY2u2BVaX8HNS3zDCsC0w6xirNJ3omflxnS0oLxUTVfgOP5EY3hnSl2JGHj4CUYMzqQu8FHu15ifW5JrieMkvtqJWbH3pv5Yt2uN90kEbQ1xtPFyO+iuZCZFA6hZaZTfoE2Gz/y+vhAEK2Js2X9feVVLoV2kKm2UiIppRmfkY5bu7Norsn0PaYgVq061TcKx8cDiJQwogi1VmqVEyl7vEWIvP1GN6q68P41B0i1IXltBjUtHJVVfkIun/vcECgYEA7XedQEgMXznPu/jAKLhrVEObhMQmOlPOuTb01qgxhq5kguGBY+H/K+MXkO1vrNgJBGf+sHJHoPUWOp9+YthzHmP2gulCDbg3Pvb4ACjtb2A3qn0G1PaI4HFhoMspF+Dt2ggeC0UU/KqSrEEazZf5aGNA+p4WtgovPdNlDvkrkl8CgYEA6CtKwcbj3vuFAEpXHRG5tBmMi7P+S4rkUqu7p2HoeJAmkXcPVo1o4t70uIX6zo7zlimLLwk8MkPt181ayavlrz5K352cWpQrf4aMnqN37TW9lvIrh+y5w3QSW6jA571q4EqsHydk43beaLpXt2w5+2I2XI/S2sWK0a7kVYoaobECgYAbi45wEGtu+FPCaB5SGuJISfdWNTKB/YqzLU7FP4lPKBd8nw/VODfTLWpkY0Za9ExHeJCwgvEQGJ3Vev68FIN1+P51PP1uffnakec+jYDNNIoAerQ6K8bA0iYS8r33iR3N9rcVc5P1owuUc5DaXFCP7UNyTrgvsYq9TzIfxINrXQKBgGuLkkeM8AVckVF/HjdS/KjWpOoZ6JPptLYu4vA4RE2EyLjdY/d97bYZ/VZ0iaehRGisudKB/qZyHPy4HXQJ8o1o15oaElFLDZM3KnBZ3LW/DSGc8Fk4aRyG6fIXi7RNY/Kd5HlR8EQFziTJHNTUh09RQUlDPjMlCpby4sZVAN0hAoGBAIHvRuIRupv7rbz3gGG3Soy+Er5g/XQdzpwc3Bc4RVx+BvcsRnHGIWIeLZr2YtulxglhRNWDfSc+q3aIFR/k0laYdKBdEMtY7wqSkdtlGJV6+lnoirXiCovhZ1bsufGqxsuLgpBS7r7oeojjcjU6V02jqG7cYIwQStAZQBnel6DP";
		// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
	    public static String alipay_public_key ="MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAkDLFCMA6EPvgl65TuJ4iXtdKEkB7CEKToWj7lA6dX15HrW8JZ66aAYCAukthy7ZitDwIEiFykW7fIFnm6NA3JjqmCHYdMW/6D/ERPHPDkaJ2V2FII11qXLOXCTjaEjCEOIRJCA7hCGsVmeNp4Xf8IhvH4I2DqYxxwnMvRHPkJy3a47qzsG4m/k/nO/WY2CawxpxplbQL7rHqYPy/2IpMXa2qdsdqjcJgRv8tFrt7Zc8sr+NqqfceAgNi/7RsadNAJJmPfKKSoZDzlvYcmCondktpbHk20CGwSf3aY10sybzGbC2gZhF+0RG5YVn4JFjFGm5mKGUS/m96+ulOJFhKlwIDAQAB";
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

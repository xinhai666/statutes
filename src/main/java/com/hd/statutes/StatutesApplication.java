package com.hd.statutes;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@EnableTransactionManagement //开启声明式事务
@SpringBootApplication
@EnableSwagger2 //启用swagger2
public class StatutesApplication {
    public static void main(String[] args) {
        SpringApplication.run(StatutesApplication.class, args);
    }

}

package com.hd.statutes;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@EnableTransactionManagement //开启声明式事务
@SpringBootApplication
public class StatutesApplication {
    public static void main(String[] args) {
        SpringApplication.run(StatutesApplication.class, args);
    }

}

package com.quanxiaoha.weblog.admin.config;

import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

/**
 * @author: XXX
 * @url: www.XXX.com.com
 * @date: 2024-04-19 17:31
 * @description: 密码加密
 **/
@Component
public class PasswordEncoderConfig {

    @Bean
    public PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }

    public static void main(String[] args) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        System.out.println(encoder.encode("test"));;
    }
}

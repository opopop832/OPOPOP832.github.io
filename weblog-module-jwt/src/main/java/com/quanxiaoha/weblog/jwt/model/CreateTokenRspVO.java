package com.quanxiaoha.weblog.jwt.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author: XXX
 * @url: www.XXX.com.com
 * @date: 2024-04-19 16:06
 * @description: TODO
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CreateTokenRspVO {
    private String token;
}

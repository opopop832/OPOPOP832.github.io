package com.quanxiaoha.weblog.admin.model.vo.user;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;

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
public class UpdateAdminPasswordReqVO {
    @NotBlank(message = "用户名不能为空")
    private String username;
    @NotBlank(message = "密码不能为空")
    private String newPassword;
}

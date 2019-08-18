package com.xkygame.ssm.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author: Clarence
 * @Description:
 * @Date: 2019/2/1 10:25.
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class RoleDto {
    private long id; //角色id
    private String name;//角色名称
    private String rolecode; //角色功能
    private String adminName; // 管理员名称
}

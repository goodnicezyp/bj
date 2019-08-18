package com.xkygame.ssm.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @Author: Clarence
 * @Description: 一级 权限
 * @Date: 2019/2/1 14:10.
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PermissDto {
    private long pid;
    private String pname;
    private String paction;
    private List<Permiss2Dto> permissionList;
}

package com.xkygame.ssm.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @Author: Clarence
 * @Description: 二级权限
 * @Date: 2019/2/2 15:19.
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Permiss2Dto {
    private long pid_2;
    private String pname_2;
    private String paction_2;
    private List<Permiss3Dto> permissionList2;
}

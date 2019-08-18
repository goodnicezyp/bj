package com.xkygame.ssm.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author: Clarence
 * @Description: 三级权限
 * @Date: 2019/2/2 15:19.
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Permiss3Dto {
    private long pid_3;
    private String pname_3;
    private String paction_3;
}

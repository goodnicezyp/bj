package com.xkygame.ssm.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author: Clarence
 * @Description:
 * @Date: 2019/2/17 12:22.
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CountDataDto {
    private String dateTime;
    private int totalNum;
}

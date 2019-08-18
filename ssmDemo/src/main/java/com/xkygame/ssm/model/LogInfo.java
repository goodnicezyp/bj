package com.xkygame.ssm.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * Created by will on 2017/4/12.
 * version : 1.0.
 * desc : 日志信息类
 * Author will.
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class LogInfo {
    private long id;
    private String method; //方法名称
    private String params; //方法参数
    private String action;//操作
    private String ip; //Ip
    private String exceptioncode;  //异常码
    private String exceptiondetail; //异常信息
    private Date createTime;  //日期
    private String operator;  //操作人员
    private int type;  //操作类型 0：后台操作  1：用户操作
    private int fileFlag; //归档标记

}

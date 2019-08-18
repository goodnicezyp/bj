package com.xkygame.ssm.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Clarence on 2018/3/5.
 * version : 1.0.
 * desc :
 * Author will.
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Admin {
    private long id;
    private String adminName;
    private String adminPwd;
    private int flag;//0:禁用  1:可用
    private long roleid;
    private Date createTime; // 添加时间

    private String phone;
    private String email;
    private int sex; //0:男 1：女
    private String remark;// 描述 备注
    private List<Role> roleList = new ArrayList<Role>();
}

package com.xkygame.ssm.model;

import java.io.Serializable;
import java.util.List;

/**
 * Created by will on 2017/3/29.
 * version : 1.0.
 * desc :
 * Author will.
 */
public class Role implements Serializable {
    private static final long serialVersionUID = -4987248128309954399L;

    private long id; //角色id
    private String name;//角色名称
    private String rolecode; //角色功能
    private List<Permission> permissionList;

    public List<Permission> getPermissionList() {
        return permissionList;
    }

    public void setPermissionList(List<Permission> permissionList) {
        this.permissionList = permissionList;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRolecode() {
        return rolecode;
    }

    public void setRolecode(String rolecode) {
        this.rolecode = rolecode;
    }

}

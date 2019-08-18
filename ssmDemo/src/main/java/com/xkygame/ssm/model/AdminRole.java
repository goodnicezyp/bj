package com.xkygame.ssm.model;

/**
 * Created by will on 2017/4/10.
 * version : 1.0.
 * desc : 管理员-角色关联表
 * Author will.
 */
public class AdminRole {
    private long id;
    private long adminid;
    private long roleid;

    public AdminRole() {
    }

    public AdminRole(long id, long adminid, long roleid) {
        this.id = id;
        this.adminid = adminid;
        this.roleid = roleid;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getAdminid() {
        return adminid;
    }

    public void setAdminid(long adminid) {
        this.adminid = adminid;
    }

    public long getRoleid() {
        return roleid;
    }

    public void setRoleid(long roleid) {
        this.roleid = roleid;
    }
}

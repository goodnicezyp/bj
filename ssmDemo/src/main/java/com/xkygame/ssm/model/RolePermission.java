package com.xkygame.ssm.model;

/**
 * Created by will on 2017/4/10.
 * version : 1.0.
 * desc : 角色-权限关联表
 * Author will.
 */
public class RolePermission {
    private long id;
    private long roleid;
    private long permissionid;

    public RolePermission() {
    }

    public RolePermission(long id, long roleid, long permissionid) {
        this.id = id;
        this.roleid = roleid;
        this.permissionid = permissionid;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getRoleid() {
        return roleid;
    }

    public void setRoleid(long roleid) {
        this.roleid = roleid;
    }

    public long getPermissionid() {
        return permissionid;
    }

    public void setPermissionid(long permissionid) {
        this.permissionid = permissionid;
    }
}

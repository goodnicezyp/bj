package com.xkygame.ssm.service;

import com.xkygame.ssm.model.RolePermission;
import org.apache.ibatis.annotations.Param;

/**
 * Created by will on 2017/4/10.
 * version : 1.0.
 * desc :
 * Author will.
 */
public interface RolePermissionService {
    void create(RolePermission rolePermission);

    void deleteByRoleId(@Param("roleid") Long roleid);

    void createByPermissions(Long roleid, String permissions);

    void deleteByRoleIds(long[] ids);

}

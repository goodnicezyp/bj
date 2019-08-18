package com.xkygame.ssm.dao;

import com.xkygame.ssm.model.RolePermission;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * Created by will on 2017/4/10.
 * version : 1.0.
 * desc :
 * Author will.
 */
@Repository
public interface RolePermissionDao {
    void create(RolePermission rolePermission);

    void deleteByRoleId(@Param("roleid") Long roleid);

    void deleteByRoleIds(@Param("idArr") long[] ids);

}

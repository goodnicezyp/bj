package com.xkygame.ssm.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.xkygame.ssm.dao.RolePermissionDao;
import com.xkygame.ssm.model.Permission;
import com.xkygame.ssm.model.RolePermission;
import com.xkygame.ssm.service.PermissionService;
import com.xkygame.ssm.service.RolePermissionService;
import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * Created by will on 2017/4/10.
 * version : 1.0.
 * desc :
 * Author will.
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class RolePermissionServiceImpl implements RolePermissionService{
    @Resource
    private RolePermissionDao rolePermissionDao;
    @Resource
    private PermissionService permissionService;
    private Logger logger = LoggerFactory.getLogger(this.getClass());


    public void create(RolePermission rolePermission) {
        rolePermissionDao.create(rolePermission);
    }

    public void deleteByRoleId(@Param("roleid") Long roleid) {
        rolePermissionDao.deleteByRoleId(roleid);
    }

    public void createByPermissions(Long roleid, String permissions) {
        if (null != permissions) {
            JSONArray jsonArray = JSONArray.parseArray(permissions);
            for (int i=0;i<jsonArray.size();i++) {
                String permissionStr = jsonArray.getString(i);
                Permission permission = permissionService.selectByAction(permissionStr);

                if (permission != null) {
                    RolePermission rolePermission = new RolePermission();
                    rolePermission.setRoleid(roleid);
                    rolePermission.setPermissionid(permission.getPid());

                    rolePermissionDao.create(rolePermission);
                }
            }
        }
    }

    public void deleteByRoleIds(long[] ids) {
        rolePermissionDao.deleteByRoleIds(ids);
    }


}

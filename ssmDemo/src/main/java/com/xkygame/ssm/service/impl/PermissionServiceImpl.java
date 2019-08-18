package com.xkygame.ssm.service.impl;

import com.xkygame.ssm.dao.PermissionDao;
import com.xkygame.ssm.dto.PermissDto;
import com.xkygame.ssm.model.Permission;
import com.xkygame.ssm.service.PermissionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by will on 2017/4/10.
 * version : 1.0.
 * desc :
 * Author will.
 */
@Service
public class PermissionServiceImpl implements PermissionService {
    @Resource
    private PermissionDao permissionDao;

    public Permission selectByAction(String action) {
        return permissionDao.selectByAction(action);
    }

    public List<Permission> findByPage(Map<String, Object> map, int pageNo, int pageSize) {
        return permissionDao.findByPage(map,pageNo,pageSize);
    }

    public Integer total(Map<String, Object> map) {
        return permissionDao.total(map);
    }

    public void create(Permission permission) {
        permissionDao.create(permission);
    }

    public Permission findByID(long id) {
        return permissionDao.findByID(id);
    }

    public void update(Permission permission) {
        permissionDao.update(permission);
    }

    public void delPermissionByIds(long[] ids) {
        permissionDao.delPermissionByIds(ids);
    }

    public List<Permission> findAll() {
        return permissionDao.findAll();
    }

    public List<PermissDto> findAllGroup() {
        return permissionDao.findAllGroup();
    }
}

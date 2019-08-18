package com.xkygame.ssm.service;

import com.xkygame.ssm.dto.PermissDto;
import com.xkygame.ssm.model.Permission;

import java.util.List;
import java.util.Map;

/**
 * Created by will on 2017/4/10.
 * version : 1.0.
 * desc :
 * Author will.
 */
public interface PermissionService {
    Permission selectByAction(String action);

    List<Permission> findByPage(Map<String, Object> map, int pageNo, int pageSize);

    Integer total(Map<String, Object> map);

    void create(Permission permission);

    Permission findByID(long id);

    void update(Permission permission);

    void delPermissionByIds(long[] ids);

    List<Permission> findAll();

    List<PermissDto> findAllGroup();
}

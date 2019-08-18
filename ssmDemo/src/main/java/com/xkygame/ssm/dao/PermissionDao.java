package com.xkygame.ssm.dao;

import com.xkygame.ssm.dto.PermissDto;
import com.xkygame.ssm.model.Permission;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by will on 2017/4/10.
 * version : 1.0.
 * desc :
 * Author will.
 */
@Repository
public interface PermissionDao {
    Permission selectByAction(@Param("action") String action);

    List<Permission> findByPage(@Param("map") Map<String, Object> map, @Param("pageNo") int pageNo, @Param("pageSize") int pageSize);

    Integer total(@Param("map") Map<String, Object> map);

    void create(Permission permission);

    Permission findByID(@Param("id") long id);

    void update(Permission permission);

    void delPermissionByIds(@Param("idArr") long[] ids);

    List<Permission> findAll();

    List<PermissDto> findAllGroup();
}

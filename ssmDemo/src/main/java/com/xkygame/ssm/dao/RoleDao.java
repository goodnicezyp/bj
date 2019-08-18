package com.xkygame.ssm.dao;

import com.xkygame.ssm.model.Role;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by will on 2017/4/5.
 * version : 1.0.
 * desc :
 * Author will.
 */
@Repository
public interface RoleDao {
    void create(Role role);

    void update(Role role);

    void delete(@Param("idarr") long[] idarr);

    Role selectRoleById(@Param("roleid") Long roleid);

    List<Role> selectAllRole();

    List<Role> selectRoleByPage(@Param("pageNo") Integer pageNo, @Param("pageSize") Integer pageSize);

    /**
     * 统计所有条数
     * @return
     */
    int total();

    long[] selectAdminsByRoleIds(@Param("idArr") long[] ids);
}

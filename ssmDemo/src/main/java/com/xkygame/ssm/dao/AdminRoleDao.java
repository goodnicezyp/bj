package com.xkygame.ssm.dao;

import com.xkygame.ssm.model.AdminRole;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by will on 2017/4/10.
 * version : 1.0.
 * desc :
 * Author will.
 */
@Repository
public interface AdminRoleDao {
    void create(AdminRole adminRole);

    void delete(@Param("adminid") Long adminid);

    List<Long> selectAdminsByRoleIds(@Param("idArr") long[] ids);
}

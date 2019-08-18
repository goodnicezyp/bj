package com.xkygame.ssm.service;

import com.xkygame.ssm.model.AdminRole;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by will on 2017/4/10.
 * version : 1.0.
 * desc :
 * Author will.
 */
public interface AdminRoleService {
    void create(AdminRole adminRole);

    void delete(@Param("adminid") Long adminid);

    List<Long> selectAdminsByRoleIds(long[] ids);
}

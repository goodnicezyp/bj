package com.xkygame.ssm.service.impl;

import com.xkygame.ssm.dao.AdminRoleDao;
import com.xkygame.ssm.model.AdminRole;
import com.xkygame.ssm.service.AdminRoleService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by will on 2017/4/10.
 * version : 1.0.
 * desc :
 * Author will.
 */
@Service
public class AdminRoleServiceImpl implements AdminRoleService{
    @Resource
    private AdminRoleDao adminRoleDao;

    public void create(AdminRole adminRole) {
        adminRoleDao.create(adminRole);
    }

    public void delete(@Param("adminid") Long adminid) {
        adminRoleDao.delete(adminid);
    }

    public List<Long> selectAdminsByRoleIds(long[] ids) {
        return adminRoleDao.selectAdminsByRoleIds(ids);
    }
}

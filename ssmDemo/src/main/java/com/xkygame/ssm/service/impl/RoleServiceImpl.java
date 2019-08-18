package com.xkygame.ssm.service.impl;

import com.xkygame.ssm.dao.RoleDao;
import com.xkygame.ssm.model.Role;
import com.xkygame.ssm.service.RoleService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by will on 2017/4/6.
 * version : 1.0.
 * desc :
 * Author will.
 */
@Service
public class RoleServiceImpl implements RoleService {
    @Resource
    private RoleDao roleDao;

    public void create(Role role) {
        roleDao.create(role);
    }

    public void update(Role role) {
        roleDao.update(role);
    }

    public void delete(@Param("idarr") long[] idarr) {
        roleDao.delete(idarr);
    }

    public Role selectRoleById(@Param("roleid") Long roleid) {
        return roleDao.selectRoleById(roleid);
    }

    public List<Role> selectAllRole() {
        return roleDao.selectAllRole();
    }

    public List<Role> selectRoleByPage(@Param("pageNo") Integer pageNo, @Param("pageSize") Integer pageSize) {
        return roleDao.selectRoleByPage(pageNo, pageSize);
    }

    public int total() {
        return roleDao.total();
    }

}

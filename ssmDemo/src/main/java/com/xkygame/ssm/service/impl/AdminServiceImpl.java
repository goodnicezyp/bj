package com.xkygame.ssm.service.impl;

import com.xkygame.ssm.dao.AdminDao;
import com.xkygame.ssm.dao.AdminRoleDao;
import com.xkygame.ssm.model.Admin;
import com.xkygame.ssm.model.SessionUser;
import com.xkygame.ssm.service.AdminService;
import com.xkygame.ssm.utils.MD5;
import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.util.WebUtils;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by will on 2017/3/5.
 * version : 1.0.
 * desc :
 * Author will.
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class AdminServiceImpl implements AdminService{
    @Resource
    private AdminDao adminDao;
    @Resource
    private AdminRoleDao adminRoleDao;
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    public void create(Admin admin) {
        adminDao.create(admin);
    }

    public void delete(@Param("adminid") Long adminid) {
        try {
            adminDao.delete(adminid);
            adminRoleDao.delete(adminid);
        } catch (Exception e) {
            logger.error("删除管理员出错");
        }
    }

    public void update(Admin admin) {
        adminDao.update(admin);
    }

    public Boolean adminLogin(String name, String password, HttpServletRequest request) {
        if (StringUtils.isEmpty(name) || StringUtils.isEmpty(password)) {
            return false;
        }

        Admin admin = adminDao.getAdminByName(name);

        if (null == admin){
            return false;
        }

        MD5 md5 = new MD5();
        password = md5.toDigest(password);

        if (StringUtils.equals(password, admin.getAdminPwd())){
            SessionUser sessionUser = new SessionUser(admin.getId(),admin.getAdminName(),null, "",null,0);
            WebUtils.setSessionAttribute(request, "adminUser", sessionUser);
            return true;
        }else{
            return false;
        }
    }

    public Admin getAdminByName(@Param("name") String name) {
        return adminDao.getAdminByName(name);
    }

    public List<Admin> selectAdmin(Map<String, Object> map, @Param("pageNo") Integer pageNo, @Param("pageSize") Integer pageSize) {
        return adminDao.selectAdmin(map,pageNo, pageSize);
    }

    public int total() {
        return adminDao.total();
    }

    public Admin findAdminById(@Param("id") long id) {
        return adminDao.findAdminById(id);
    }

    public void deleteByAdminIds(long[] ids) {
        adminDao.deleteByAdminIds(ids);
    }
}

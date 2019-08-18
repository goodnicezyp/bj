package com.xkygame.ssm.service;

import com.xkygame.ssm.model.Admin;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * Created by will on 2017/3/5.
 * version : 1.0.
 * desc :
 * Author will.
 */
public interface AdminService {
    void create(Admin admin);

    void delete(@Param("adminid") Long adminid);

    void update(Admin admin);

    Admin getAdminByName(@Param("name") String name);

    /**
     * 获取管理员
     *
     * @param map
     * @param pageNo
     * @param pageSize
     * @return
     */
    List<Admin> selectAdmin(Map<String, Object> map, @Param("pageNo") Integer pageNo, @Param("pageSize") Integer pageSize);

    /**
     * 统计所有条数
     * @return
     */
    int total();

    /**
     * 通过用户id查看该用户
     * @param id
     * @return
     */
    Admin findAdminById(@Param("id") long id);

    void deleteByAdminIds(long[] ids);
}

package com.xkygame.ssm.dao;

import com.xkygame.ssm.model.LogInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by will on 2017/4/12.
 * version : 1.0.
 * desc : 日志dao
 * Author will.
 */
@Repository
public interface LogDao {
    void create(LogInfo logInfo);

    List<LogInfo> selectAllLogs();

    List<LogInfo> findSysLogByPage(@Param("pageNo") int pageNo, @Param("pageSize") int pageSize, @Param("map") Map<String, Object> map);

    Integer Total(@Param("map") Map<String, Object> map);

    LogInfo findByID(@Param("id") long id);

    void update(LogInfo logInfo);
}

package com.xkygame.ssm.service;

import com.xkygame.ssm.model.LogInfo;

import java.util.List;
import java.util.Map;

/**
 * Created by will on 2017/4/12.
 * version : 1.0.
 * desc : 日志service
 * Author will.
 */
public interface LogService {
    void create(LogInfo logInfo);

    List<LogInfo> selectAllLogs();

    List<LogInfo> findSysLogByPage(int pageNo, int pageSize, Map<String, Object> map);

    Integer Total(Map<String, Object> map);

    LogInfo findByID(long id);

    void update(LogInfo logInfo);
}

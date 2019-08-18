package com.xkygame.ssm.service.impl;

import com.xkygame.ssm.dao.LogDao;
import com.xkygame.ssm.model.LogInfo;
import com.xkygame.ssm.service.LogService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by will on 2017/4/12.
 * version : 1.0.
 * desc : 日志service实现类
 * Author will.
 */
@Service
public class LogServiceImpl implements LogService {
    @Resource
    private LogDao logDao;

    public void create(LogInfo logInfo) {
        logDao.create(logInfo);
    }

    public List<LogInfo> selectAllLogs() {
        return logDao.selectAllLogs();
    }

    public List<LogInfo> findSysLogByPage(int pageNo, int pageSize, Map<String, Object> map) {
        return logDao.findSysLogByPage(pageNo,pageSize,map);
    }

    public Integer Total(Map<String, Object> map) {
        return logDao.Total(map);
    }

    public LogInfo findByID(long id) {
        return logDao.findByID(id);
    }

    public void update(LogInfo logInfo) {
        logDao.update(logInfo);
    }
}

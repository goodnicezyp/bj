package com.xkygame.ssm.service;

import com.xkygame.ssm.model.Articles;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @Author: Clarence
 * @Description:
 * @Date: 2019/2/27 10:58.
 */
public interface ArticleService {
    List<Articles> findAllByPage(Map<String, Object> map, int pageNo, int pageSize);

    Integer total(Map<String, Object> map);

    void create(Articles articles);

    Articles findByID(long id);

    void update(Articles articles);

    void updateState(long id, int state);

    /**
     * 并没有删除  只是更改状态
     * @param ids
     */
    void delByIds(long[] ids);

    void pushArticle(long id, int state, Date date, String userName);
}

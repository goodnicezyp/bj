package com.xkygame.ssm.service.impl;

import com.xkygame.ssm.dao.ArticleDao;
import com.xkygame.ssm.model.Articles;
import com.xkygame.ssm.service.ArticleService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @Author: Clarence
 * @Description:
 * @Date: 2019/2/27 10:58.
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class ArticleServiceImpl implements ArticleService {
    @Resource
    private ArticleDao articleDao;


    public List<Articles> findAllByPage(Map<String, Object> map, int pageNo, int pageSize) {
        return articleDao.findAllByPage(map,pageNo,pageSize);
    }

    public Integer total(Map<String, Object> map) {
        return articleDao.total(map);
    }

    public void create(Articles articles) {
        articleDao.create(articles);
    }

    public Articles findByID(long id) {
        return articleDao.findByID(id);
    }

    public void update(Articles articles) {
        articleDao.update(articles);
    }

    public void updateState(long id, int state) {
        articleDao.updateState(id,state);
    }

    public void delByIds(long[] ids) {
        articleDao.delByIds(ids);
    }

    public void pushArticle(long id, int state, Date date, String userName) {
        articleDao.pushArticle(id,state,date,userName);
    }
}

package com.xkygame.ssm.dao;

import com.xkygame.ssm.model.Articles;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @Author: Clarence
 * @Description:
 * @Date: 2019/2/27 10:59.
 */
@Repository
public interface ArticleDao {
    List<Articles> findAllByPage(@Param("map") Map<String, Object> map, @Param("pageNo") int pageNo, @Param("pageSize") int pageSize);

    Integer total(@Param("map") Map<String, Object> map);

    void create(Articles articles);

    Articles findByID(@Param("id") long id);

    void update(Articles articles);

    void updateState(@Param("id") long id, @Param("state") int state);

    void delByIds(@Param("idArr") long[] ids);

    void pushArticle(@Param("id") long id, @Param("state") int state, @Param("date") Date date,@Param("updateBy") String userName);
}

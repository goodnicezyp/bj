package com.xkygame.ssm.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @Author: Clarence
 * @Description: 资讯类
 * @Date: 2019/2/27 10:55.
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Articles {
    private long id;
    private String title; // 标题
    private String content; // 内容
    private String picUrl; // 图片地址
    private Date createTime; // 创建时间
    private Date updateTime; // 发布时间
    private Date pushTime; // 文章发布时间
    private String updateBy; // 发布人
    private int type; // 0:最新版权法规 1:最新活动 2:最新行业动态 3:最新维权案例
    private int state; // 状态 -2：已删除 -1:已下线 0:草稿 1：已发布
}

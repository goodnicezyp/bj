package com.xkygame.ssm.controller.admin;

import com.alibaba.fastjson.JSONObject;
import com.xkygame.ssm.annotation.SystemControllerLog;
import com.xkygame.ssm.model.*;
import com.xkygame.ssm.service.ArticleService;
import com.xkygame.ssm.utils.CommonUtil;
import com.xkygame.ssm.utils.JodaTimeUtil;
import com.xkygame.ssm.utils.NameTransUtil;
import org.apache.commons.lang.StringEscapeUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: Clarence
 * @Description:
 * @Date: 2019/3/11 16:13.
 */
@Controller
@RequestMapping("admin/article")
public class AdminArticleCtrl {

    private static Logger log = LogManager.getLogger(LogManager.ROOT_LOGGER_NAME);

    @Resource
    private ArticleService articleService;

    /**
     * 进入资讯管理页面
     * @return
     */
    @RequestMapping("/articleForm")
    public String articleForm() {
        return "manager/articles-list";
    }

    /**
     * 所有资讯列表
     * @param pageSize
     * @param pageNo
     * @param request
     * @return
     * @throws
     */
    @ResponseBody
    @RequestMapping(value = "/articleList")
    public Object articleList(@RequestParam("length") int pageSize, @RequestParam("start") int pageNo, HttpServletRequest request) throws UnsupportedEncodingException {
        int draw = ServletRequestUtils.getIntParameter(request,"draw",1);
        String searchVal = ServletRequestUtils.getStringParameter(request , "searchVal", "");

        Map<String,Object> map = new HashMap<String,Object>(); //存查询条件的map
        map.put("state",-2);
        CommonUtil.convertSearchKey(searchVal,map);

        List<Articles> articlesList = articleService.findAllByPage(map,pageNo,pageSize);
        if(articlesList.size() > 0){
            for (Articles articles:articlesList){
                articles.setPicUrl(CommonPre.pic_pre + articles.getPicUrl());
                articles.setTitle(NameTransUtil.transName(articles.getTitle()));
            }
        }
        Integer total = articleService.total(map); //这里需要改 应该是map

        PageInfo<Articles> pageInfo = new PageInfo<Articles>();
        pageInfo.setData(articlesList);
        pageInfo.setRecordsTotal(total);
        pageInfo.setRecordsFiltered(total);
        pageInfo.setDraw(draw);
        return JSONObject.toJSON(pageInfo);
    }


    @RequestMapping("/addArticleForm")
    public String addArticleForm(){
        return "manager/articles-add";
    }

    /**
     * 添加资讯
     * @return
     */
    @SystemControllerLog(description = "添加资讯")
    @ResponseBody
    @RequestMapping("/addArticle")
    public DataRes addArticle(@RequestParam(value = "title",defaultValue = "")String title, @RequestParam(value = "content",defaultValue = "")String content,
                             @RequestParam(value = "picUrl",defaultValue = "") String picUrl,@RequestParam(value = "type",defaultValue = "0")int type,
                              @RequestParam(value = "state",defaultValue = "0")int state,@RequestParam("pushTime")String pushTime){

        picUrl = picUrl.replaceAll(CommonPre.pic_pre,"");
        Articles articles = Articles.builder().title(StringEscapeUtils.escapeJava(title)).picUrl(picUrl).createTime(new Date())
                .content(content).type(type).state(state).pushTime(JodaTimeUtil.strToDate(pushTime,"yyyy-MM-dd HH:mm:ss")).build();

        articleService.create(articles);
        return new DataRes(CodeEnums.success);

    }


    @RequestMapping("/updateArticleForm")
    public String updateBannerForm(@RequestParam("id")long id,Model model){
        Articles articles = articleService.findByID(id);
        articles.setTitle(NameTransUtil.transName(articles.getTitle()));
        articles.setPicUrl(CommonPre.getPic_pre() + articles.getPicUrl());
        model.addAttribute("articles",articles);
        return "manager/articles-update";
    }


    /**
     * 修改资讯
     * @return
     */
    @SystemControllerLog(description = "修改资讯")
    @ResponseBody
    @RequestMapping("/updateArticle")
    public DataRes updateArticle(@RequestParam("id")long id,@RequestParam(value = "title",defaultValue = "")String title, @RequestParam(value = "content",defaultValue = "")String content,
                                 @RequestParam(value = "picUrl",defaultValue = "") String picUrl,@RequestParam(value = "type",defaultValue = "0")int type,
                                 @RequestParam(value = "state",defaultValue = "0")int state,@RequestParam("pushTime")String pushTime){

        Articles articles = articleService.findByID(id);

        if(articles == null){
            return new DataRes(CodeEnums.err1);
        }
        picUrl = picUrl.replaceAll(CommonPre.pic_pre,"");
        articles.setTitle(StringEscapeUtils.escapeJava(title));
        articles.setPicUrl(picUrl);
        articles.setContent(content);
        articles.setState(state);
        articles.setType(type);
        articles.setPushTime(JodaTimeUtil.strToDate(pushTime,"yyyy-MM-dd HH:mm:ss"));
        articleService.update(articles);

        return new DataRes(CodeEnums.success);

    }


    /**
     * 更新资讯状态
     * @param id
     * @param state
     * @return
     */
    @SystemControllerLog(description = "更新资讯状态")
    @RequestMapping("/updateState")
    @ResponseBody
    public DataRes updateState(@RequestParam("id")long id,@RequestParam("state")int state){
        Articles articles = articleService.findByID(id);

        if(articles == null){
            return new DataRes(CodeEnums.err1);
        }

        try {
            String userName = (String) SecurityUtils.getSubject().getPrincipal();
            if(state == 1){
                articleService.pushArticle(id,state,new Date(),userName);
            }else {
                articleService.updateState(id,state);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return new DataRes(CodeEnums.err3,e.getMessage());
        }
        return new DataRes(CodeEnums.success);
    }

    /**
     * 删除资讯
     * @param ids
     * @return
     */
    @SystemControllerLog(description = "删除资讯")
    @ResponseBody
    @RequestMapping("/delArticle")
    public DataRes delArticle(@RequestParam("ids") long[] ids){
        articleService.delByIds(ids);
        return new DataRes(CodeEnums.success);
    }
}

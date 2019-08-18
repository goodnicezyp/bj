package com.xkygame.ssm.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.math.BigDecimal;

/**
 * @Author: Clarence
 * @Description:
 * @Date: 2019/1/23 18:21.
 */
@Controller
@RequestMapping("admin")
public class AdminIndexController {


    @RequestMapping("/main")
    public String main(Model model){
        return "manager/main";
    }

    @RequestMapping("/index")
    public String index(Model model){
        //统计总访问量
        BigDecimal totalPageView = new BigDecimal("0");
        //今日访问量
        BigDecimal curPageView = new BigDecimal("0");
        //总销售额 今日销售额
        BigDecimal totalSales = new BigDecimal("0");
        BigDecimal curSales = new BigDecimal("0");
        //总会员数  今日会员数
        BigDecimal totalMember = new BigDecimal("0");
        BigDecimal curMember = new BigDecimal("0");
        //总作品数（商城能看到的）
        BigDecimal totalWork = new BigDecimal("0");
        BigDecimal curWork = new BigDecimal("0");

        model.addAttribute("totalSales",totalSales);
        model.addAttribute("curSales",curSales);
        model.addAttribute("totalMember",totalMember);
        model.addAttribute("curMember",curMember);
        model.addAttribute("totalWork",totalWork);
        model.addAttribute("curWork",curWork);
        model.addAttribute("totalPageView",totalPageView);
        model.addAttribute("curPageView",curPageView);
        return "manager/index";
    }
}

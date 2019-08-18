package com.xkygame.ssm.controller.admin;

import com.xkygame.ssm.annotation.SystemControllerLog;
import com.xkygame.ssm.model.CodeEnums;
import com.xkygame.ssm.model.DataRes;
import com.xkygame.ssm.utils.MD5;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @Author: Clarence
 * @Description:
 * @Date: 2019/1/23 15:33.
 */
@Controller
@RequestMapping("/")
public class AdminLoginCtrl {
    private static Logger logger = LogManager.getLogger(LogManager.ROOT_LOGGER_NAME);

    //进入管理员登录页面
    @RequestMapping("adminLoginForm")
    public String adminLoginForm() {
        return "adminlogin";
    }

    //管理员未登录页
    @RequestMapping("adminNotLoginForm")
    public String adminNotLoginForm() {
        return "adminnotlogin";
    }

    //管理员登录
    @SystemControllerLog(description = "后台管理员登录")
    @RequestMapping(value="adminLogin", method = RequestMethod.POST)
    @ResponseBody
    public DataRes adminLogin(@RequestParam("name") String name, @RequestParam("pwd") String pwd, HttpServletResponse response) throws IOException {
        MD5 md5 = new MD5();
        pwd = md5.toDigest(pwd);
        UsernamePasswordToken token = new UsernamePasswordToken(name, pwd);
        token.setRememberMe(true);
        Subject subject = SecurityUtils.getSubject();
        String msg = "";
        try {
            subject.login(token);
            if (subject.isAuthenticated()) {
                return new DataRes(CodeEnums.success);
            }else {
                return new DataRes(CodeEnums.err1);
            }
        } catch (IncorrectCredentialsException e) {
            msg = "登录密码错误. Password for account " + token.getPrincipal() + " was incorrect.";
            logger.error(msg);
            return new DataRes(CodeEnums.err3,"账号或密码错误");
        } catch (ExcessiveAttemptsException e) {
            msg = "登录失败次数过多";
            logger.error(msg);
            return new DataRes(CodeEnums.err3,"登录失败次数过多");
        } catch (LockedAccountException e) {
            msg = "帐号已被锁定. The account for username " + token.getPrincipal() + " was locked.";
            logger.error(msg);
            return new DataRes(CodeEnums.err3,"帐号已被锁定");
        } catch (DisabledAccountException e) {
            msg = "帐号已被禁用. The account for username " + token.getPrincipal() + " was disabled.";
            logger.error(msg);
            return new DataRes(CodeEnums.err3,"帐号已被禁用");
        } catch (ExpiredCredentialsException e) {
            msg = "帐号已过期. the account for username " + token.getPrincipal() + "  was expired.";
            logger.error(msg);
            return new DataRes(CodeEnums.err3,"帐号已过期");
        } catch (UnknownAccountException e) {
            msg = "帐号不存在. There is no user with username of " + token.getPrincipal();
            logger.error(msg);
            return new DataRes(CodeEnums.err3,"帐号不存在");
        } catch (UnauthorizedException e) {
            msg = "您没有得到相应的授权！" + e.getMessage();
            logger.error(msg);
            return new DataRes(CodeEnums.err3,"您没有得到相应的授权");
        }
    }

    @RequestMapping(value="notallow")
    public String notallow() {
        return "adminnotallow";
    }

}

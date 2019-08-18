package com.xkygame.ssm.filter;

import com.xkygame.ssm.model.Admin;
import com.xkygame.ssm.service.AdminService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;

import javax.annotation.Resource;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.Principal;

/**
 * Created by will on 2017/3/30.
 * version : 1.0.
 * desc :
 * Author will.
 */
public class ShiroFilter implements Filter {
    @Resource
    private AdminService adminService;

    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        Principal principal = httpRequest.getUserPrincipal();

        if (principal != null) {
            Subject subjects = SecurityUtils.getSubject();
            // 为了简单，这里初始化一个用户。实际项目项目中应该去数据库里通过名字取用户：
            // 例如：User user = userService.getByAccount(principal.getName());
            Admin admin = adminService.getAdminByName(principal.getName());
            if (null != admin) {
                UsernamePasswordToken token = new UsernamePasswordToken(admin.getAdminName(), admin.getAdminPwd());
                subjects = SecurityUtils.getSubject();
                subjects.login(token);
                subjects.getSession();
            }else {
                // 如果用户为空，则subjects信息登出
                if (subjects != null) {
                    subjects.logout();
                }
            }
        }
        chain.doFilter(httpRequest, httpResponse);
    }

    public void destroy() {

    }
}

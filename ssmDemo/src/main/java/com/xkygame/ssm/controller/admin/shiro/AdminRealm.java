package com.xkygame.ssm.controller.admin.shiro;

import com.xkygame.ssm.model.Admin;
import com.xkygame.ssm.model.Permission;
import com.xkygame.ssm.model.Role;
import com.xkygame.ssm.service.AdminService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by will on 2017/3/29.
 * version : 1.0.
 * desc :
 * Author will.
 */
public class AdminRealm extends AuthorizingRealm{
    @Resource
    private AdminService adminService;

    /**
     * 用于权限的验证(授权操作)
     * @param principals
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        String currentUsername = (String)super.getAvailablePrincipal(principals);
        Admin admin = adminService.getAdminByName(currentUsername);
        if (null == admin) {
            throw new AuthenticationException("msg:用户不存在。");
        }

        List<Role> roleList = admin.getRoleList();
        //角色名集合
        List<String> roles = new ArrayList<String>();
        //权限集合
        List<String> permissions = new ArrayList<String>();

        if (roleList.size() > 0) {
            for (Role role : roleList) {
                roles.add(role.getRolecode());
                for (Permission permission : role.getPermissionList()) {
                    permissions.add(permission.getAction());
                }
            }
        }

        SimpleAuthorizationInfo simpleAuthorInfo = new SimpleAuthorizationInfo();
        simpleAuthorInfo.addRoles(roles);
        simpleAuthorInfo.addStringPermissions(permissions);

        return simpleAuthorInfo;
    }

    /**
     * 用于用户认证，即登录(身份验证操作)
     * @param authcToken
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
        //获取基于用户名和密码的令牌
        //实际上这个authcToken是从LoginController里面currentUser.login(token)传过来的
        UsernamePasswordToken token = (UsernamePasswordToken)authcToken;
        Admin admin = adminService.getAdminByName(token.getUsername());
        if(admin != null){
            AuthenticationInfo authcInfo = new SimpleAuthenticationInfo(admin.getAdminName(), admin.getAdminPwd(), this.getName());
            this.setSession("currentUser", admin.getAdminName());

            return authcInfo;
        }
        return null;

    }

    /**
     * 保存登录名
     */
    private void setSession(Object key, Object value){
        Session session = getSession();
        System.out.println("Session默认超时时间为[" + session.getTimeout() + "]毫秒");
        if(null != session){
            session.setAttribute(key, value);
        }
    }

    private Session getSession(){
        try{
            Subject subject = SecurityUtils.getSubject();
            Session session = subject.getSession(false);
            if (session == null){
                session = subject.getSession();
            }
            if (session != null){
                return session;
            }
        }catch (InvalidSessionException e){

        }
        return null;
    }
}

package com.xkygame.ssm.aspect;

import com.alibaba.fastjson.JSONObject;
import com.xkygame.ssm.annotation.SystemControllerLog;
import com.xkygame.ssm.model.LogInfo;
import com.xkygame.ssm.service.LogService;
import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;

/**
 * Created by will on 2017/4/12.
 * version : 1.0.
 * desc : 日志切点类
 * Author will.
 */
@Aspect //该标签把LoggerAspect类声明为一个切面
@Component //该标签把SystemLogAspect类放到IOC容器中
public class SystemLogAspect {
    @Resource
    private LogService logService;
    //本地异常日志记录对象
    private static Logger logger = LogManager.getLogger(LogManager.ROOT_LOGGER_NAME);
    private long id = 0;

    /**
     * 定义一个方法，用于声明切入点表达式，方法中一般不需要添加其他代码
     * 使用@Pointcut声明切入点表达式
     * 后面的通知直接使用方法名来引用当前的切点表达式；如果是其他类使用，加上包名即可
     */
    @Pointcut("execution(* com.xkygame.ssm.controller.admin.*.*(..))")
    public void controllerAspect() {
    }
//    @Pointcut("execution(* com.xkygame.ssm.controller.*(..))")
//    public void controllerAspect() {
//    }

    /**
     * 前置通知 用于拦截Controller层记录用户的操作
     *
     * @param joinPoint 切点
     */
    @Before("controllerAspect()")
    public void doBefore(JoinPoint joinPoint) throws Exception {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        String username = "游客";
        if(SecurityUtils.getSubject().getPrincipal() != null && SecurityUtils.getSubject().getPrincipal() !=""){
            username = (String) SecurityUtils.getSubject().getPrincipal();
        }
//        String ip = WeixinUtil.getIpAddr(request);
        String des = getControllerMethodDescription(joinPoint);
        if (StringUtils.isNotBlank(des) && 0 != des.trim().length()) {
            try {
                LogInfo logInfo = new LogInfo();
                logInfo.setCreateTime(new Date());
                logInfo.setIp("127.0.0.1");
                logInfo.setMethod(joinPoint.getSignature().getName());
                logInfo.setAction(des);
                logInfo.setOperator(username);
                logInfo.setParams(null);
                logInfo.setExceptioncode(null);
                logInfo.setExceptiondetail(null);
                logInfo.setType(0);
                logInfo.setFileFlag(1);
                logger.info("==========前置通知中===============");
                logService.create(logInfo);
                id = logInfo.getId();
                logger.info("========前置通知结束：日志ID：" + id + "=========");
            } catch (Exception e) {
                //记录本地异常日志
                logger.error("==前置通知异常==");
                logger.error("异常信息:{}", e.getMessage());
            }
        }
    }

    /**
     * 后置通知 用于拦截Controller层记录用户的操作
     *
     * @param joinPoint 切点
     */
    @After("controllerAspect()")
    public void doAfter(JoinPoint joinPoint) throws Exception {
        String methodName = joinPoint.getSignature().getName();
        if("adminLogin".equals(methodName)){
            logger.info("==========后置通知中===============");
            logger.info("操作方法名：" + methodName);
            String username = "游客";
            if(SecurityUtils.getSubject().getPrincipal() != null && SecurityUtils.getSubject().getPrincipal() !=""){
                username = (String) SecurityUtils.getSubject().getPrincipal();
            }

            LogInfo logInfo = logService.findByID(id);
            if(logInfo != null){
                logInfo.setCreateTime(new Date());
                logInfo.setOperator(username);
                logService.update(logInfo);
                logger.info("=========后置通知结束==========");
            }
        }

    }


    @AfterThrowing(pointcut = "controllerAspect()", throwing = "e")
    public void controllerdoAfterThrowing(JoinPoint joinPoint, Throwable e) throws Exception {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        String username = (String) SecurityUtils.getSubject().getPrincipal();
//        String ip = WeixinUtil.getIpAddr(request);
        String desc = getControllerMethodDescription(joinPoint);
        //获取用户请求方法的参数并序列化为JSON格式字符串
        String params = "";

        if (joinPoint.getArgs() !=  null && joinPoint.getArgs().length > 0) {
            for (int i = 0; i<joinPoint.getArgs().length; i++) {
                params += JSONObject.toJSONString(joinPoint.getArgs()[i]) + ";";
            }
        }
        if (StringUtils.isNotBlank(desc) && 0 != desc.trim().length()) {
            try {
                LogInfo logInfo = new LogInfo();
                logInfo.setCreateTime(new Date());
                logInfo.setIp("127.0.0.1");
                logInfo.setMethod(joinPoint.getSignature().getName());
                logInfo.setAction(desc);
                logInfo.setOperator(username);
                logInfo.setParams(params);
                logInfo.setExceptioncode(e.getClass().getName());
                logInfo.setExceptiondetail(e.getMessage());
                logInfo.setType(1);
                logInfo.setFileFlag(1);
                logger.info("==========异常 通知 中===============");
                logService.create(logInfo);
            } catch (Exception exception) {
                //记录本地异常日志
                logger.error("==异常通知异常==");
                logger.error("异常信息:{}", exception.getMessage());
            }
        }
    }


    /**
     * 获取注解中对方法的描述信息 用于Controller层注解
     *
     * @param joinPoint 切点
     * @return 方法描述
     * @throws Exception
     */
    public static String getControllerMethodDescription(JoinPoint joinPoint) throws Exception {
        String targetName = joinPoint.getTarget().getClass().getName();
        String methodName = joinPoint.getSignature().getName();
        Object[] arguments = joinPoint.getArgs();
        Class targetClass = Class.forName(targetName);
        Method[] methods = targetClass.getMethods();
        String description = "";
        for (Method method : methods) {
            if (method.getName().equals(methodName)) {
                Class[] clazzs = method.getParameterTypes();
                if (clazzs.length == arguments.length) {
                    if(null != method.getAnnotation(SystemControllerLog. class)) {
                        description = method.getAnnotation(SystemControllerLog. class).description();
                    }
                    break;
                }
            }
        }
        return description;
    }
}

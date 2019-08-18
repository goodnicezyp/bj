package com.xkygame.ssm.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @Author: Clarence
 * @Description:  自定义注解  访问次数限制
 * 注意 使用时需要看spring-mvc AccessInterceptor拦截器是否有配置对应接口
 * @Date: 2018/8/3 13:13.
 */
@Target({ElementType.PARAMETER, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
public @interface AccessLimit {
    int seconds();
    int maxCount();
}

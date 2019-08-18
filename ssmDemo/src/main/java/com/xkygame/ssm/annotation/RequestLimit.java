package com.xkygame.ssm.annotation;

import java.lang.annotation.*;

/**
 * @Author: Clarence
 * @Description:  自定义注解  访问限制 未响应结束不可手速太快
 * 匹配条件  *.OrderTo
 * @Date: 2018/8/3 13:13.
 */
@Target({ElementType.PARAMETER, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface RequestLimit {
}

package com.xkygame.ssm.annotation;

import java.lang.annotation.*;

/**
 * Created by will on 2017/4/12.
 * version : 1.0.
 * desc : 系统控制层日志注解
 * Author will.
 */
@Target({ElementType.PARAMETER, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface UserControllerLog {
    String description()  default "";
}

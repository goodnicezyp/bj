package com.xkygame.ssm.annotation;

import java.lang.annotation.*;

/**
 * Created by clarence on 2018/6/27.
 * version : 1.0.
 * desc : 未查看新消息统计数量注解
 * Author clarence.
 */
@Target({ElementType.PARAMETER, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface NewMsg {
    int msgType()  default -1;
}

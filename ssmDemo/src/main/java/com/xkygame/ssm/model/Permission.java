package com.xkygame.ssm.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * Created by will on 2017/3/29.
 * version : 1.0.
 * desc :
 * Author will.
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Permission implements Serializable {
    private static final long serialVersionUID = -8025597823572680802L;

    private long pid;
    private String name;
    private String action;

    private int depth;
    private long parentID;    //父类id
    private String parentName; //父类名称
    private long topID; // 顶级父类ID
}

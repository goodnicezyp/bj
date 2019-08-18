package com.xkygame.ssm.dto;

import com.xkygame.ssm.model.Permission;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author: Clarence
 * @Description:
 * @Date: 2019/2/1 11:42.
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PermissionDto {
    private long pid;
    private String name;
    private String action;
    private int depth;

    private int lev; //中间层数
    private long parentID;    //父类id
    private String parentName; //父类名称

    public PermissionDto(Permission permission, int lev) {
        this.setPid(permission.getPid());
        this.setName(permission.getName());
        this.setParentID(permission.getParentID());
        this.lev = lev;
        this.depth = permission.getDepth();
    }

}

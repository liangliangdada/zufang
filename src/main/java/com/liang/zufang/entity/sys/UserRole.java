package com.liang.zufang.entity.sys;

import com.liang.zufang.entity.BaseEntity;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author liuliang
 * @description 用户--角色
 * @date 2019/5/7
 **/
@Entity
@Table(name = "sys_user_role")
public class UserRole extends BaseEntity {

    private Long userId;

    private Long roleId;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }
}

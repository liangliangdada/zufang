package com.liang.zufang.entity.sys;

import com.liang.zufang.entity.BaseEntity;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author liuliang
 * @description 角色--资源（菜单）
 * @date 2019/5/7
 **/
@Entity
@Table(name = "sys_role_menu")
public class RoleMenu extends BaseEntity {

    private Long roleId;

    private Long menuId;

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public Long getMenuId() {
        return menuId;
    }

    public void setMenuId(Long menuId) {
        this.menuId = menuId;
    }
}

package com.liang.zufang.entity.sys;

import com.liang.zufang.entity.BaseEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.List;

/**
 * @author liuliang
 * @description 角色
 * @date 2019/5/7
 **/
@Entity
@Table(name = "sys_role")
public class Role extends BaseEntity {

    @Column(length = 100)
    private String name;

    @Column(length = 100)
    private String code;

    private String description;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}

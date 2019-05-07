package com.liang.zufang.entity.sys;

import com.liang.zufang.entity.BaseEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author liuliang
 * @description 菜单资源
 * @date 2019/5/7
 **/
@Entity
@Table(name = "sys_menu")
public class Menu extends BaseEntity {

    @Column(length = 100)
    private String name;

    @Column(length = 100)
    private String url;

    /**
     * 0:目录，1：按钮
     */
    private Integer type;

    @Column(length = 100)
    private String code;

    private Long parentId;

    private Integer sort;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }
}

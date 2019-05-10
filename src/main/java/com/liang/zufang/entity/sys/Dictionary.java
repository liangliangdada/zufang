package com.liang.zufang.entity.sys;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.liang.zufang.entity.BaseEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author liuliang
 * @description 数据字典
 * @date 2019/5/10
 **/
@Entity
@Table(name = "sys_dictionary")
@TableName(value = "sys_dictionary")
public class Dictionary extends BaseEntity {

    @Column(length = 100)
    private String name;

    @Column(length = 100)
    private String keyValue;

    private Integer sort;

    private Long parentId;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getKeyValue() {
        return keyValue;
    }

    public void setKeyValue(String keyValue) {
        this.keyValue = keyValue;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }
}

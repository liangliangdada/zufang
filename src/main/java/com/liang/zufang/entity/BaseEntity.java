package com.liang.zufang.entity;

/**
 * @author liuliang
 * @description 顶级父类
 * @date 2019/5/7
 **/

import com.baomidou.mybatisplus.annotation.TableField;

import javax.persistence.*;
import java.io.Serializable;

@MappedSuperclass
public class BaseEntity implements Serializable {

    private static final long serialVersionUID = -6446834172087299719L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @TableField(exist=false)
    @Transient
    private Integer page;

    @TableField(exist=false)
    @Transient
    private Integer limit;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }
}

package com.liang.zufang.entity.sys;

import com.baomidou.mybatisplus.annotation.TableName;
import com.liang.zufang.entity.BaseEntity;
import org.springframework.util.DigestUtils;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author liuliang
 * @description 用户
 * @date 2019/5/7
 **/
@Entity
@Table(name = "sys_user")
@TableName(value = "sys_user")
public class User extends BaseEntity {

    @Column(length = 100)
    private String name;

    @Column(length = 100)
    private String userName;

    @Column(length = 100)
    private String password;

    private Integer status;

    public Integer getStatus() {
        return status==null?0:status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password==null?DigestUtils.md5DigestAsHex("123456".getBytes()):password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}

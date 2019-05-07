package com.liang.zufang.service;

import com.liang.zufang.entity.sys.User;

public interface SysUserService {

    User selectUserByUserName(String username);
}

package com.liang.zufang.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.liang.zufang.entity.sys.User;
import com.liang.zufang.mapper.SysUserMapper;
import com.liang.zufang.service.SysUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author liuliang
 * @description 用户service
 * @date 2019/5/7
 **/
@Service
public class SysUserServiceImpl implements SysUserService {

    @Resource
    private SysUserMapper userMapper;

    @Override
    public User selectUserByUserName(String username) {
        QueryWrapper<User> queryWrapper = new  QueryWrapper<>();
        queryWrapper.eq("user_name", username);
        return userMapper.selectOne(queryWrapper);
    }
}

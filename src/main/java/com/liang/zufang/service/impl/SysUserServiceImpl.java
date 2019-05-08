package com.liang.zufang.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.liang.zufang.entity.sys.Menu;
import com.liang.zufang.entity.sys.User;
import com.liang.zufang.mapper.SysUserMapper;
import com.liang.zufang.service.SysUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

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

    @Override
    public List<String> selectRolesByUserId(Long id) {
        return userMapper.selectRolesByUserId(id);
    }

    @Override
    public List<String> selectPermissionsByUserId(Long id) {
        return userMapper.selectPermissionsByUserId(id);
    }

    @Override
    public List<Menu> selectMenusByUserId(Long id) {
        return userMapper.selectMenusByUserId(id);
    }
}

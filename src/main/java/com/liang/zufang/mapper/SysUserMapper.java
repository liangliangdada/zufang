package com.liang.zufang.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.liang.zufang.entity.sys.Menu;
import com.liang.zufang.entity.sys.User;

import java.util.List;

public interface SysUserMapper extends BaseMapper<User> {
    List<String> selectRolesByUserId(Long userId);

    List<String> selectPermissionsByUserId(Long userId);

    List<Menu> selectMenusByUserId(Long userId);
}

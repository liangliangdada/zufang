package com.liang.zufang.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.liang.zufang.entity.sys.Role;

import java.util.List;
import java.util.Map;

public interface SysRoleMapper extends BaseMapper<Role> {

    List<Map<String,Object>> selectTreeByUserId(Long userId);

    List<Role> selectAll();
}

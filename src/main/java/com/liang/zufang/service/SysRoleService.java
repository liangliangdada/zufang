package com.liang.zufang.service;

import com.liang.zufang.entity.sys.Role;

import java.util.List;
import java.util.Map;

public interface SysRoleService {

    List<Map<String,Object>> selectTreeByUserId(Long userId);

    List<Role> selectAll();

}

package com.liang.zufang.service;

import com.liang.zufang.entity.sys.Role;

import java.util.List;
import java.util.Map;

public interface SysRoleService extends BaseService<Role>{

    List<Map<String,Object>> selectTreeByUserId(Long userId);

    List<Role> selectAll();

    Role selectRoleById(Long id);

    void saveRoleMenus(Long roleId, Long[] menus);

    void delAllById(Long id);
}

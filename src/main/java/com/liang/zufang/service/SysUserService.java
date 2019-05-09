package com.liang.zufang.service;

import com.liang.zufang.entity.sys.Menu;
import com.liang.zufang.entity.sys.User;

import java.util.List;

public interface SysUserService {

    User selectUserByUserName(String username);

    /**
     * 获取用户角色
     * @param id
     * @return
     */
    List<String> selectRolesByUserId(Long id);

    /**
     * 获取用户授权
     * @param id
     * @return
     */
    List<String> selectPermissionsByUserId(Long id);

    List<Menu> selectMenusByUserId(Long id);

    List<User> selectAll(User user);

    void save(User user);

    User selectUserById(Long id);

    void saveUserRoles(Long userId, Long[] roles);

    void del(Long id);
}

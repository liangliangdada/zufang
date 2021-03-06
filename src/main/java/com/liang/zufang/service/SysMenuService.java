package com.liang.zufang.service;

import com.liang.zufang.entity.sys.Menu;

import java.util.List;
import java.util.Map;

public interface SysMenuService extends BaseService<Menu> {

    List<Menu> selectAll(Menu menu);

    void del(Long id);

    Menu selectById(Long id);

    List<Map<String, Object>> tree(Long roleId);
}

package com.liang.zufang.service;

import com.liang.zufang.entity.sys.Menu;

import java.util.List;

public interface SysMenuService {

    List<Menu> selectAll(Menu menu);
}

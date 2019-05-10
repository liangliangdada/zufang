package com.liang.zufang.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.liang.zufang.entity.sys.Menu;

public interface SysMenuMapper extends BaseMapper<Menu> {
    void deleteAllById(Long id);
}

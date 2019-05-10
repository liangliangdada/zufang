package com.liang.zufang.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.liang.zufang.entity.sys.Menu;

import java.util.List;
import java.util.Map;

public interface SysMenuMapper extends BaseMapper<Menu> {
    void deleteAllById(Long id);

    List<Map<String, Object>> selectTree(Long roleId);
}

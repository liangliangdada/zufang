package com.liang.zufang.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.liang.zufang.entity.sys.Dictionary;

public interface SysDictionaryMapper extends BaseMapper<Dictionary> {
    void delAllById(Long id);
}

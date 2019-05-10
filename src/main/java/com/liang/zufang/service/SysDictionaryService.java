package com.liang.zufang.service;

import com.liang.zufang.entity.sys.Dictionary;

public interface SysDictionaryService extends BaseService<Dictionary> {
    void delAllById(Long id);
}

package com.liang.zufang.service.impl;

import com.liang.zufang.entity.sys.Dictionary;
import com.liang.zufang.mapper.SysDictionaryMapper;
import com.liang.zufang.service.SysDictionaryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author liuliang
 * @description 数据字典
 * @date 2019/5/10
 **/
@Service
public class SysDictionaryServiceImpl extends BaseServiceImpl<SysDictionaryMapper, Dictionary> implements SysDictionaryService {

    @Resource
    private SysDictionaryMapper dictionaryMapper;

    @Override
    public void delAllById(Long id) {
        dictionaryMapper.delAllById(id);
    }
}

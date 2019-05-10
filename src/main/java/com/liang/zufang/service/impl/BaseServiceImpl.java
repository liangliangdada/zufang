package com.liang.zufang.service.impl;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

/**
 * @author liuliang
 * @description 顶级接口
 * @date 2019/5/10
 **/
public class BaseServiceImpl<M extends BaseMapper<T>, T> extends ServiceImpl<M , T> {
}

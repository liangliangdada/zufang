package com.liang.zufang.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.liang.zufang.entity.sys.Menu;
import com.liang.zufang.mapper.SysMenuMapper;
import com.liang.zufang.service.SysMenuService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @author liuliang
 * @description 菜单管理
 * @date 2019/5/9
 **/
@Service
public class SysMenuServiceImpl extends BaseServiceImpl<SysMenuMapper,Menu> implements SysMenuService {

    @Resource
    private SysMenuMapper menuMapper;

    @Override
    public List<Menu> selectAll(Menu menu) {
        return menuMapper.selectList(null);
    }

    @Override
    public void del(Long id) {
        menuMapper.deleteAllById(id);
    }

    @Override
    public Menu selectById(Long id) {
        return menuMapper.selectById(id);
    }

    @Override
    public List<Map<String, Object>> tree(Long roleId) {
        return menuMapper.selectTree(roleId);
    }
}

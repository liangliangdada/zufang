package com.liang.zufang.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.liang.zufang.entity.sys.Role;
import com.liang.zufang.mapper.SysRoleMapper;
import com.liang.zufang.service.SysRoleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class SysRoleServiceImpl extends BaseServiceImpl<SysRoleMapper,Role> implements SysRoleService {

    @Resource
    private SysRoleMapper sysRoleMapper;

    /**
     * 角色树
     * @param userId
     * @return
     */
    @Override
    public List<Map<String,Object>> selectTreeByUserId(Long userId) {
        return sysRoleMapper.selectTreeByUserId(userId);
    }

    @Override
    public List<Role> selectAll() {
        //条件构造器
        QueryWrapper<Role> queryWrapper = new QueryWrapper<>();
        //queryWrapper.like("name","lisi")
        return sysRoleMapper.selectList(queryWrapper);
    }

    @Override
    public Role selectRoleById(Long id) {
        return sysRoleMapper.selectById(id);
    }

    @Override
    public void saveRoleMenus(Long roleId, Long[] menus) {
        sysRoleMapper.delMenuByRoleId(roleId);
        sysRoleMapper.saveRoleMenus(roleId,menus);
    }

    @Override
    public void delAllById(Long id) {
        sysRoleMapper.delMenuByRoleId(id);
        sysRoleMapper.deleteById(id);
    }

}

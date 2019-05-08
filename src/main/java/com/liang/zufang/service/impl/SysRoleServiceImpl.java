package com.liang.zufang.service.impl;

import com.liang.zufang.entity.sys.Role;
import com.liang.zufang.mapper.SysRoleMapper;
import com.liang.zufang.service.SysRoleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class SysRoleServiceImpl implements SysRoleService {

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
        return null;
    }


}

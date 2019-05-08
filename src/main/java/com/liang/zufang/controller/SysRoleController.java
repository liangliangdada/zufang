package com.liang.zufang.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.liang.zufang.entity.sys.Role;
import com.liang.zufang.service.SysRoleService;
import com.liang.zufang.utils.DataGrid;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @author liuliang
 * @description 角色管理
 * @date 2019/5/8
 **/
@Controller
@RequestMapping("role")
public class SysRoleController {

    @Resource
    private SysRoleService sysRoleService;

    @RequestMapping("index")
    public String index(){
        return "role/list";
    }

    @RequestMapping("tree")
    @ResponseBody
    public List<Map<String,Object>> selectTreeByUserId(Long userId){
        return sysRoleService.selectTreeByUserId(userId);
    }

    @RequestMapping("list")
    @ResponseBody
    public DataGrid list(Role role){
        PageHelper.startPage(role.getPage(),role.getLimit());
        List<Role> list = sysRoleService.selectAll();
        PageInfo<Role> rolePageInfo = new PageInfo<Role>(list);
        return DataGrid.build(rolePageInfo.getList(), rolePageInfo.getTotal());
    }
}

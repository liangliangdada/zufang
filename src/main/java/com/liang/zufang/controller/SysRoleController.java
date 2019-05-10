package com.liang.zufang.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.liang.zufang.entity.sys.Role;
import com.liang.zufang.service.SysRoleService;
import com.liang.zufang.utils.DataGrid;
import com.liang.zufang.utils.JsonResult;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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

    @RequestMapping("edit")
    public String edit(HttpServletRequest request, Long id){
        if(id != null){
            Role role = sysRoleService.selectRoleById(id);
            request.setAttribute("role",role);
        }
        return "role/edit";
    }

    @RequestMapping("save")
    @ResponseBody
    public JsonResult save(Role role){
        sysRoleService.saveOrUpdate(role);
        return JsonResult.build(true,"保存成功！");
    }

    @RequestMapping("permission")
    public String permission(HttpServletRequest request,Long roleId){
        request.setAttribute("roleId",roleId);
        return "role/permission";
    }

    @RequestMapping("saveRoleMenus")
    @ResponseBody
    public JsonResult saveRoleMenus(Long roleId, @RequestParam(value = "menus[]") Long[] menus){
        sysRoleService.saveRoleMenus(roleId,menus);
        return JsonResult.build(true,"保存成功！");

    }

    @RequestMapping("del")
    @ResponseBody
    public JsonResult del(Long id){
        sysRoleService.delAllById(id);
        return JsonResult.build(true,"删除成功！");
    }
}

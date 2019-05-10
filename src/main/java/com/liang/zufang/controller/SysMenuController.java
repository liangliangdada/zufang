package com.liang.zufang.controller;

import com.liang.zufang.entity.sys.Menu;
import com.liang.zufang.service.SysMenuService;
import com.liang.zufang.utils.DataGrid;
import com.liang.zufang.utils.JsonResult;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * @author liuliang
 * @description 菜单管理
 * @date 2019/5/9
 **/
@Controller
@RequestMapping("menu")
public class SysMenuController {

    @Resource
    private SysMenuService menuService;

    @RequestMapping("index")
    public String index(){
        return "menu/list";
    }

    @RequestMapping("list")
    @ResponseBody
    public DataGrid list(Menu menu){
        List<Menu> menuList = menuService.selectAll(menu);
        return DataGrid.build(menuList, 0);
    }

    @RequestMapping("edit")
    public String edit(HttpServletRequest request,Long id){
        if(id != null){
            Menu menu = menuService.selectById(id);
            request.setAttribute("menu", menu);
        }
        List<Menu> menuList = menuService.selectAll(null);
        request.setAttribute("menuList", menuList);
        return "menu/edit";
    }

    @RequestMapping("save")
    @ResponseBody
    public JsonResult save(Menu menu){
        menuService.save(menu);
        return JsonResult.build(true, "保存成功！");
    }

    @RequestMapping("del")
    @ResponseBody
    public JsonResult del(Long id){
        menuService.del(id);
        return JsonResult.build(true, "删除成功！");
    }

    /**
     * 菜单树
     * @param roleId
     * @return
     */
    @RequestMapping("tree")
    @ResponseBody
    public List<Map<String,Object>> tree(Long roleId){
        return menuService.tree(roleId);
    }


}

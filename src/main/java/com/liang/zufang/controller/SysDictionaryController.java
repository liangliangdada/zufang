package com.liang.zufang.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.liang.zufang.entity.sys.Dictionary;
import com.liang.zufang.service.SysDictionaryService;
import com.liang.zufang.utils.DataGrid;
import com.liang.zufang.utils.JsonResult;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author liuliang
 * @description 数据字典
 * @date 2019/5/10
 **/
@Controller
@RequestMapping("dictionary")
public class SysDictionaryController {

    @Resource
    private SysDictionaryService dictionaryService;

    @RequestMapping("index")
    public String index(){
        return "dictionary/list";
    }

    @RequestMapping("list")
    @ResponseBody
    public DataGrid list(Dictionary dictionary){
        List<Dictionary> list = dictionaryService.list();
        return DataGrid.build(list, 0);
    }

    @RequestMapping("edit")
    public String edit(HttpServletRequest request,Long id){
        if(id != null){
            request.setAttribute("dictionary", dictionaryService.getById(id));
        }
        QueryWrapper<Dictionary> queryWrapper = new QueryWrapper();
        queryWrapper.eq("parent_id", 0);
        request.setAttribute("dictionaryList", dictionaryService.list(queryWrapper));
        return "dictionary/edit";
    }

    @RequestMapping("save")
    @ResponseBody
    public JsonResult save(Dictionary dictionary){
        dictionaryService.saveOrUpdate(dictionary);
        return JsonResult.build(true, "保存成功！");
    }

    @RequestMapping("del")
    @ResponseBody
    public JsonResult del(Long id){
        dictionaryService.delAllById(id);
        return JsonResult.build(true, "删除成功！");
    }



}

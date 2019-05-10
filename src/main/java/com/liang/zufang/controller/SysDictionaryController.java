package com.liang.zufang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author liuliang
 * @description 数据字典
 * @date 2019/5/10
 **/
@Controller
@RequestMapping("dictionary")
public class SysDictionaryController {

    @RequestMapping("index")
    public String index(){
        return "dictionary/list";
    }

}

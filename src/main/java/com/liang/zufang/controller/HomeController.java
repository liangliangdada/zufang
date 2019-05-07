package com.liang.zufang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * 首页
 *
 * */
@Controller
@RequestMapping("home")
public class HomeController {

    @RequestMapping("index")
    public String index(){
        return "sys/home";
    }

}

package com.liang.zufang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author liuliang
 * @description 登录
 * @date 2019/5/7
 **/
@Controller
@RequestMapping("login")
public class LoginController {

    @RequestMapping("index")
    public String index(){
        return "sys/login";
    }

}

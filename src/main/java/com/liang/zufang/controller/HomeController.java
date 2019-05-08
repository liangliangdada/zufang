package com.liang.zufang.controller;

import com.liang.zufang.entity.sys.Menu;
import com.liang.zufang.entity.sys.User;
import com.liang.zufang.service.SysUserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 首页
 *
 * */
@Controller
@RequestMapping("main")
public class HomeController {

    @Resource
    private SysUserService userService;


    @RequestMapping(value = "index",method = RequestMethod.GET)
    public String index(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        List<Menu> menuList = userService.selectMenusByUserId(user.getId());
        request.setAttribute("menuList", menuList);
        return "sys/main";
    }

}

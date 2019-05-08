package com.liang.zufang.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.liang.zufang.entity.sys.User;
import com.liang.zufang.service.SysUserService;
import com.liang.zufang.utils.DataGrid;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author liuliang
 * @description 用户管理
 * @date 2019/5/8
 **/
@Controller
@RequestMapping("user")
public class UserController {

    @Resource
    private SysUserService userService;

    @RequestMapping("index")
    public String index(){
        return "user/list";
    }

    @RequestMapping("list")
    @ResponseBody
    public DataGrid list(User user){
        PageHelper.startPage(user.getPage(), user.getLimit());
        List<User> userList = userService.selectAll();
        PageInfo<User> userPageInfo = new PageInfo<User>(userList);
        return DataGrid.build(userPageInfo.getList(), userPageInfo.getTotal());
    }


}

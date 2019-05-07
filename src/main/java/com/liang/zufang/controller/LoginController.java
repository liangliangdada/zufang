package com.liang.zufang.controller;

import com.liang.zufang.utils.JsonResult;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

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

    @RequestMapping(value = "checkLogin",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult checkLogin(HttpServletRequest request,String userName,String password){
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken usernamePasswordToken = new UsernamePasswordToken(userName, DigestUtils.md5DigestAsHex(password.getBytes()));
        try {
            subject.login(usernamePasswordToken);
        }catch (UnknownAccountException e){
            return JsonResult.build(false,"用户不存在！");
        }catch (IncorrectCredentialsException e){
            return JsonResult.build(false,"密码错误！");
        }
        request.getSession().setAttribute("user", subject.getPrincipal());
        return JsonResult.build(true,"登录成功！");
    }

}

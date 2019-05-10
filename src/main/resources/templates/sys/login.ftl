<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>欢迎登陆</title>
    <#include "../common/static.ftl">
    <link rel="stylesheet" href="${request.getContextPath()}/css/login.css" media="all">
</head>

<body>
<!--主体-->
<canvas id="c"></canvas>
<div class="login-layout">
    <div class="top">
        <h2>房屋租赁管理系统</h2>
    </div>
    <form method="post" class="layui-form" action="${request.getContextPath()}/login/checkLogin">
        <div class="lock-holder">
            <div class="form-group pull-left input-username">
                <label style="top: 5px">账号</label>
                <input name="userName" id="userName" value="admin" autocomplete="off" type="text" class="input-text" lay-verify="required" placeholder="账号" value="" required="">
            </div>
            <div class="form-group pull-right input-password-box">
                <label style="top: 15px">密码</label>
                <input name="password" id="password" value="123456"  style="margin-top: 10px" class="input-text" autocomplete="off" type="password" required="" lay-verify="required" placeholder="密码">
            </div>
        </div>

        <div class="submit">
            <span>
                <input class="input-button btn-submit"  lay-submit lay-filter="login-filter" type="button" value="登录">
            </span>
        </div>
        <div class="submit2"></div>
    </form>
    <div class="bottom"></div>
</div>
<script type="text/javascript" src="${request.getContextPath()}/js/login.js"></script>
<script type="text/javascript">
    layui.use(['layer','form'],function(){
        if (window != top){
            top.location.href = location.href;
        }
        var $= layui.$;
        var layer = layui.layer;
        var form = layui.form;
        form.on('submit(login-filter)', function(data){
            $.ajax({
                url: data.form.action,
                type: data.form.method,
                data: $(data.form).serialize(),
                dataType:"json",
                success: function (data) {
                    if(data.success){
                        window.location.href="${request.getContextPath()}/main/index";
                    }else{
                        layer.msg(data.msg, {offset: '10%',icon: 5});
                    }
                }
            });
            return false;
        });
    });
</script>
</body>
</html>
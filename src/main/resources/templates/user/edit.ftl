<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户列表</title>
    <#include "../common/static.ftl">
</head>
<body>
    <div>
        <form class="layui-form form-class" lay-filter="user-form-filter" action="${request.getContextPath()}/user/save" method="post" >
            <div class="layui-form-item" >
                <label class="layui-form-label">姓名：</label>
                <div class="layui-input-block">
                    <input type="text" name="name" required lay-verify="required" autocomplete="off" placeholder="请输入姓名"
                           class="layui-input" value="${(user.name)!}">
                </div>
            </div>
            <div class="layui-form-item" >
                <label class="layui-form-label">用户名：</label>
                <div class="layui-input-block">
                    <input type="text" name="userName" lay-verify="required" autocomplete="off" placeholder="请输入用户名"
                           class="layui-input" value="${(user.userName)!}">
                </div>
            </div>
            <div class="layui-hide">
                <input name="id" type="hidden" value="${(user.id)!}" >
                <button class="layui-btn" lay-submit lay-filter="user-submit-filter" id="submitForm"></button>
            </div>
        </form>
    </div>

    <script>
        var index = parent.layer.getFrameIndex(window.name);
        layui.use(['form'],function () {
            var $ = layui.$;
            var form = layui.form;
            form.on('submit(user-submit-filter)', function(data){
                $.ajax({
                    url: data.form.action,
                    type: data.form.method,
                    data: $(data.form).serialize(),
                    dataType:"json",
                    success: function (data) {
                        if(data.success){
                            parent.layer.msg(data.msg, {icon: 1});
                            //关闭父页面
                            parent.layer.close(index);
                            //刷新父页面table
                            parent.layui.table.reload('user-table');
                        }else{
                            parent.layer.msg(data.msg, {icon: 5});
                        }
                        return false;
                    }
                });
                return false;//阻止表单跳转
            });
        });
        
    </script>
</body>
</html>
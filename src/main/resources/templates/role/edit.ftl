<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>角色编辑</title>
    <#include "../common/static.ftl">
</head>
<body>
    <div>
        <form class="layui-form form-class" lay-filter="menu-form-filter" action="${request.getContextPath()}/role/save" method="post" >
            <div class="layui-form-item" >
                <label class="layui-form-label">名称：</label>
                <div class="layui-input-block">
                    <input type="text" name="name" required lay-verify="required" autocomplete="off" placeholder="请输入角色名称"
                           class="layui-input" value="${(role.name)!}">
                </div>
            </div>
            <div class="layui-form-item" >
                <label class="layui-form-label">编码：</label>
                <div class="layui-input-block">
                    <input type="text" name="code" required lay-verify="required" autocomplete="off" placeholder="请输入角色编码"
                           class="layui-input" value="${(role.code)!}" >
                </div>
            </div>
            <div class="layui-form-item" >
                <label class="layui-form-label">描述：</label>
                <div class="layui-input-block">
                    <input type="text" name="description" lay-verify="" autocomplete="off" placeholder="请输入角色描述"
                           class="layui-input" value="${(role.description)!}" >
                </div>
            </div>
            <div class="layui-hide">
                <input name="id" type="hidden" value="${(role.id)!}" >
                <button class="layui-btn" lay-submit lay-filter="submit-filter" id="save"></button>
            </div>
        </form>
    </div>

    <script>
        var index = parent.layer.getFrameIndex(window.name);
        layui.use(['form'],function () {
            var $ = layui.$;
            var form = layui.form;
            form.on('submit(submit-filter)', function(data){
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
                            parent.layui.table.reload('role-table');
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
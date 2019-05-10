<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>菜单编辑</title>
    <#include "../common/static.ftl">
</head>
<body>
    <div>
        <form class="layui-form form-class" lay-filter="menu-form-filter" action="${request.getContextPath()}/menu/save" method="post" >
            <div class="layui-form-item" >
                <label class="layui-form-label">上级菜单：</label>
                <div class="layui-input-block">
                    <select name="parentId" lay-verify="required">
                        <option value="0">一级菜单</option>
                        <#list menuList as  item>
                            <option value="${item.id}"  <#if menu?? && menu.parentId==item.id>selected</#if> >${item.name}</option>
                        </#list>
                    </select>
                </div>
            </div>
            <div class="layui-form-item" >
                <label class="layui-form-label">名称：</label>
                <div class="layui-input-block">
                    <input type="text" name="name" required lay-verify="required" autocomplete="off" placeholder="请输入名称"
                           class="layui-input" value="${(menu.name)!}">
                </div>
            </div>
            <div class="layui-form-item" >
                <label class="layui-form-label">链接：</label>
                <div class="layui-input-block">
                    <input type="text" name="url" lay-verify="" autocomplete="off" placeholder="请输入链接"
                           class="layui-input" value="${(menu.url)!}" >
                </div>
            </div>
            <div class="layui-form-item" >
                <label class="layui-form-label">编码：</label>
                <div class="layui-input-block">
                    <input type="text" name="code" lay-verify="required" autocomplete="off" placeholder="请输入编码"
                           class="layui-input" value="${(menu.code)!}" >
                </div>
            </div>
            <div class="layui-form-item" >
                <label class="layui-form-label">类型：</label>
                <div class="layui-input-block">
                    <input type="radio" name="type" value="0" title="菜单" checked />
                    <input type="radio" name="type" value="1" title="按钮" <#if menu?? && menu.type==1>checked</#if> />
                </div>
            </div>
            <div class="layui-form-item" >
                <label class="layui-form-label">排序：</label>
                <div class="layui-input-block">
                    <input type="number" name="sort" lay-verify="required" autocomplete="off" placeholder="请输入排序号"
                           class="layui-input" value="${(menu.sort)!}" >
                </div>
            </div>
            <div class="layui-hide">
                <input name="id" type="hidden" value="${(menu.id)!}" >
                <button class="layui-btn" lay-submit lay-filter="submit-filter" id="save"></button>
            </div>
        </form>
    </div>

    <script>
        var index = parent.layer.getFrameIndex(window.name);
        layui.use(['form'],function () {
            var $ = layui.$;
            var form = layui.form;
            <#if menu??>
            //form.val("menu-form-filter",${menu});
            </#if>
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
                            parent.renderTable();
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
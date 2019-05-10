<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>字典编辑</title>
    <#include "../common/static.ftl">
</head>
<body>
    <div>
        <form class="layui-form form-class" lay-filter="form-filter" action="${request.getContextPath()}/dictionary/save" method="post" >
            <div class="layui-form-item" >
                <label class="layui-form-label">父级字典：</label>
                <div class="layui-input-block">
                    <select name="parentId" lay-verify="required">
                        <option value="0">父级字典</option>
                        <#list dictionaryList as  item>
                            <option value="${item.id}"  <#if dictionary?? && dictionary.parentId==item.id>selected</#if> >${item.name}</option>
                        </#list>
                    </select>
                </div>
            </div>
            <div class="layui-form-item" >
                <label class="layui-form-label">名称：</label>
                <div class="layui-input-block">
                    <input type="text" name="name" required lay-verify="required" autocomplete="off" placeholder="请输入名称"
                           class="layui-input" value="${(dictionary.name)!}" />
                </div>
            </div>
            <div class="layui-form-item" >
                <label class="layui-form-label">key：</label>
                <div class="layui-input-block">
                    <input type="text" name="keyValue" lay-verify="required" autocomplete="off" placeholder="请输入key"
                           class="layui-input" value="${(dictionary.keyValue)!}"  <#if dictionary??>readonly</#if>  />
                </div>
            </div>
            <div class="layui-form-item" >
                <label class="layui-form-label">排序：</label>
                <div class="layui-input-block">
                    <input type="number" name="sort" lay-verify="required" autocomplete="off" placeholder="请输入排序号"
                           class="layui-input" value="${(dictionary.sort)!}" />
                </div>
            </div>
            <div class="layui-hide">
                <input name="id" type="hidden" value="${(dictionary.id)!}" />
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
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <#include "../common/static.ftl">
</head>
<body>

<div>
    <button class="layui-btn layui-btn-sm" id="add-menu">
        <i class="layui-icon">&#xe608;</i>新增
    </button>
</div>

<table id="table1" class="layui-table" lay-filter="table1"></table>
<!-- 操作列 -->
<script type="text/html" id="auth-state">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="edit">修改</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script>
    layui.config({
        base: '${request.getContextPath()}/js/plugins/module/'
    }).extend({
        treetable: 'treetable-lay/treetable'
    }).use(['table','treetable'], function () {
        var table = layui.table;
        var treetable = layui.treetable;
        // 渲染表格
        treetable.render({
            treeColIndex: 2,          // 树形图标显示在第几列
            treeSpid: 0,             // 最上级的父级id
            treeIdName: 'id',
            treePidName: 'parentId',
            treeDefaultClose: false,   // 默认折叠
            treeLinkage: true,        // 父级展开时是否自动展开所有子级
            elem: '#table1',
            url: '${request.getContextPath()}/menu/list',
            cols: [[
                {type: 'numbers'},
                {field: 'name', title: '名称'},
                {field: 'url', title: '链接'},
                {field: 'code', title: '编码'},
                {field: 'type', title: '类型',align: 'center',templet: function (d) {
                        if (d.type == 1) {
                            return '<span class="layui-badge layui-bg-gray">按钮</span>';
                        }
                        if (d.parentId == 0) {
                            return '<span class="layui-badge layui-bg-blue">目录</span>';
                        } else {
                            return '<span class="layui-badge-rim">菜单</span>';
                        }
                }},
                {field: 'sort', title: '排序',align: 'center'},
                {templet: '#auth-state', width: 120, align: 'center', title: '操作'}

            ]]
        });

        //监听工具条
        table.on('tool(table1)', function (obj) {
            var data = obj.data;
            var layEvent = obj.event;
            if (layEvent === 'del') {
                layer.msg('删除' + data.id);
            } else if (layEvent === 'edit') {
                layer.msg('修改' + data.id);
            }
        });

        $('#add-menu').click(function () {
            edit(0);
        });

        //编辑
        function edit(id) {
            layer.open({
                title:'菜单',
                type: 2,
                content: '${request.getContextPath()}/menu/edit?id='+id,
                area: ['500px', '450px'],
                btn: ['保存','取消'],
                yes: function(index, layero){
                    var submitForm = layer.getChildFrame('#submitForm', index);
                    submitForm.click();
                }
            });
        };

    });
</script>
</body>
</html>    
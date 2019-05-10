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

<table id="menu-table" class="layui-table" lay-filter="menu-table-filter"></table>
<!-- 操作列 -->
<script type="text/html" id="auth-state">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="edit">修改</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script>
    var renderTable;
    layui.config({
        base: '${request.getContextPath()}/js/plugins/module/'
    }).extend({
        treetable: 'treetable-lay/treetable'
    }).use(['table','treetable','layer'], function () {
        var table = layui.table;
        var treetable = layui.treetable;
        var layer = layui.layer;

        // 渲染表格 刷新使用
        renderTable = function(){
            treetable.render({
                treeColIndex: 2,          // 树形图标显示在第几列
                treeSpid: 0,             // 最上级的父级id
                treeIdName: 'id',
                treePidName: 'parentId',
                treeDefaultClose: false,   // 默认折叠
                treeLinkage: true,        // 父级展开时是否自动展开所有子级
                elem: '#menu-table',
                url: '${request.getContextPath()}/menu/list',
                cols: [[
                    {type: 'numbers'},
                    {field: 'name', title: '名称'},
                    {field: 'url', title: 'url',templet: function (d) {
                            return d.url == null?"":d.url;
                    }},
                    {field: 'code', title: '权限编码'},
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
        };
        renderTable();

        //监听工具条
        table.on('tool(menu-table-filter)', function (obj) {
            var data = obj.data;
            var layEvent = obj.event;
            if (layEvent === 'edit') {
                commons.openFrame("${request.getContextPath()}/menu/edit?id="+data.id,"新增菜单","500px","450px");
            } else if (layEvent === 'del') {
                del(data.id);
            }
        });

        //添加
        $('#add-menu').click(function () {
            commons.openFrame("${request.getContextPath()}/menu/edit","新增菜单","500px","450px");
        });

        //删除
        function del(id) {
            layer.confirm("确认删除该菜单及其子菜单？", function(index){
                $.ajax({
                    url: "${request.getContextPath()}/menu/del",
                    type: "post",
                    data: {"id":id},
                    dataType:"json",
                    success: function (data) {
                        if(data.success){
                            layer.msg(data.msg, {icon: 1});
                            //刷新表格
                            renderTable();
                        }else{
                            layer.msg(data.msg, {icon: 5});
                        }
                        return false;
                    }
                });
                layer.close(index);
            });
        }
    });
</script>
</body>
</html>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>字典列表</title>
    <#include "../common/static.ftl">
</head>
<body>
<div style="margin-top: 5px">
    <button class="layui-btn layui-btn-sm" id="add-dictionary">
        <i class="layui-icon">&#xe608;</i> 添加
    </button>
</div>
<table id="dictionary-table" lay-filter="table-filter"></table>
<!-- 操作列 -->
<script type="text/html" id="row-tools">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script type="text/html" id="row-tools">
    <div>
        <button class="layui-btn layui-btn-xs" lay-event="edit">
            编辑
        </button>
        <button class="layui-btn layui-btn-xs layui-btn-normal" lay-event="permission">
            授权
        </button>
        <button class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">
            删除
        </button>
    </div>
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
                elem: '#dictionary-table',
                url: '${request.getContextPath()}/dictionary/list',
                cols: [[
                    {type: 'numbers'},
                    {field: 'name', title: '名称'},
                    {field: 'keyValue', title: 'key'},
                    {field: 'sort', title: '排序',align: 'center'},
                    {templet: '#row-tools', width: 120, align: 'center', title: '操作'}
                ]]
            });
        };
        renderTable();

        //监听工具条
        table.on('tool(table-filter)', function (obj) {
            var data = obj.data;
            var layEvent = obj.event;
            if (layEvent === 'edit') {
                commons.openFrame("${request.getContextPath()}/dictionary/edit?id="+data.id,"编辑字典","500px","350px");
            } else if (layEvent === 'del') {
                del(data.id);
            }
        });

        //添加
        $('#add-dictionary').click(function () {
            commons.openFrame("${request.getContextPath()}/dictionary/edit","新增字典","500px","350px");
        });

        //删除
        function del(id) {
            layer.confirm("确认删除该字典及其子项？", function(index){
                $.ajax({
                    url: "${request.getContextPath()}/dictionary/del",
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
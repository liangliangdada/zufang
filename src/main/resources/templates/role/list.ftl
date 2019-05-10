<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>角色列表</title>
    <#include "../common/static.ftl">
</head>
<body>
<table id="role-table" lay-filter="table-filter"></table>
<script type="text/html" id="table-tools">
    <div>
        <button class="layui-btn layui-btn-sm" lay-event="add">
            <i class="layui-icon">&#xe608;</i> 添加
        </button>
    </div>
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
    layui.use(['layer','table'], function(){
        var $ = layui.jquery;
        var layer = layui.layer;
        var table = layui.table;

        var options = {
            elem : '#role-table',
            tools : '#table-tools',
            url : '${request.getContextPath()}/role/list',
            cols : [[
                {field: 'name', title: '角色',align:'center'},
                {field: 'code', title: '编码',align:'center'},
                {field: 'description', title: '描述',align:'center'},
                {field: '_', title: '操作',align:'center',toolbar:'#row-tools'}
            ]]
        };
        commons.initTable(table,options);

        //头部工具栏事件
        table.on('toolbar(table-filter)', function(obj){
            var layEvent = obj.event;
            if(layEvent == 'add'){
                commons.openFrame("${request.getContextPath()}/role/edit","新增角色","500px","300px")
            }
        });

        //行工具栏事件
        table.on('tool(table-filter)', function(obj){
            var data = obj.data;
            var layEvent = obj.event;
            if(layEvent == 'edit'){
                commons.openFrame("${request.getContextPath()}/role/edit?id="+data.id,"编辑角色","500px","300px")
            }else if(layEvent == 'permission'){
                commons.openFrame("${request.getContextPath()}/role/permission?roleId="+data.id,"角色授权","500px","300px")
            }else if(layEvent == 'del'){
                var options={
                    msg:"确认删除该角色?",
                    url :"${request.getContextPath()}/role/del",
                    data : {"id":data.id},
                    tableId : "role-table"
                };
                commons.deleteRow(table,options);
            }
        });

    });
</script>
</body>
</html>
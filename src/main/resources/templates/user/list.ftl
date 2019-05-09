<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户列表</title>
    <#include "../common/static.ftl">
</head>
<body>
<table id="user-table" lay-filter="table-filter"></table>
<script type="text/html" id="table-tools">
    <div>
        <button class="layui-btn layui-btn-sm" lay-event="add">
            <i class="layui-icon">&#xe608;</i> 添加
        </button>
    </div>
</script>
<script type="text/html" id="row-tools">
    <div>
        <button class="layui-btn layui-btn-sm" lay-event="edit">
            编辑
        </button>
        <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="permission">
            授权
        </button>
        <button class="layui-btn layui-btn-sm layui-btn-danger" lay-event="del">
            删除
        </button>
    </div>
</script>
<script>
    layui.use(['layer','table'], function(){
        var $ = layui.jquery;
        var layer = layui.layer;
        var table = layui.table;
        layer.config({
            skin: 'layer-open-class'
        });

        table.render({
            elem: '#user-table',
            toolbar:'#table-tools',
            height: 'full-20',
            url: '${request.getContextPath()}/user/list',
            page: true,
            limit:20,
            limits:[10,20,30],
            loading:true,
            cols: [[
                {field: 'name', title: '姓名',align:'center'},
                {field: 'userName', title: '用户名',align:'center'},
                {field: 'status', title: '用户状态',align:'center',templet:function (row) {
                    if(row.status == 0){
                        return '正常';
                    }
                }},
                {field: '_', title: '操作',align:'center',toolbar:'#row-tools'}
            ]]
        });

        //头部工具栏事件
        table.on('toolbar(table-filter)', function(obj){
            var layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent == 'add'){
                edit("${request.getContextPath()}/user/edit");
            }
        });

        //行工具栏事件
        table.on('tool(table-filter)', function(obj){
            var data = obj.data;
            var layEvent = obj.event;
            if(layEvent == 'edit'){
                edit("${request.getContextPath()}/user/edit?id="+data.id);
            }else if(layEvent == 'permission'){
                permission(data.id);
            }else if(layEvent == 'del'){
                layer.msg('del');
            }
        });

        //编辑
        function edit(url) {
            layer.open({
                title:'用户',
                type: 2,
                content: url,
                area: ['500px', '300px'],
                btn: ['保存','取消'],
                yes: function(index, layero){
                    var submitForm = layer.getChildFrame('#submitForm', index);
                    submitForm.click();
                    table.reload('user-table');
                }
            });
        };

        //授权
        function permission(id) {
            layer.open({
                title:'用户授权',
                type: 2,
                content: '${request.getContextPath()}/user/permission?id='+id,
                area: ['500px', '300px'],
                btn: ['保存','取消'],
                yes: function(index, layero){
                    var submitForm = layer.getChildFrame('#save', index);
                    submitForm.click();
                    table.reload('user-table');
                }
            });
        };

    });
</script>
</body>
</html>
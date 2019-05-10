<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户列表</title>
    <#include "../common/static.ftl">
</head>
<body>
<div>

    <form id="search-form" method="post">
        姓名： <input name="name" type="text"/>
        <#--必须用<a>否则表格会加载两次.....坑的一比-->
        <a href="javascript:void(0)" id="search" class="layui-btn layui-btn-xs" data-type="reload">搜索</a>
    </form>

</div>
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

        //数据表格
        var options = {
            elem : '#user-table',
            url : '${request.getContextPath()}/user/list',
            cols : [[
                {field: 'name', title: '姓名',align:'center'},
                {field: 'userName', title: '用户名',align:'center'},
                {field: 'status', title: '用户状态',align:'center',templet:function (row) {
                        if(row.status == 0){
                            return '正常';
                        }
                }},
                {field: '_', title: '操作',align:'center',toolbar:'#row-tools'}
            ]],
            tools : '#table-tools'
        };
        commons.initTable(table,options);

        //头部工具栏事件
        table.on('toolbar(table-filter)', function(obj){
            var layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent == 'add'){
                commons.openFrame("${request.getContextPath()}/user/edit",'用户新增','500px','300px');
            }
        });

        //行工具栏事件
        table.on('tool(table-filter)', function(obj){
            var data = obj.data;
            var layEvent = obj.event;
            if(layEvent == 'edit'){
                commons.openFrame("${request.getContextPath()}/user/edit?id="+data.id,'用户编辑','500px','300px');
            }else if(layEvent == 'permission'){
                commons.openFrame('${request.getContextPath()}/user/permission?id='+data.id,"用户授权",'300px', '300px');
            }else if(layEvent == 'del'){
                var options = {
                    msg : "确认删除该用户？",
                    url :"${request.getContextPath()}/user/del",
                    data : {"id":data.id},
                    tableId : "user-table" //需要刷新的表格id
                };
                commons.deleteRow(table,options);
            }
        });

        //表格搜索
        $("#search").click(function () {
            commons.searchTable(table,'#search-form','user-table');
        });

    });
</script>
</body>
</html>
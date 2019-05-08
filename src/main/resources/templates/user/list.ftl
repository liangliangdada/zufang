<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户列表</title>
    <link rel="stylesheet" href="${request.getContextPath()}/js/plugins/layui/css/layui.css" media="all">
    <script src="${request.getContextPath()}/js/plugins/layui/layui.js"></script>
</head>
<body>
<table id="user-table" lay-filter="user-table-filter"></table>
<script>
    layui.use('table', function(){
        var table = layui.table;
        table.render({
            elem: '#user-table',
            height: 'full-20',
            url: '${request.getContextPath()}/user/list',
            page: true,
            limit:20,
            limits:[10,20,30],
            loading:true,
            cols: [[
                {field: 'name', title: '姓名', width:80},
                {field: 'userName', title: '用户名', width:80, sort: true},
                {field: 'phone', title: '电话', width: 80, sort: true}
            ]]
        });
    });
</script>
</body>
</html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户授权</title>
    <link rel="stylesheet" href="${request.getContextPath()}/css/plugins/zTree/zTreeStyle/zTreeStyle.css">
    <script src="${request.getContextPath()}/js/plugins/zTree/jquery-1.4.4.min.js"></script>
    <script src="${request.getContextPath()}/js/plugins/zTree/jquery.ztree.core.js"></script>
    <script src="${request.getContextPath()}/js/plugins/zTree/jquery.ztree.excheck.js"></script>
</head>
<body>
<div>
    <ul id="treeDemo" class="ztree"></ul>
</div>

<script>
    var zTreeObj;
    // zTree 的参数配置，深入使用请参考 API 文档（setting 配置详解）
    var setting = {};
    // zTree 的数据属性，深入使用请参考 API 文档（zTreeNode 节点数据详解）
    var zNodes = [
        {name:"test1", open:true, children:[
                {name:"test1_1"}, {name:"test1_2"}]},
        {name:"test2", open:true, children:[
                {name:"test2_1"}, {name:"test2_2"}]}
    ];
    $(document).ready(function(){
        zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
    });
</script>
</body>
</html>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户授权</title>
    <link rel="stylesheet" href="${request.getContextPath()}/css/plugins/zTree/zTreeStyle/zTreeStyle.css">
    <link rel="stylesheet" href="${request.getContextPath()}/js/plugins/layui/css/layui.css" media="all">
    <script src="${request.getContextPath()}/js/plugins/zTree/jquery-1.4.4.min.js"></script>
    <script src="${request.getContextPath()}/js/plugins/zTree/jquery.ztree.core.js"></script>
    <script src="${request.getContextPath()}/js/plugins/zTree/jquery.ztree.excheck.js"></script>
    <script src="${request.getContextPath()}/js/plugins/layui/layui.js"></script>
</head>
<body>
<div>
    <ul id="roleTree" class="ztree"></ul>
</div>
<div class="layui-hide">
    <input id="userId" type="text" value="${userId}" />
    <button type="button" id="save"></button>
</div>
<script>
    var zTreeObj;
    var setting = {
        async:{
            enable: true,
            url: "${request.getContextPath()}/role/tree?userId=1",
            //otherParam: { "roleId":function(){return roleId}} //获取全局变量值
        },
        check:{
            enable: true,
            chkboxType: { "Y" : "ps", "N" : "ps" }
        },
    };
    var index = parent.layer.getFrameIndex(window.name);
    $(document).ready(function(){
        zTreeObj = $.fn.zTree.init($("#roleTree"), setting);
        $("#save").click(function () {
            var userId = $("#userId").val();
            var nodes = zTreeObj.getCheckedNodes(true);
            if(nodes.length == 0){

                layui.use(['layer'],function () {
                    var layer = layui.layer;
                    layer.msg('请选择角色！！', {icon: 5});
                });
                return false;
            }
            console.log(nodes);
        });
    });
</script>
</body>
</html>    
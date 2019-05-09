<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户授权</title>
    <#include "../common/static.ftl">
    <link rel="stylesheet" href="${request.getContextPath()}/css/plugins/zTree/zTreeStyle/zTreeStyle.css">
    <script src="${request.getContextPath()}/js/plugins/zTree/jquery-1.4.4.min.js"></script>
    <script src="${request.getContextPath()}/js/plugins/zTree/jquery.ztree.core.js"></script>
    <script src="${request.getContextPath()}/js/plugins/zTree/jquery.ztree.excheck.js"></script>
</head>
<body>
<div style="text-align: center">
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
            url: "${request.getContextPath()}/role/tree?userId=${userId}",
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
            var para = {};
            var roles = [];
            for (var i=0;i<nodes.length;i++){
                roles[i] = nodes[i].id
            }
            para.userId = "${userId}";
            para.roles = roles;
            $.ajax({
                url: "${request.getContextPath()}/user/saveUserRoles",
                type: "post",
                data: para,
                dataType:"json",
                success: function (data) {
                    if(data.success){
                        parent.layer.msg(data.msg, {icon: 1});
                        parent.layer.close(index);
                    }else{
                        parent.layer.msg(data.msg, {icon: 5});
                    }
                    return false;
                }
            });
        });
    });
</script>
</body>
</html>    
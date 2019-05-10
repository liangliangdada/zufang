<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户授权</title>
    <#include "../common/static.ftl">
    <link rel="stylesheet" href="${request.getContextPath()}/css/plugins/zTree/zTreeStyle/zTreeStyle.css">
    <script src="${request.getContextPath()}/js/plugins/zTree/jquery.ztree.core.js"></script>
    <script src="${request.getContextPath()}/js/plugins/zTree/jquery.ztree.excheck.js"></script>
</head>
<body>
<div style="text-align: center">
    <ul id="menuTree" class="ztree"></ul>
</div>
<div class="layui-hide">
    <button type="button" id="save"></button>
</div>
<script>
    var zTreeObj;
    var setting = {
        async:{
            enable: true,
            url: "${request.getContextPath()}/menu/tree?roleId=${roleId}",
        },
        check:{
            enable: true,
            chkboxType: { "Y" : "ps", "N" : "ps" }
        },
        data: {
            simpleData: {
                enable: true,
                idKey: "id",
                pIdKey: "parent_id",
                rootPId: 0
            }
        }
    };
    var index = parent.layer.getFrameIndex(window.name);
    $(document).ready(function(){
        zTreeObj = $.fn.zTree.init($("#menuTree"), setting);
        $("#save").click(function () {
            var nodes = zTreeObj.getCheckedNodes(true);
            if(nodes.length == 0){
                parent.layer.msg('请选择目录！！', {icon: 5});
                return false;
            }
            var para = {};
            var menus = [];
            for (var i=0;i<nodes.length;i++){
                menus[i] = nodes[i].id
            }
            para.roleId = "${roleId}";
            para.menus = menus;
            $.ajax({
                url: "${request.getContextPath()}/role/saveRoleMenus",
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
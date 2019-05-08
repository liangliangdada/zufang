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
    <ul id="roleTree" class="ztree"></ul>
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
    $(document).ready(function(){
        zTreeObj = $.fn.zTree.init($("#roleTree"), setting);
    });
</script>
</body>
</html>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>房屋租赁管理系统</title>
    <link rel="stylesheet" href="${request.getContextPath()}/js/plugins/layui/css/layui.css">
    <style type="text/css">
        .first-tab i.layui-tab-close {
            display: none !important;
        }
    </style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo"><h3>房屋租赁管理系统</h3></div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:void(0);">
                    <img src="${request.getContextPath()}/images/userHead.png" class="layui-nav-img">
                    ${user.name}
                </a>
                <dl class="layui-nav-child">
                    <dd><a id="change-password" href="javascript:void(0)">修改密码</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a id="quit" href="javascript:void(0)">退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="menu">
                <#if menuList?? >
                    <#list menuList as item>
                        <li class="layui-nav-item">
                            <#if item.parentId == 0>
                                <#if (item.url)?? && item.url != "">
                                    <a data-url="${request.getContextPath()}${item.url}" data-id="${item.id}"
                                       data-title="${item.name}" href="javascript:void(0);"
                                       class="site-active">${item.name}</a>
                                <#else>
                                    <a href="javascript:void(0);">${item.name}</a>
                                </#if>
                                <dl class="layui-nav-child">
                                    <#list menuList as children>
                                        <#if children.parentId == item.id>
                                            <dd><a data-url="${request.getContextPath()}${children.url}"
                                                   data-id="${children.id}" data-title="${children.name}"
                                                   href="javascript:void(0);" class="site-active">${children.name}</a>
                                            </dd>
                                        </#if>
                                    </#list>
                                </dl>
                            </#if>
                        </li>
                    </#list>
                </#if>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div class="layui-tab" lay-filter="tab" lay-allowClose="false">
            <ul class="layui-tab-title">
                <li class="layui-this first-tab" lay-id="0">首页</li>
            </ul>
            <ul class="rightmenu" style="display: none;position: absolute;">
                <li data-type="closethis">关闭当前</li>
                <li data-type="closeall">关闭所有</li>
            </ul>
            <div class="layui-tab-content" style="height: 100%">
                <div class="layui-tab-item layui-show" style="height: calc(100vh - 200px);">
                    <iframe data-frameid="0" scrolling="auto" frameborder="0"
                            src="${request.getContextPath()}/home/main" style="width:100%;height:100%;"></iframe>
                </div>
            </div>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        <div align="center">
            版权所有 https://gitee.com/liangliangdada/insist.git
        </div>
    </div>
</div>
<div id="password-win" style="display: none">
    <form class="layui-form" lay-filter="password-form-filter" action="${request.getContextPath()}/password"
          method="post" style="margin-top: 10px">
        <div class="layui-form-item" align="left">
            <label class="layui-form-label">原密码：</label>
            <div class="layui-input-block">
                <input type="text" style="width: 90%" name="oldPassword" required lay-verify="required"
                       placeholder="请输入原密码" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" align="left">
            <label class="layui-form-label">新密码：</label>
            <div class="layui-input-block">
                <input type="text" style="width: 90%" name="password" required lay-verify="required"
                       placeholder="请输入新密码" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" id="level-form-tool">
            <div align="center">
                <button class="layui-btn" lay-submit lay-filter="password-submit-filter">保存</button>
                <button type="button" id="close-password-win" class="layui-btn layui-btn-danger">取消</button>
            </div>
        </div>
    </form>
</div>
</body>
<script src="${request.getContextPath()}/js/plugins/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use(['element', 'layer', 'form'], function () {
        var $ = layui.jquery;
        var element = layui.element;
        var layer = layui.layer;
        var form = layui.form;
        var layerIndex = 0;
        layer.config({
            skin: 'title-class',  //自定义标题样式
        });
        element.on('nav(menu)', function (elem) {
            //console.log(elem.html()); //得到当前点击的DOM对象
        });

        //触发事件
        var active = {
            //在这里给active绑定几项事件，后面可通过active调用这些事件
            tabAdd: function (url, id, name) {
                //新增一个Tab项 传入三个参数，分别对应其标题，tab页面的地址，还有一个规定的id，是标签中data-id的属性值
                //关于tabAdd的方法所传入的参数可看layui的开发文档中基础方法部分
                element.tabAdd('tab', {
                    title: name,
                    content: '<iframe id="' + id + '" data-frameid="' + id + '" scrolling="auto" frameborder="0" src="' + url + '" style="width:100%;height:100%;"></iframe>',
                    id: id //规定好的lay-id

                });
                //CustomRightClick(id);
                //给tab绑定右击事件
                FrameWH();
                //计算ifram层的大小
            },
            tabChange: function (id, url, exist) {
                //切换到指定Tab项
                element.tabChange('tab', id);
                var height = $(window).height() - 200;
                $(".layui-show").css("height", height + "px");
                //console.log(url)
                //根据传入的id传入到指定的tab项
                //刷新tab 判断是否存在这个tab,如果有就刷新，没有就不需要刷新
                if (exist) {
                    document.getElementById(id).src = url;
                }
            },
            tabDelete: function (id) {
                element.tabDelete("tab", id);//删除
            },
            tabDeleteAll: function (ids) {
                //删除所有
                $.each(ids, function (i, item) {
                    element.tabDelete("tab", item);
                    //ids是一个数组，里面存放了多个id，调用tabDelete方法分别删除
                });
            }
        };

        //当点击有site-active属性的标签时，即左侧菜单栏中内容 ，触发点击事件
        $('.site-active').on('click', function () {
            var dataid = $(this);
            //这时会判断右侧.layui-tab-title属性下的有lay-id属性的li的数目，即已经打开的tab项数目
            if ($(".layui-tab-title li[lay-id]").length <= 0) {
                //如果比零小，则直接打开新的tab项
                active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"), dataid.attr("data-title"));
            } else {
                //否则判断该tab项是否以及存在
                var isData = false;
                //初始化一个标志，为false说明未打开该tab项 为true则说明已有
                $.each($(".layui-tab-title li[lay-id]"), function () {
                    //如果点击左侧菜单栏所传入的id 在右侧tab项中的lay-id属性可以找到，则说明该tab项已经打开
                    if ($(this).attr("lay-id") == dataid.attr("data-id")) {
                        isData = true;
                    }
                });
                if (isData == false) {
                    //标志为false 新增一个tab项
                    active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"), dataid.attr("data-title"));
                }
            }
            //最后不管是否新增tab，最后都转到要打开的选项页面上
            active.tabChange(dataid.attr("data-id"), dataid.attr("data-url"), isData);
        });

        function FrameWH() {
// 	  var h = $(window).height()-41-10-60-10-44-10;
// 	  $("iframe").css("height",h+"px");
        };
        $(window).resize(function () {
            //FrameWH();
        });

        //监听表单提交
        form.on('submit(password-submit-filter)', function (data) {
            $.ajax({
                url: data.form.action,
                type: data.form.method,
                data: $(data.form).serialize(),
                dataType: "json",
                success: function (info) {
                    if (info.flag) {
                        layer.close(layerIndex);
                        layer.msg(info.msg, {icon: 1});
                    } else {
                        layer.msg(info.msg, {icon: 5});
                    }
                    return false;
                }
            });
            return false;//阻止表单跳转。如果需要表单跳转
        });


        $("#change-password").click(function () {
            layerIndex = layer.open({
                title: '修改密码',
                area: ['30%', '30%'],
                type: 1,
                content: $("#password-win"), //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
                cancel: function (layerIndex, layero) {  //关闭层
                    layer.close(layerIndex)
                    //刷新父页面
                    window.location.reload();
                }
            });
        });

        $("#close-password-win").click(function () {
            layer.close(layerIndex)
            //刷新父页面
            //window.location.reload();
        });

        $("#quit").click(function () {
            layer.confirm('确认退出系统?', function (index) {
                layer.close(index);
                $.ajax({
                    url: "${request.getContextPath()}/login/loginout",
                    type: "post",
                    data: {},
                    dataType: "json",
                    success: function (info) {
                        if (info.flag) {
                            window.location.href = "${request.getContextPath()}/login";
                        } else {
                            layer.msg(info.msg, {icon: 5});
                        }
                    }
                });
            });
        });
    });
</script>
</html>
/**
 * 表单序列化为json
 * @param form
 */
function serializeObject(form) {
    var o = {};
    var a = $(form).serializeArray();
    $.each(a, function() {
        if (o[this.name]) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};
/**
 * layui公共js
 */
var commons = function(){
    //加载表格
    var initTable = function(table,options) {
        return table.render({
                    elem: options.elem,
                    toolbar: options.tools,
                    cols: options.cols,
                    url: options.url,
                    height: 'full-45',
                    method: 'post',
                    page: true,
                    limit:20,
                    limits:[10,20,30],
                    loading:true
                });
    };

    //表格搜索
    var searchTable  = function (table,formId,tableId) {
        var queryParams = serializeObject(formId);
        table.reload(tableId,{where: queryParams});
    };

    //弹出层
    var openFrame = function (url, title, width, height) {
        return  layer.open({
                    title: title,
                    type: 2,
                    content: url,
                    area: [width, height],
                    btn: ['保存','取消'],
                    yes: function(index, layero){
                        var save = layer.getChildFrame('#save', index);
                        save.click();
                    }
                });
    };

    //删除表格行
    var deleteRow = function (table,options) {
        return  layer.confirm(options.msg, function(index){
            $.ajax({
                url: options.url,
                type: "post",
                data: options.data,
                dataType:"json",
                success: function (data) {
                    if(data.success){
                        layer.msg(data.msg, {icon: 1});
                        //刷新表格
                        table.reload(options.tableId);
                    }else{
                        layer.msg(data.msg, {icon: 5});
                    }
                    return false;
                }
            });
            layer.close(index);
        });
    };

    return {
        initTable : function (table,options) {
            return initTable(table,options);
        },
        searchTable : function (table,formId,tableId) {
            return searchTable(table,formId,tableId);
        },
        openFrame : function (url, title, width, height) {
            return openFrame(url, title, width, height);
        },
        deleteRow : function (table,options) {
            return deleteRow(table,options);
        }
    };
}();

/**
 * 全局事件
 *
 */
// layui.use('layer',function () {
//     var layer = layui.layer;
//     layer.config({
//         //skin: 'layer-open-class'
//     });
// });

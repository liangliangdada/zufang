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
 * layer全局样式
 */
layui.use('layer',function () {
    var layer = layui.layer;
    layer.config({
        skin: 'layer-open-class'
    });
});

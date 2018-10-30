layui.extend({
    admin: '{/}../../static/js/admin'
});

layui.use(['form', 'table', 'jquery', 'admin'], function () {
    var form = layui.form,
        table = layui.table,
        $ = layui.jquery,
        admin = layui.admin;

    $("#btnImport").click(function(){
        //点击后禁用的代码自己完成
        $.post(
            //url
            '../../item/indexlib/import',
            //data
            null,
            //success
            function(data){
                console.log(data);
            },
            //dataType
            'json'
        );
        //点击提交异步请求到后台，一键导入索引库成功之后操作
        //1,提交成功或者失败
        //2,按钮再改为可用
    });


});
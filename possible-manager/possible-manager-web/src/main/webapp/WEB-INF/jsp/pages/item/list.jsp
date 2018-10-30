<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>商品列表-后台管理系统-Admin 1.0</title>
    <meta name="Description" content="基于layUI数据表格操作"/>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/weadmin.css">
    <%--<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>--%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
    <%--<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/itemlist.js" charset="utf-8"></script>--%>

    <!--<script type="text/javascript" src="../../static/js/admin.js"></script>-->
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        .layui-form-switch {
            width: 55px;
        }

        .layui-form-switch em {
            width: 40px;
        }

        .layui-form-onswitch i {
            left: 45px;
        }

        body {
            overflow-y: scroll;
        }
    </style>
</head>

<body>
<div class="weadmin-nav">
			<span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">商品管理</a>
        <a>
          <cite>商品列表</cite></a>
      </span>
    <a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right"
       href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">&#x1002;</i></a>
</div>
<div class="weadmin-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 we-search" onsubmit="return false;">
            商品搜索：
            <div class="layui-inline">
                <input type="text" id="title" name="title" placeholder="请输入商品名称关键字" autocomplete="off"
                       class="layui-input">
            </div>
            <button class="layui-btn" lay-submit="" lay-filter="search" data-type="reload"><i class="layui-icon">&#xe615;</i>
            </button>
        </form>
    </div>
    <div class="weadmin-block demoTable">
        <button class="layui-btn layui-btn-danger" data-type="getCheckData"><i class="layui-icon">&#xe640;</i>批量删除
        </button>
        <button class="layui-btn" onclick="WeAdminShow('添加商品','./add',600,500)"><i class="layui-icon">&#xe61f;</i>添加
        </button>
    </div>
    <table class="layui-hide" id="articleList"></table>


    <script type="text/html" id="operateTpl">
        <a title="编辑" onclick="WeAdminEdit('编辑','./edit', 2, 600, 400)" href="javascript:;">
            <i class="layui-icon">&#xe642;</i>
        </a>
        <a title="删除" href="javascript:;">
            <i class="layui-icon">&#xe640;</i>
        </a>
    </script>
    <%--<script type="text/html" id="shelfTpl">--%>
    <%--<form class="layui-form">--%>
    <%--<input type="checkbox" name="itemstatus" lay-filter="itemstatus" lay-skin="switch" lay-text="正常|下架" {{1==d.status?'checked':''}}/>--%>
    <%--</form>--%>
    <%--</script>--%>
    <script type="text/html" id="myTpl">
        <div class="layui-form">
            <input type="checkbox" name="itemStatus" id="itemStatus" lay-skin="switch" lay-text="正常|下架"
                   {{1==d.status?'checked':''}}/>
        </div>
    </script>

    <script>
        layui.extend({
            admin: '{/}../../static/js/admin'
        });
        layui.use(['admin', 'table', 'jquery', 'layer'], function () {
            //定义变量
            var table = layui.table,
                $ = layui.jquery,
                layer = layui.layer;
            //表格渲染
            table.render({
                //elem\url\cols表格属性
                //type\field\title 表头属性
                //将数据绑定到这个容器上
                elem: '#articleList',
                //发送这个异步请求到后台
                url: '../../items',
                //表头
                cols: [[
                    {type: 'checkbox'},
                    {field: 'id', title: '商品编号'},
                    {field: 'title', title: '商品名称'},
                    {field: 'cname', title: '分类名称'},
                    {field: 'status', title: '商品状态', templet:'#myTpl'}
                ]],
                page: true,
                done: function (res, curr, count) {
//                    console.log($("[data-field='status']").children());
//                    console.log(res);
//                    console.log(curr);
//                    console.log(count);
                    $("[data-field='status']").children().each(function (i) {
                        //text() html() val()
                        if ($(this).text() == '1') {
                            $(this).text('正常');
                        } else if ($(this).text() == '2') {
                            $(this).text('下架');
                        } else if ($(this).text() == '3') {
                            $(this).text('删除');
                        }
                    });
                }
            });
            //定义了一个空对象
            var active = {
                getCheckData: function () {
                    //获取到选中行
                    var data = table.checkStatus("articleList").data;

                    if (data.length > 0) {
                        //有被选中的行
                        //定义空数组
                        var ids = [];
                        //遍历选中行，取出里面的id设值到数组中
                        for (var i = 0; i < data.length; i++) {
                            ids.push(data[i].id);
                        }
                        //异步请求
                        $.post(
                            //url:这次异步请求提交给后台的谁进行处理
                            '../../items/batch',
                            //data:这次异步请求提交什么数据给后台
                            {'ids[]':ids},
                            //success:异步请求执行成功之后的回调函数
                            function(data){
                                //至少删除一条记录
                                if (data > 0) {
                                    //停留在原来页面刷新
                                    $('.layui-laypage-btn').click();
                                    layer.msg("恭喜，删除成功！", {icon: 1});
                                }
                            }
                            //dataType:返回类型
//                            ,'json'
                        );
                    } else {
                        //没有选中行
                        layer.msg("请至少选中一行", {icon: 5});
                    }
                },
                reload: function () {
                    var title = $('#title').val();
                    if(title != null && $.trim(title).length > 0){
                        //带条件重新加载表格
                        table.reload('articleList',{
                            //page
                            page: {curr:1},
                            //where
                            where:{title:title}
                        });
                    }
                }
            };

            //批量删除按钮的点击事件
            $('.demoTable .layui-btn-danger').on('click',function () {
                //获取按钮的data-type的值 //getCheckData
                var type = $(this).data('type');
                //在js存在一个对象，对象叫active
                active[type] ? active[type].call(this) : '';
            });
            //模糊查询按钮事件
            $('.weadmin-body .layui-btn').on('click',function(){
                var type = $(this).data('type');//reload
                active[type] ? active[type].call(this) : '';
            });
        });
    </script>

</div>
</body>

</html>
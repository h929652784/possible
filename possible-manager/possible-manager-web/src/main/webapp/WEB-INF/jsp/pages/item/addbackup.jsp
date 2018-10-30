<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>添加订单-后台管理系统-Admin 1.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/weadmin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/treeselect.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/treeselect.js"
            charset="utf-8"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<div class="weadmin-body">
    <form class="layui-form">
        <div class="layui-form-item">
            <label for="cid" class="layui-form-label">
                <span class="we-red">*</span>商品类别
            </label>
            <div class="layui-input-inline">
                <input type="text" id="cid" lay-filter="demo" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="title" class="layui-form-label">
                <span class="we-red">*</span>商品标题
            </label>
            <div class="layui-input-inline">
                <input type="text" id="title" name="title" required="" lay-verify="required" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label for="sellPoint" class="layui-form-label">商品卖点</label>
            <div class="layui-input-block">
                <textarea placeholder="请输入卖点" id="sellPoint" name="sellPoint" class="layui-textarea"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="priceView" class="layui-form-label">
                <span class="we-red">*</span>商品价格
            </label>
            <div class="layui-input-inline">
                <input type="text" id="priceView" name="priceView" required="" lay-verify="number" autocomplete="off"
                       class="layui-input">
                <input type="hidden" id="price" name="price">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="num" class="layui-form-label">
                <span class="we-red">*</span>商品库存
            </label>
            <div class="layui-input-inline">
                <input type="text" id="num" name="num" required="" lay-verify="number" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="barcode" class="layui-form-label">
                <span class="we-red">*</span>条形码
            </label>
            <div class="layui-input-inline">
                <input type="text" id="barcode" name="barcode" required="" lay-verify="required" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label for="desc" class="layui-form-label">描述</label>
            <div class="layui-input-block">
                <textarea id="desc" name="desc" class="layui-textarea" style="display: none"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="add" class="layui-form-label">
            </label>
            <button id="add" class="layui-btn" lay-filter="add" lay-submit="">增加</button>
        </div>
    </form>
</div>
<script>
    layui.extend({
        admin: '{/}../../static/js/admin',
        treeselect: '{/}../../static/js/treeselect'
    });
    layui.use(['form', 'admin', 'jquery', 'table', 'layer', 'layedit', 'treeselect'], function () {
        var form = layui.form,
            admin = layui.admin,
            $ = layui.jquery,
            table = layui.table,
            layer = layui.layer,
            layedit = layui.layedit,
            treeselect = layui.treeselect;

        //初始化树形下拉框
        treeselect.render(
            {
                elem: "#cid",
                data: [{ //节点
                    name: '父节点1',
                    spread: true
                    ,children: [{
                        name: '子节点11'
                    },{
                        name: '子节点12'
                    }]
                }],
                method: "GET"
            });

        //初始化富文本编辑器
        layedit.build('desc', {
            height: 100 //设置编辑器高度
        });
        //监听提交
        form.on('submit(add)', function (data) {
            console.log(data);
            //发异步，把数据提交给php
            layer.alert("增加成功", {
                icon: 6
            }, function () {
                // 获得frame索引
                var index = parent.layer.getFrameIndex(window.name);
                //关闭当前frame
                parent.layer.close(index);
            });
            return false;
        });

    });
</script>
</body>

</html>
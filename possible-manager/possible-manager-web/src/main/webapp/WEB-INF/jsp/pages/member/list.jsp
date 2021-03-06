<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>会员列表-后台管理系统-Admin 1.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/weadmin.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<div class="weadmin-nav">
			<span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">会员管理</a>
        <a>
          <cite>会员列表</cite></a>
      </span>
    <a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">&#x1002;</i></a>
</div>
<div class="weadmin-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 we-search">
            会员搜索：
            <div class="layui-inline">
                <input class="layui-input" placeholder="开始日" name="start" id="start">
            </div>
            <div class="layui-inline">
                <input class="layui-input" placeholder="截止日" name="end" id="end">
            </div>
            <div class="layui-inline">
                <input type="text" name="username" placeholder="请输入用户名" autocomplete="off" class="layui-input">
            </div>
            <button class="layui-btn" lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>
    <div class="weadmin-block">
        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn" onclick="WeAdminShow('添加用户','./add',600,400)"><i class="layui-icon"></i>添加</button>
        <span class="fr" style="line-height:40px">共有数据：88 条</span>
    </div>
    <table class="layui-table" id="memberList">
        <thead>
        <tr>
            <th>
                <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th>
            <th>ID</th>
            <th>用户名</th>
            <th>性别</th>
            <th>手机</th>
            <th>邮箱</th>
            <th>地址</th>
            <th>加入时间</th>
            <th>状态</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <tr data-id="1">
            <td>
                <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id="1"><i class="layui-icon">&#xe605;</i></div>
            </td>
            <td>1</td>
            <td>小张</td>
            <td>男</td>
            <td>17600000000</td>
            <td>admin@mail.com</td>
            <td>北京市 海淀区</td>
            <td>2017-01-01 11:11:42</td>
            <td class="td-status">
                <span class="layui-btn layui-btn-normal layui-btn-xs">已启用</span></td>
            <td class="td-manage">
                <a onclick="member_stop(this,'10001')" href="javascript:;" title="启用">
                    <i class="layui-icon">&#xe601;</i>
                </a>
                <a title="编辑" onclick="WeAdminEdit('编辑','./edit', 2, 600, 400)" href="javascript:;">
                    <i class="layui-icon">&#xe642;</i>
                </a>
                <a onclick="WeAdminShow('修改密码','./password',600,400)" title="修改密码" href="javascript:;">
                    <i class="layui-icon">&#xe631;</i>
                </a>
                <a title="删除" onclick="member_del(this,'要删除的id')" href="javascript:;">
                    <i class="layui-icon">&#xe640;</i>
                </a>
            </td>
        </tr>
        <tr data-id="2">
            <td>
                <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
            </td>
            <td>2</td>
            <td>小明</td>
            <td>女</td>
            <td>13000000000</td>
            <td>admin@mail.com</td>
            <td>北京市 海淀区</td>
            <td>2017-01-01 11:11:42</td>
            <td class="td-status">
                <span class="layui-btn layui-btn-normal layui-btn-xs">已启用</span></td>
            <td class="td-manage">
                <a onclick="member_stop(this,'10001')" href="javascript:;" title="启用">
                    <i class="layui-icon">&#xe601;</i>
                </a>
                <a title="编辑" onclick="WeAdminEdit('编辑','./edit', 2, 600, 400)" href="javascript:;">
                    <i class="layui-icon">&#xe642;</i>
                </a>
                <a onclick="WeAdminShow('修改密码','./password',600,400)" title="修改密码" href="javascript:;">
                    <i class="layui-icon">&#xe631;</i>
                </a>
                <a title="删除" onclick="member_del(this,'要删除的id')" href="javascript:;">
                    <i class="layui-icon">&#xe640;</i>
                </a>
            </td>
        </tr>
        </tbody>
    </table>
    <div class="page">
        <div>
            <a class="prev" href="">&lt;&lt;</a>
            <a class="num" href="">1</a>
            <span class="current">2</span>
            <a class="num" href="">3</a>
            <a class="num" href="">489</a>
            <a class="next" href="">&gt;&gt;</a>
        </div>
    </div>
</div>
<script type="text/javascript">
    layui.extend({
        admin: '{/}../../static/js/admin'
    });
    layui.use(['laydate','jquery','admin'], function() {
        var laydate = layui.laydate,
            $ = layui.jquery,
            admin = layui.admin;

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });

        /*用户-停用*/
        function member_stop(obj, id) {
            var confirmTip;
            if($(obj).attr('title') == '启用'){
                confirmTip = '确认要停用吗？';
            }else{
                confirmTip = '确认要启用吗？';
            }
            layer.confirm(confirmTip, function(index) {
                if($(obj).attr('title') == '启用') {
                    //发异步把用户状态进行更改
                    $(obj).attr('title', '停用')
                    $(obj).find('i').html('&#xe62f;');
                    $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                    layer.msg('已停用!', {
                        icon: 5,
                        time: 1000
                    });
                } else {
                    $(obj).attr('title', '启用')
                    $(obj).find('i').html('&#xe601;');

                    $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                    layer.msg('已启用!', {
                        icon: 6,
                        time: 1000
                    });
                }
            });
        }

        /*用户-删除*/
        function member_del(obj, id) {
            layer.confirm('确认要删除吗？', function(index) {
                //发异步删除数据
                $(obj).parents("tr").remove();
                layer.msg('已删除!', {
                    icon: 1,
                    time: 1000
                });
            });
        }

        function delAll(argument) {
            var data = tableCheck.getData();
            layer.confirm('确认要删除吗？' + data, function(index) {
                //捉到所有被选中的，发异步进行删除
                layer.msg('删除成功', {
                    icon: 1
                });
                $(".layui-form-checked").not('.header').parents('tr').remove();
            });
        }
    });

</script>
</body>

</html>
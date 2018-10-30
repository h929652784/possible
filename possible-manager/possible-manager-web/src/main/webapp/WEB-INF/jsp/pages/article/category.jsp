<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>文章分类-后台管理系统-Admin 1.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/favicon.ico" type="image/x-icon" />
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
		        <a href="">文章管理</a>
		        <a><cite>分类管理</cite></a>
		      </span>
    <a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="weadmin-body">
    <div class="weadmin-block">
        <button class="layui-btn" id="expand">全部展开</button>
        <button class="layui-btn" id="collapse">全部收起</button>
        <button class="layui-btn" onclick="WeAdminShow('添加分类','./category-add')"><i class="layui-icon"></i>添加</button>
        <span class="fr" style="line-height:40px">共有数据：66 条</span>
    </div>

    <div id="demo"></div>
</div>
</body>

<script type="text/javascript">
    function del(nodeId) {
        alert(nodeId)
    }
    /*分类-停用*/
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
    //自定义的render渲染输出多列表格
    var layout = [{
        name: '菜单名称',
        treeNodes: true,
        headerClass: 'value_col',
        colClass: 'value_col',
        style: 'width: 60%'
    },
        {
            name: '状态',
            headerClass: 'td-status',
            colClass: 'td-status',
            style: 'width: 10%',
            render:function(row){
                return '<span class="layui-btn layui-btn-normal layui-btn-xs">已启用</span>';
            }
        },
        {
            name: '操作',
            headerClass: 'td-manage',
            colClass: 'td-manage',
            style: 'width: 20%',
            render: function(row) {
                return '<a onclick="member_stop(this,\'10001\')" href="javascript:;" title="启用"><i class="layui-icon">&#xe601;</i></a>'+
                    '<a title="添加子类" onclick="WeAdminShow(\'添加\',\'./add\')" href="javascript:;"><i class="layui-icon">&#xe654;</i></a>'+
                    '<a title="编辑" onclick="WeAdminShow(\'编辑\',\'./edit\')" href="javascript:;"><i class="layui-icon">&#xe642;</i></a>'+
                    '<a title="删除" onclick="del(' + row.id + ')" href="javascript:;">\<i class="layui-icon">&#xe640;</i></a>';
                //return '<a class="layui-btn layui-btn-danger layui-btn-mini" onclick="del(' + row.id + ')"><i class="layui-icon">&#xe640;</i> 删除</a>'; //列渲染
            }
        },
    ];
    //加载扩展模块 treeGird
    //		layui.config({
    //			  base: './static/js/'
    //			  ,version: '101100'
    //			}).use('admin');
    layui.extend({
        admin: '{/}../../static/js/admin',
        treeGird: '{/}../../lib/layui/lay/treeGird' // {/}的意思即代表采用自有路径，即不跟随 base 路径
    });
    layui.use(['treeGird','jquery','admin', 'layer'], function() {
        var layer = layui.layer,
            $ = layui.jquery,
            admin = layui.admin,
            treeGird = layui.treeGird;

        var tree1 = layui.treeGird({
            elem: '#demo', //传入元素选择器
            spreadable: true, //设置是否全展开，默认不展开
            nodes: [{
                "id": "1",
                "name": "父节点1",
                "children": [{
                    "id": "11",
                    "name": "子节点11"
                },
                    {
                        "id": "12",
                        "name": "子节点12"
                    }
                ]
            },
                {
                    "id": "2",
                    "name": "父节点2",
                    "children": [{
                        "id": "21",
                        "name": "子节点21",
                        "children": [{
                            "id": "211",
                            "name": "子节点211"
                        }]
                    }]
                }
            ],
            layout: layout
        });
        $('#collapse').on('click', function() {
            layui.collapse(tree1);
        });

        $('#expand').on('click', function() {
            layui.expand(tree1);
        });
    });
</script>

</html>
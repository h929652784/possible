<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>测试layui</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui/css/layui.css">
</head>
<body>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
    <script>
        layui.use(['layer', 'form'], function(){
            var layer = layui.layer
                ,form = layui.form;
            layer.msg('Hello World');
        });
    </script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + 
                                      request.getServerName() + ":" +
                                      request.getServerPort() + path;
%>    

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>首页</title>
    <!-- 引入外部CSS文件 -->
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/index.css" />
</head>

<!-- 前端完成数据检验 调用api中的方法完成登录-->
<body>
    <form class="login-form" action="${basePath}/suit/login" method="POST">
        <h1>用户登录</h1>
        <input type="text" name="loginname" placeholder="用户名...">
        <input type="password" name="password" placeholder="密码...">
        <input type="submit" value="登 录">
        <input type="button" value="注 册" onclick="myFunction()"><br>
    </form>
    
</body>
<script>
    function myFunction() {
    	var url = ${basePath}
    	window.open('/suit/jsp/regist.jsp', "_self");
    }
    
</script>
</html>
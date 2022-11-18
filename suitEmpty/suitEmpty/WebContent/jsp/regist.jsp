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
    <title>注册</title>
    <!-- 引入外部CSS文件 -->
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/regist.css" />
<script type="text/javascript" src="<%=basePath%>/js/jquery.min.js"></script>
</head>

<!-- 前端完成数据检验 调用api中的方法完成注册-->
<body>
    <form onsubmit="return check_vote('gender')" name="vote_form" class="login-form" action="${basePath}/suit/regist" method="POST">
        <h1>用户注册</h1>
        <h4>用户名称：<input type="text" required="required" name="loginname" value="${userView.loginname}"></h4>
       <h4>用户实名： <input type="text" required="required" name="username" value="${userView.username}"></h4>
       <h4>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：<input type="password" required="required" name="password"></h4>
       <h4>密码确认：<input type="password" required="required" name="comfirmPassword"></h4>
       <h4>
       		性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：
       		<input type="radio"  name="gender" value="0" onclick="judgeSex()">女
       			   <input type="radio" name="gender" value="1" onclick="judgeSex()">男
    	</h4>
    	<!-- style="width: 54px; height: 81px;" -->
    	
    		<!-- 第一个人像 -->
    		<div id="man1Div" style="display:inline; border: red 2px; width: 58px; height: 84px;"></div>
    		<!-- 第二个人像 -->
    		<div id="man2Div" style="display:inline; border: red 2px; width: 58px; height: 84px;"></div><br>
 
		

        <input type="submit" value="注 册">
        <input type="button" value="返 回" onclick="goBack()"><br>
    </form>
</body>
<script>
	var baseUrl = "${basePath}/suit/";  
	function goBack() {
	    window.history.back()
	 }
	function saveSubmit(action){
        dataForm.action = baseUrl+action;
        dataForm.submit();
    }

	function check_vote(vote_name) {
		var checks = document.getElementsByName(vote_name);
		for (var i=0; i<checks.length; i++) {
			if (checks[i].checked) {
				return true;
			}
		}
		alert("请选择性别");
		return false;
	}
	
	function judgeSex() {
		var genderVal = $('input:radio:checked').val()
		if (genderVal == 1) {
			document.getElementById("man1Div").innerHTML="";  // 清空内容
			document.getElementById("man2Div").innerHTML="";  // 清空内容

			var bigImg1 = document.createElement("img");		//创建一个img元素
			bigImg1.src="../images/data/model/mheadA.png";   //给img元素的src属性赋值
			var myDiv1 = document.getElementById('man1Div'); //获得dom对象
			myDiv1.appendChild(bigImg1);  	//为dom添加子元素img
			
			var bigImg2 = document.createElement("img");		//创建一个img元素
			bigImg2.src="../images/data/model/mheadB.png";   //给img元素的src属性赋值
			var myDiv2 = document.getElementById('man2Div'); //获得dom对象
			myDiv2.appendChild(bigImg2);  	//为dom添加子元素img

		} else {
			document.getElementById("man1Div").innerHTML="";  // 清空内容
			document.getElementById("man2Div").innerHTML="";  // 清空内容
			
			var bigImg1 = document.createElement("img");		//创建一个img元素
			bigImg1.src="../images/data/model/wheadA1.png";   //给img元素的src属性赋值
			var myDiv1 = document.getElementById('man1Div'); //获得dom对象
			myDiv1.appendChild(bigImg1);  	//为dom添加子元素img
			
			var bigImg2 = document.createElement("img");		//创建一个img元素
			bigImg2.src="../images/data/model/wheadB2.png";   //给img元素的src属性赋值
			var myDiv2 = document.getElementById('man2Div'); //获得dom对象
			myDiv2.appendChild(bigImg2);  	//为dom添加子元素img
		}
		
	}
</script>
</html>
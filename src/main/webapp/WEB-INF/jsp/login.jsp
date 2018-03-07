<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/meta.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>用户登录</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" href="static/css/normalize.css">
<link rel="stylesheet" href="static/css/login.css">
</head>

<body>

	<div class="login">
		<h1>Login</h1>
		<form method="post" action="<%=path %>/loginVerfiy" id="mySubmit">
		
			<input type="text" name="username" id="username" placeholder="用户名" required="required" />
			<input type="password" name="pwd" id="pwd" placeholder="密码" required="required" />
			<button type="submit" class="btn btn-primary btn-block btn-large"
				onclick="javascript:loginVerfiy(); return false;">登录</button>
		
		</form>
		
		<font color="red">
		<c:choose>
			<c:when test="${not empty msg }">${msg }</c:when>
			<c:otherwise></c:otherwise>
		</c:choose>
		</font>
	</div>

	<!-- 遮罩层DIV -->
	<div id="overlay" class="overlay"></div>
	<!-- Loading提示 DIV -->
	<div id="loadingTip" class="loading-tip">
		<img src="images/loading.gif" />
	</div>
	
	
	
	<script type="text/javascript" src="static/plugins/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="static/js/login.js"></script>
	<script type="text/javascript">
	
	$(function(){
		
		document.onkeydown = function(e){ 
		    var ev = document.all ? window.event : e;
		    if(ev.keyCode==13) {
		    	loginVerfiy();
		    }
		}
		
	});
		
		/**
		 * 登录test
		 */
		function loginTest(){
			
			showLoading();

			// 使用定时器模拟
			setTimeout(function() {
				//window.top.window.hideLoading();
				window.location.href='<%=path %>/loginVerfiy';
			}, 2);
		}
		
		/**
		 * 登录
		 */
		function loginVerfiy(){
			
			var username = $.trim($('#username').val());
			var pwd = $.trim($('#pwd').val());
			
			if(!username){
				alert('请输入账号');
				return;
			}
			
			if(!pwd){
				alert('请输入密码');
				return;
			}
			
			$('#mySubmit').submit();
		}
	
	</script>
	
</body>
</html>

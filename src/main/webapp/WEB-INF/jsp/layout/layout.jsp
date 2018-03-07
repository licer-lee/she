<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/meta.jsp"%>
<%
	//从cookies中读取主题名称  
	String easyuiThemeName = "default";
	Cookie cookies[] = request.getCookies();
	if(cookies != null && cookies.length > 0){
		for(int i=0; i<cookies.length; i++){
			if(cookies[i].getName().equals("easyuiThemeName")){
				easyuiThemeName = cookies[i].getValue();
				break;
			}
		}
	}
%>


<!DOCTYPE html>
<html>
<head>

<!-- 动态主题 -->
<link id="easyuiTheme" rel="stylesheet" type="text/css" href="<c:out value="${ctx}"/>/static/plugins/easyui/themes/<%=easyuiThemeName%>/easyui.css"> 
<!-- 页面私有资源 (根据业务需要引用)-->
<link rel="stylesheet" type="text/css" href="<c:out value="${ctx}"/>/static/css/layout/layout.css" >
<script type="text/javascript" src="<c:out value="${ctx}"/>/static/js/layout/layout.js"></script>
</head>

<!-- layout -->
<body class="easyui-layout">

	<!-- top -->
	<div data-options="region:'north',border:false, href:'top' "
		style="height:60px; background:#B3DFDA; padding:0px"></div>
	<!-- top end -->
	
	<!-- left -->
	<div data-options="region:'west',split:false,title:'菜单', href:'menu' "
		style="width:200px;padding:0px;"></div>
	<!-- left end -->
	
	<!-- center -->
	<div data-options="region:'center',title:'', href:'center' ">
	</div>
	<!-- center end -->
	
</body>
</html>
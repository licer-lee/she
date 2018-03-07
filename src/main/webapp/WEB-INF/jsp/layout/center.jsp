<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/meta.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>中心布局：包含容器tabs</title>
</head>

<body>
	
	<!--容器tabs-->
	<div id="center_tabs_div" class="easyui-tabs" style="width:100%; height:100%;">
		
		<!--默认首页-->
		<div id="center_tabs_default_div" title="个人主页"
			data-options="closable:false, href:'myDefault' " style="padding:20px;"></div>
	</div>
</body>
</html>
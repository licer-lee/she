<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/meta.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>top</title>
</head>

<body>

	<div style="width: 100%; height: 100%;">
		<table width="100%" height="100%" style="text-align: right;">
			<tr>
				<td>
					<!--<img src="../../images/hclogo/msg.png" title="公告" class="helpimg" /> 
						<a href="javascript:opennotice();" style="color: #e9f2f7;" target="_parent">公告</a>
						&nbsp;&nbsp;|&nbsp;&nbsp;
						<img src="../../images/other/help.png" title="帮助" class="helpimg" /> 
						<a href="javascript:void(0);" style="color: #e9f2f7;" target="_parent">帮助</a>
						&nbsp;&nbsp;|&nbsp;&nbsp; <a href="javascript:logout();" style="color: #e9f2f7;" target="_parent">退出</a>-->

					当前时间： <span id="default_top_datetime"></span>
				</td>
			</tr>

			<tr>
				<td>
					<div style="padding:5px;">
						<a href="#" class="easyui-menubutton"
							data-options="menu:'#mm1',iconCls:'icon-help'">${sessionScope.session_login_user.realName }</a>
					</div>
					
					<div id="mm1" style="width:150px;">
						<div data-options="iconCls:'icon-tip'">个人信息</div>

						<div data-options="iconCls:'icon-edit'">
							<span>更换皮肤</span>
							<div style="width:150px;">
								<div onclick="javascript:changeTheme('default')">default</div>
								<div onclick="javascript:changeTheme('black')">black</div>
								<div onclick="javascript:changeTheme('bootstrap')">bootstrap</div>
								<div onclick="javascript:changeTheme('metro')">metro</div>
								<div onclick="javascript:changeTheme('gray')">gray</div>
								<div onclick="javascript:changeTheme('ui-cupertino')">cupertino</div>
								<div onclick="javascript:changeTheme('ui-dark-hive')">dark-hive</div>
								<div onclick="javascript:changeTheme('ui-pepper-grinder')">pepper-grinder</div>
								<div onclick="javascript:changeTheme('ui-sunny')">sunny</div>
							</div>
						</div>
						
						<!-- 退出 -->
						<div data-options="iconCls:'icon-tip'">
							<a href="${ctx }/login_out" onclick="exit();"><span>退出</span></a>
						</div>
						
					</div>
				</td>

				<%--<td>
					<div class="user">
						<!-- <span></span> <i>消息</i> <b>0</b>-->
						<a href="../login/login" onclick="exit();"><span>退出</span></a>
					</div>
				</td>
			--%></tr>

			<tr>
				
			</tr>
		</table>
	</div>

</body>
</html>
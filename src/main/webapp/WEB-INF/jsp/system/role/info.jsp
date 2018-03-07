<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/meta.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>角色添加/编辑页面</title>
</head>

<body>
	<form id="role_add_form">
		<!-- 页面flag：add/edit -->
		<input type="hidden" name="role_info_page_flag" id="role_info_page_flag" />
		<!-- 角色id -->
		<input type="hidden" id="roleId" name="roleId" value="${roleId }">

		<div id="role_add_div">
			<table width="100%" style="margin: 0 auto;" border="0"
				cellspacing="0" cellpadding="0">
				<tr>
					<td id="main_form" bgcolor="#FFFFFF" style="vertical-align: top;">
						<div
							style="background: url('<c:out value="${ctx}"/>/images/inputPageHeadBg.gif') repeat-x scroll 0% 0% transparent; padding: 10px;">
							<div id="ItemBlock_Title">
								&nbsp; <img border="0" src="<c:out value="${ctx}"/>/images/item_point.gif" />
								&nbsp;基本信息 &nbsp;
							</div>
						</div>

						<table class="addtable_class" width="100%" border="0">
							<tr>
								<td align='right'>角色编号：</td>
								<td><input type="text" id="role_code_input" name="roleCode"
									class="inputText easyui-tooltip" title="角色编号" value="${roleCode }"
									 style="width: 200px;" /> <span
									class="Prompt">*</span></td>
							</tr>
							<tr>
								<td align='right'>角色名称：</td>
								<td><input type="text" id="role_name_input" name="roleName"
									class="inputText easyui-tooltip easyui-validatebox" value="${roleName }"
									title="角色名称" style="width: 200px;" data-options="required:true" />
									<span class="Prompt">*</span>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>

</html>
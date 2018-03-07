<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/meta.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>账户类别操作画面</title>
</head>

<body>
	<form id="account_type_add_form" method="post">
		<!-- 页面flag：add/edit -->
		<input type="hidden" name="accountInfoPageFlag"
			id="accountInfoPageFlag" />
		<!-- 账户类别id -->
		<input type="hidden" id="accountTypeId" name="accountTypeId"
			value="${accountTypeId }">

		<div id="account_type_add_div">
			<table width="100%" style="margin: 0 auto;" border="0"
				cellspacing="0" cellpadding="0">
				<tr>
					<td id="main_form" bgcolor="#FFFFFF" style="vertical-align: top;">
						<div
							style="background: url('<c:out value="${ctx}"/>/static/images/inputPageHeadBg.gif') repeat-x scroll 0% 0% transparent; padding: 10px;">
							<div id="ItemBlock_Title">
								&nbsp; <img border="0"
									src="<c:out value="${ctx}"/>/static/images/item_point.gif" />
								&nbsp;基本信息 &nbsp;
							</div>
						</div>

						<table class="addtable_class" width="100%" border="0">
							<tr>
								<td align='right'>账户类别编号：</td>
								<td><input type="text" id="account_type_code_input"
									name="accountTypeCode" class="inputText easyui-tooltip"
									title="账户类别编号" value="${accountTypeCode }"
									style="width: 200px;" /> <span class="Prompt">*</span>
								</td>
							</tr>
							<tr>
								<td align='right'>账户类别名称：</td>
								<td><input type="text" id="account_type_name_input"
									name="accountTypeName"
									class="inputText easyui-tooltip easyui-validatebox"
									value="${accountTypeName }" title="账户类别名称"
									style="width: 200px;" data-options="required:true" /> <span
									class="Prompt">*</span></td>
							</tr>
						</table></td>
				</tr>
			</table>
		</div>
	</form>
</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/meta.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>账户添加/编辑页面</title>
</head>

<body>

	<form id="user_info_form" name="user_info_form" method="post" >
		<!-- 页面flag：add/edit -->
		<input type="hidden" name="user_page_flag" id="user_page_flag" />
		<!-- 账户id -->
		<input type="hidden" id="id" name="id" value="${id }">

		<div id="account_add_div">
			<table width="100%" style="margin: 0 auto;" border="0"
				cellspacing="0" cellpadding="0">
				<tr>
					<td id="main_form" bgcolor="#FFFFFF" style="vertical-align: top;">
						<div
							style="background: url('<c:out value="${ctx}"/>/static/images/inputPageHeadBg.gif') repeat-x scroll 0% 0% transparent; padding: 10px;">
							<div id="ItemBlock_Title">
								&nbsp; 
								<img border="0" src="<c:out value="${ctx}"/>/static/images/item_point.gif" />
								&nbsp;基本信息 &nbsp;
							</div>
						</div>

						<table class="addtable_class" width="100%" border="0">
							<!-- <tr>
								<td align='right'>账户类型：</td>
								<td>
								<input id="account_type_input" name="accountType.accountTypeId" class="easyui-combobox"
									data-options="valueField:'accountTypeId',textField:'accountTypeName',url:'../business/account/getAccountTypeList'" />
									<span class="Prompt">*</span></td>
							</tr> -->
							
							<tr>
								<td align='right'>账号：</td>
								<td><input type="text" id="username" name="username"
									class="inputText easyui-tooltip" title="账户" value="${username }"
									style="width: 200px;" data-options="required:true" /> 
									<span class="Prompt">*</span>
								</td>
							</tr>
							<tr>
								<td align='right'>密码：</td>
								<td><input type="text" id="password" name="password"
									class="inputText easyui-passwordbox" title="账户" value=""
									style="width: 200px;" data-options="required:true" /> 
									<span class="Prompt">*</span>
								</td>
							</tr>
							<tr>
								<td align='right'>真实姓名：</td>
								<td><input type="text" id="realName" name="realName"
									class="inputText easyui-tooltip" title="账户" value="${realName }"
									style="width: 200px;" data-options="required:true" /> 
									<span class="Prompt">*</span>
								</td>
							</tr>
							<tr>
								<td align='right'>手机号：</td>
								<td><input type="text" id="mobile" name="mobile"
									class="inputText easyui-tooltip" title="账户" value="${mobile }"
									style="width: 200px;" data-options="required:true" /> 
									<span class="Prompt">*</span>
								</td>
							</tr>
							<tr>
								<td align='right'>权限：</td>
								<td>
									<input class="easyui-combobox" name="roles.roleId" style="width:100%;" 
										data-options="
					                    url:'combobox_data1.json',
					                    method:'get',
					                    valueField:'id',
					                    textField:'text',
					                    value:[1,3],
					                    multiple:true,
					                    panelHeight:'auto',
					                    label: 'Language:',
					                    labelPosition: 'top'
					                    ">
									<span class="Prompt">*</span></td>
							</tr>
							
						</table>
					</td>
				</tr>
			</table>
		</div>
	</form>
	
</body>

</html>
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
	<form id="account_add_form">
	
		<!-- 页面flag：add/edit -->
		<input type="hidden" name="account_info_page_flag" id="account_info_page_flag" />
		
		<!-- 账户id -->
		<input type="hidden" id="accountId" name="accountId" value="${accountId }">

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
							<tr>
								<td align='right'>账户类型：</td>
								<td>
								<input id="account_type_input" name="accountType.accountTypeId" class="easyui-combobox"
									data-options="valueField:'accountTypeId',textField:'accountTypeName',url:'../business/account/getAccountTypeList'" />
									<span class="Prompt">*</span></td>
							</tr>
							
							<!-- 
							<tr>
								<td align='right'>账户类型1：</td>
								<td><input id="account_type_input"
									name="accountType.accountTypeId" readonly="readonly" />
									<span class="Prompt">*</span>
									<a href="javascript:void(0);" iconCls="icon-search" 
										class="easyui-linkbutton" plain="true" onclick="showType();"></a>
								</td>
							</tr>
							 -->
							
							<tr>
								<td align='right'>账户：</td>
								<td><input type="text" id="account_input" name="account"
									class="inputText easyui-tooltip" title="账户" value="${account }"
									style="width: 200px;" data-options="required:true" /> <span
									class="Prompt">*</span></td>
							</tr>
							<tr>
								<td align='right'>密码：</td>
								<td><input type="text" id="account_name_input"
									name="password" data-options="required:true"
									class="inputText easyui-tooltip easyui-validatebox"
									value="${password }" title="账户名称" style="width: 200px;" />
									<span class="Prompt">*</span></td>
							</tr>
							<tr>
								<td align='right'>备注：</td>
								<td><input type="text" id="note_input" name="note"
									class="inputText easyui-tooltip easyui-validatebox"
									value="${note }" title="账户名称" style="width: 200px;" />
									<span class="Prompt">*</span></td>
							</tr>
							
							<tr>
								<td align='right'>备注：</td>
								<td>
									
								</td>
							</tr>
							
							
						</table>
					</td>
				</tr>
			</table>
		</div>
	</form>
	
	<script type="text/javascript">
		$(document).ready(function(){
			
			$("#account_name_input").keydown(function(event){ 
				//alert(event.which);
				if(event.keyCode == 13){
					saveAccount();
					$("#account_popup_div").dialog("close");
					accountListFlush();
				}
			});
		});
	</script>
</body>

</html>
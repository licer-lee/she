<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/meta.jsp"%>
<!DOCTYPE html>
<html>

<head>
<title>账户首页</title>
</head>

<body>
	<div class="easyui-layout" style="width: 100%; height: 100%;">

		<!--条件区域-->
		<div data-options="region:'west', title:'检索条件' "
			style="width: 250px; height: 100%; padding: 5px;">

			<form method="post" action="index" id="account_search_form">
				<table style="width: 100%; border-collapse: collapse;" border="1">
					<tr>
						<td style="height: 40px; background-color: rgb(238, 238, 238);" align="right">类别</td>
						<td width="100px" height="10">
						<input id="search_account_type_id" name="search_account_type_id" class="easyui-combobox"
							data-options="valueField:'accountTypeId',textField:'accountTypeName',url:'../business/account/getAccountTypeList'" />
						</td>
					</tr>
					<tr>
						<td style="height: 40px; background-color: rgb(238, 238, 238);" align="right">账户</td>
						<td width="100px" height="10">
							<input type="text" id="search_account_code">
						</td>
					</tr>
					<tr>
						<td style="height: 40px; background-color: rgb(238, 238, 238);" align="right">备注</td>
						<td height="10">
							<input type="text" id="search_account_note">
						</td>
					</tr>
					<tr>
						<td style="height: 50px;" colspan="2">
							<div id="condition_btn_div" style="text-align: center;">
								<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'"
									onclick="searchAccount();return false;">检索</a>
									
								&nbsp;&nbsp;&nbsp;&nbsp; 
								<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-redo'"
									onclick="resetAccount();return false;">重置</a>
							</div>
						</td>
					</tr>
				</table>
			</form>
		</div>

		<!--列表区域-->
		<div data-options="region:'center' "
			style="width: 100%; height: 100%;">
			<table id="account_list_table" class="easyui-datagrid" title="账户列表"
				style="width:100%;height:100%"
				data-options="collapsible:false, pagination: true, rownumbers:true, pageSize:30,pageList: [20, 50, 100] ">
				<thead>
					<tr>
						<th
							data-options="field:'accountId',width:100, align:'center', sortable:true, hidden:true ">账户ID</th>
						<!-- 当field为对象时,可以使用formatter -->
						<th data-options="field:'accountTypeId', hidden:true, formatter: function(value,row,index){
								if (row.accountType){
									return row.accountType.accountTypeId;
								} else {
									return '';
								}}">账户类别id</th>
						<th data-options="field:'accountTypeName',width:100, align:'center', sortable:false, formatter: function(value,row,index){
								if (row.accountType){
									return row.accountType.accountTypeName;
								} else {
									return '';
								}}">账户类别</th>
						<th
							data-options="field:'account',width:100, align:'center', sortable:true ">账户</th>
						<th data-options="field:'password',width:200, align:'center', sortable:true ">密码</th>
						<th data-options="field:'note',width:80, align:'center' ">备注</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>

	<!-- 账户popup_div -->
	<div id="account_popup_div"></div>
	<!-- 页面私有资源 (根据业务需要引用) tips:必须引入在body内才能被加载-->
	<script type="text/javascript" src="<c:out value="${ctx}"/>/static/js/business/account.js"></script>
</body>
</html>
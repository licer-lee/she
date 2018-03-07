<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/meta.jsp"%>
<!DOCTYPE html>
<html>

<head>
<title>账户类别</title>
</head>

<body>
	<div class="easyui-layout" style="width: 100%; height: 100%;">

		<!--条件区域-->
		<div data-options="region:'west', title:'检索条件' "
			style="width: 250px; height: 100%; padding: 5px;">

			<form method="post" id="account_type_search_form" action="/index">
				<table style="width: 100%; border-collapse: collapse;" border="1">
					<tr>
						<td style="height: 40px; background-color: rgb(238, 238, 238);"
							align="right">类别编号</td>
						<td width="100px" height="10"><input type="text"
							id="search_account_type_code" name="search_account_type_code" >
						</td>
					</tr>
					
					<tr>
						<td style="height: 40px; background-color: rgb(238, 238, 238);"
							align="right">类别名称</td>
						<td height="10"><input type="text"
							id="search_account_type_name" name="search_account_type_name">
						</td>
					</tr>
					<tr>
						<td style="height: 50px;" colspan="2">
							<div id="condition_btn_div" style="text-align: center;">
								<a href="#" class="easyui-linkbutton"
									data-options="iconCls:'icon-search'"
									onclick="searchAccountType();return false;">检索</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a href="#" class="easyui-linkbutton"
									data-options="iconCls:'icon-redo'"
									onclick="resetAccountType();return false;">重置</a>
							</div></td>
					</tr>
				</table>
			</form>
		</div>

		<!--列表区域-->
		<div data-options="region:'center' "
			style="width: 100%; height: 100%;">
			<table id="account_type_list_table" class="easyui-datagrid"
				title="账户类别列表" style="width:100%;height:100%"
				data-options="collapsible:false, pagination: true, rownumbers:true, pageSize:30,pageList: [20, 50, 100] ">
				<thead>
					<tr>
						<th data-options="field:'accountTypeId',width:100, align:'center', hidden:true ">账户类别ID</th>
						<th data-options="field:'accountTypeCode',width:100, align:'center', sortable:true ">账户类别编号</th>
						<th data-options="field:'accountTypeName',width:200, align:'center' ">账户类别名称</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>

	<!-- 账户类别popup_div -->
	<div id="account_type_popup_div"></div>
	<!-- 页面私有资源 (根据业务需要引用) tips：js必须引入在body内才能被加载-->
	<script type="text/javascript" src="<c:out value="${ctx}"/>/static/js/business/accountType.js"></script>
</body>
</html>
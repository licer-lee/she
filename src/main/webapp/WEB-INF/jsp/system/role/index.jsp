<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/meta.jsp"%>
<!DOCTYPE html>
<html>

<head>
<title>角色首页</title>
</head>

<body>
	<div class="easyui-layout" style="width: 100%; height: 100%;">

		<!--条件区域-->
		<div data-options="region:'west', title:'检索条件', collapsed:true " style="width: 250px; height: 100%; padding: 5px;">
			
			<form action="index" id="role_search_condition_form">
			
				<table style="width: 100%; border-collapse: collapse;" border="1">

					<tr>
						<td style="height: 40px; background-color: rgb(238, 238, 238);"
							align="right">角色编号</td>
						<td width="100px" height="10"><input type="text"
							id="condition_role_code_input">
						</td>
					</tr>
					<tr>
						<td style="height: 40px; background-color: rgb(238, 238, 238);"
							align="right">角色名称</td>
						<td height="10"><input type="text"
							id="condition_role_name_input">
						</td>
					</tr>
					<tr>
						<td style="height: 50px;" colspan="2">
							<div id="condition_btn_div" style="text-align: center;">
								<a href="#" class="easyui-linkbutton"
									data-options="iconCls:'icon-search'"
									onclick="SearchRole();return false;">检索</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a href="#" class="easyui-linkbutton"
									data-options="iconCls:'icon-redo'"
									onclick="ResetRole();return false;">重置</a>
							</div></td>
					</tr>
				</table>
			</form>
		</div>

		<!--列表区域-->
		<div data-options="region:'center' "
			style="width: 100%; height: 100%;">
			<table id="role_list_table" class="easyui-datagrid" title="角色列表"
				style="width:100%;height:100%"
				data-options="collapsible:false, pagination: true, rownumbers:true, pageSize:20, pageList: [20, 50, 100] ">
				<thead>
					<tr>
						<th data-options="field:'id',width:100, align:'center', hidden:true ">角色ID</th>
						<th data-options="field:'code',width:100, align:'center', sortable:true, hidden:true ">角色编号</th>
						<th data-options="field:'name',width:100, align:'center' ">角色名称</th>
						<th data-options="field:'description',width:200, align:'left' ">描述</th>
						<th data-options="field:'createDate',width:100, align:'center', formatter: formatDatebox ">创建时间</th>
						<th data-options="field:'status',width:80, align:'left' ">状态</th>
						<th data-options="field:'status',width:80, align:'left' ">操作</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>

	<!-- 角色popup_div -->
	<div id="role_popup_div"></div>
	<!-- 页面私有资源 (根据业务需要引用) tips：js必须引入在body内才能被加载-->
	<script type="text/javascript"
		src="<c:out value="${ctx}"/>/static/js/system/role.js"></script>
</body>
</html>
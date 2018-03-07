<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/meta.jsp"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>菜单首页</title>
</head>

<body>
	<div class="easyui-layout" style="width: 100%; height: 100%;">

		<!--条件区域-->
		<div data-options="region:'west', title:'检索条件', collapsed:true " style="width: 250px; height: 100%; padding: 5px;">
			
			<form action="index" id="menu_search_condition_form">
			
				<table style="width: 100%; border-collapse: collapse;" border="1">

					<tr>
						<td style="height: 40px; background-color: rgb(238, 238, 238);"
							align="right">菜单编号</td>
						<td width="100px" height="10"><input type="text"
							id="condition_menu_code_input">
						</td>
					</tr>
					<tr>
						<td style="height: 40px; background-color: rgb(238, 238, 238);"
							align="right">菜单名称</td>
						<td height="10"><input type="text"
							id="condition_menu_name_input">
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
									onclick="Resetmenu();return false;">重置</a>
							</div></td>
					</tr>
				</table>
			</form>
		</div>

		<!--列表区域-->
		<div data-options="region:'center' "
			style="width: 100%; height: 100%;">
			<table id="menu_list_table" class="easyui-datagrid" title="菜单列表" style="width:100%;height:100%"
				data-options="collapsible:false, pagination: true, rownumbers:true, pageSize:20,pageList: [20, 50, 100] ">
				<thead>
					<tr>
						<th data-options="field:'id',width:100, align:'center', sortable:true, hidden:true ">菜单ID</th>
						<th data-options="field:'name',width:200, align:'center' ">名称</th>
						<th data-options="field:'type',width:200, align:'center' ">类型</th>
						<th data-options="field:'url',width:200, align:'left' ">链接</th>
						<th data-options="field:'parent',width:80, align:'center', formatter:getParent ">父菜单</th>
						<th data-options="field:'status',width:100, align:'center', sortable:true ">状态</th>
						<th data-options="field:'option',width:80, align:'center' ">操作</th>
							
					</tr>
				</thead>
			</table>
		</div>
	</div>

	<!-- 菜单popup_div -->
	<div id="menu_popup_div"></div>
	<!-- 页面私有资源 (根据业务需要引用) tips：js必须引入在body内才能被加载-->
	<script type="text/javascript"
		src="<c:out value="${ctx}"/>/static/js/system/menu.js"></script>
</body>
</html>
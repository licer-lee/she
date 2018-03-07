<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/meta.jsp"%>
<!DOCTYPE html>
<html>

<head>
<title>用户列表</title>
</head>

<body>
	<div class="easyui-layout" style="width: 100%; height: 100%;">

		<!--条件区域-->
		<div data-options="region:'west', title:'检索条件', collapsible:true, collapsed:true " style="width: 250px; height: 100%; padding: 5px;">
			
			<form action="index" id="user_search_form">
			
				<table style="width: 100%; border-collapse: collapse;" border="1">

					<tr>
						<td style="height: 40px; background-color: rgb(238, 238, 238);" align="right">角色编号</td>
						<td width="100px" height="10">
						<input type="text" id="condition_user_code_input">
						</td>
					</tr>
					<tr>
						<td style="height: 40px; background-color: rgb(238, 238, 238);"
							align="right">角色名称</td>
						<td height="10">
						<input type="text" id="condition_user_name_input">
						</td>
					</tr>
					<tr>
						<td style="height: 50px;" colspan="2">
							<div id="condition_btn_div" style="text-align: center;">
								<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'"
									onclick="SearchUser();return false;">检索</a>
								
								&nbsp;&nbsp;&nbsp;&nbsp; 
								
								<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-redo'"
									onclick="ResetUser();return false;">重置</a>
							</div>
						</td>
					</tr>
				</table>
			</form>
		</div>

		<!--列表区域-->
		<div data-options="region:'center' " style="width: 100%; height: 100%;">
			<table id="user_list_table" class="easyui-datagrid" title="用户列表" style="width:100%;height:100%"
				data-options="collapsible:false, pagination:true, rownumbers:true, pageSize:20, pageList:[20, 50, 100] ">
				<thead>
					<tr>
						<th data-options="field:'roleId',width:100, align:'center', sortable:true, hidden:true, 
							formatter: function(value, row, index){
								var len = row.roles.length;
								var rIds = '';
								if (len > 0 ){
									for(var i=0; i<len; i++){
										rIds += row.roles[i].id + ',';
									}
									return rIds;
								} else {
									return '';
								}
								} ">角色id</th>
						<th data-options="field:'roleName',width:100, align:'center', sortable:true, 
							formatter: function(value, row, index){
								var len = row.roles.length;
								var rNames = '';
								if (len > 0 ){
									for(var i=0; i<len; i++){
										rNames += row.roles[i].name + ',';
									}
									return rNames;
								} else {
									return '';
								}
								} ">角色</th>
						<th data-options="field:'id',width:100, align:'left', sortable:true, hidden:true ">id</th>
						<th data-options="field:'username',width:100, align:'left', sortable:true ">账号</th>
						<th data-options="field:'realName',width:80, align:'left' ">姓名</th>
						<th data-options="field:'mobile',width:100, align:'center' ">电话号码</th>
						<th data-options="field:'createDate',width:150, align:'center', formatter: formatDatebox ">创建时间</th>
						<th data-options="field:'status',width:80, align:'center', hidden:true " >status</th>
						<th data-options="field:'statusName',width:80, align:'center', 
							formatter: function(value, row, index){
								if(row.status === 1){
									return '正常';
								}else{
									return '锁定';
								}
							} ">状态</th>
						<th data-options="field:'action', width:80, align:'center', 
							formatter: userAction ">操作</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>

	<div id="user_popup_div"></div>
	<!-- 页面私有资源 (根据业务需要引用) tips：js必须引入在body内才能被加载-->
	<script type="text/javascript"
		src="<c:out value="${ctx}"/>/static/js/system/user.js"></script>
</body>
</html>
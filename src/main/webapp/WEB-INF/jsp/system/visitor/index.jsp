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

			<form method="post" id="visitor_search_form" action="/index">
				<table style="width: 100%; border-collapse: collapse;" border="1">
					<tr>
						<td style="height: 40px; background-color: rgb(238, 238, 238);"
							align="right">类别编号</td>
						<td width="100px" height="10"><input type="text"
							id="search_visitor_code" name="search_visitor_code" >
						</td>
					</tr>
					
					<tr>
						<td style="height: 40px; background-color: rgb(238, 238, 238);"
							align="right">类别名称</td>
						<td height="10"><input type="text"
							id="search_visitor_name" name="search_visitor_name">
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
			<table id="visitor_list_table" class="easyui-datagrid"
				title="账户类别列表" style="width:100%;height:100%"
				data-options="collapsible:false, pagination: true, rownumbers:true, pageSize:30,pageList: [20, 50, 100] ">
				<thead>
					<tr>
						<th data-options="field:'ip',width:100, align:'center', hidden:false ">IP</th>
						<th data-options="field:'host',width:100, align:'center', sortable:true ">主机</th>
						<th data-options="field:'time',width:200, align:'center', formatter: formatDatebox, sortable:true ">访问时间</th>
						<th data-options="field:'userAgent',width:200, align:'center' ">访问来源</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>

	<!-- 账户类别popup_div -->
	<div id="visitor_popup_div"></div>
	<!-- 页面私有资源 (根据业务需要引用) tips：js必须引入在body内才能被加载-->
	<script type="text/javascript" src="<c:out value="${ctx}"/>/static/js/system/visitor.js"></script>
</body>
</html>
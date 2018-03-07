<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/meta.jsp"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>菜单</title>
</head>


<!-- body 以外区域不加载 -->
<body>

<style type="text/css">

#menu_ul a {
text-decoration: none;
}

#menu_ul a:link {
 text-decoration: none;
}
#menu_ul a:visited {
 text-decoration: none;
}
#menu_ul a:hover {
 text-decoration: none;
}
#menu_ul a:active {
 text-decoration: none;
}

</style>

	<div id="menu_div" class="easyui-accordion"
		style="width:100%; height:99%;">

		<c:forEach items="${sessionScope.session_menu_resource }" var="resourc" >
			
			<div title="${resourc.name }" data-options="iconCls:'${resourc.icon }', selected:false " style="overflow:auto;padding:10px;">
				
				<c:if test="${fn:length(resourc.children) > 0 }">
				
					<ul id="menu_ul" class="easyui-tree">
						<c:forEach items="${resourc.children }" var="sub_resourc">
							<li>
							<a href="#" onclick="addTab('center_tabs_div','${sub_resourc.name }', '${ctx}'+'${sub_resourc.url }')">
									${sub_resourc.name }</a>
							</li>
						</c:forEach>
					</ul>
				</c:if>
			</div>
			
		</c:forEach>

		<div title="基础维护" data-options="iconCls:'icon-base', selected:false "
			style="overflow:auto;padding:10px;">

			<ul id="menu_ul" class="easyui-tree">
				<li><span>学生管理</span></li>
				<li><span>课程管理</span>
				</li>
				<li><span>教室管理</span>
				</li>
			</ul>
		</div>
		
		<div title="业务处理" data-options="iconCls:'icon-business', selected:false "
			style="padding:10px;">

			<ul id="menu_ul" class="easyui-tree">
				<li><a href="#"
					onclick="addTab('center_tabs_div','账户类型','../business/accountType/index')">账户类型</a>
				</li>
				<li><a href="#"
					onclick="addTab('center_tabs_div','账户管理','../business/account/index')">账户管理</a>
				</li>
			</ul>

		</div>
		
		<div title="报表统计" data-options="iconCls:'icon-chart', selected:false "
			style="padding:10px;">

			<ul id="menu_ul" class="easyui-tree">
				<li><span>出勤率</span></li>
				<li><span>使用率</span>
				</li>
			</ul>

		</div>

		<div title="系统设置"
			data-options="iconCls:'icon-settings',selected:false "
			style="padding:10px;">
			<ul class="easyui-tree">

				<li><a href="#"
					onclick="addTab('center_tabs_div','角色管理','../system/role/index')">角色管理</a>
				</li>
				<li><a href="#"
					onclick="addTab('center_tabs_div','菜单管理','../system/menu/index')">菜单管理</a>
				</li>
				<li><a href="#"
					onclick="addTab('center_tabs_div','权限管理','../system/permission/index')">权限管理</a>
				</li>
				<li><a href="#"
					onclick="addTab('center_tabs_div','操作员','../system/operater/index')">操作员</a>
				</li>
				<li><a href="#"
					onclick="addTab('center_tabs_div','系统参数','../system/sysParam/index')">系统参数</a>
				</li>
				<li><a href="#"
					onclick="addTab('center_tabs_div','访问信息','../system/visitor/index')">访问信息</a>
				</li>
			</ul>
		</div>


	</div>
</body>

</html>
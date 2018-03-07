/**
 * 权限管理js
 */
$(document).ready(function() {

	//	alert(333);
	loadPermissionList();
});

/**
 * 加载列表数据
 */
function loadPermissionList() {

	var permission_list_table = $("#permission_list_table");
	permission_list_table.datagrid({
		title: "权限信息",
		method: "get",
		url: "../system/permission/permission_data.json",
		queryParams: {

			"permission_id": $("#condition_permission_id_input").val(),
			"permission_name": $("#condition_permission_name_input").val()
		},
		fit: true,
		sortName: 'permissionCode',
		sortOrder: 'asc',
		pageSize: 30,
		pageList: [30, 50, 100],
		rownumbers: true,
		pagination: true,
		striped: true,
		fitColumns: true,
		autoRowHeight: false,
		loadMsg: 'loading, please wait a moment',
		showFooter: true,
		ctrlSelect: true,
		singleSelect: false,
		onDblClickRow: function(rowIndex, rowData) {
			openPermissionPage('edit', rowData.permissionCode);
		},
		frozenColumns: [
			[{
				field: '',
				checkbox: true
			}]
		],
		toolbar: [{
			text: '添加',
			iconCls: 'icon-add',
			handler: function() {

				openPermissionPage('add', '');
			}
		}, '-', {
			text: '修改',
			iconCls: 'icon-edit',
			handler: function() {

				var row = $("#permission_list_table").datagrid("getSelected");
				if (null == row) {
					alert("请选择要修改的数据！");
					return false;
				}
				openPermissionPage('edit', row.permissionCode);
			}
		}, '-', {
			text: '删除',
			iconCls: 'icon-remove',
			handler: function() {

				var row = $("#permission_list_table").datagrid("getSelected");
				if (null == row) {
					alert("请选择要刪除的数据！");
					return false;
				}
				delPermission(row.permissionCode);
			}

		}, '-', {
			text: '打印',
			iconCls: 'icon-print',
			handler: function() {

				alert(" do print");
			}
		}]
	});
}

/**
 * 删除权限
 * @param {Object} id
 */
function delPermission(id) {
	alert(id);
}

/**
 * 打开权限页面
 * @param {Object} falg
 * @param {Object} id
 */
function openPermissionPage(falg, id) {

	var title = "";
	var href = "";
	if ("add" == falg) {
		title = "新增";
		href = "../system/permission/permissionInfo";
	} else if ("edit" == falg) {
		title = "修改";
		href = "../system/permission/permissionInfo?permission_id=" + id;
	} else {
		alert("状态错误！");
		return false;
	}

	$("#permission_popup_div").dialog({
		title: "权限【" + title + "】",
		maximizable: false,
		resizable: true,
		width: 400,
		height: 300,
		closed: false,
		cache: false,
		href: href,
		modal: true,
		onLoad: function() {
			$("#permission_info_page_flag").val(falg);
		},
		buttons: [{
			text: "保存",
			iconCls: "icon-save",
			handler: function() {

				alert("save");
				$("#permission_popup_div").dialog("close");
			}
		}, {
			text: "取消",
			iconCls: "icon-cancel",
			handler: function() {

				var result = window.confirm("还未提交保存,真的要关闭?");
				if (result) {
					$("#permission_popup_div").dialog("close");
				}
			}
		}]
	});
}

/**
 * 检索按钮
 */
function searchPermission() {

	//	alert("do search!");
	permissionListFlush();
}

/**
 * 重置按钮
 */
function resetPermission() {

	$("#condition_permission_id_input").val('');
	$("#condition_permission_name_input").val('');
}

/**
 * 刷新列表数据
 */
function permissionListFlush() {
	$("#permission_list_table").datagrid("load", {
		"permission_id": $("#condition_permission_id_input").val(),
		"permission_name": $("#condition_permission_name_input").val()
	});
}

/**
 * 
 * @param {Object} obj
 */
function onPermissionIsPublicChange(obj){
	
}

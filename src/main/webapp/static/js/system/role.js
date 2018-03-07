/**
 * 角色管理js
 */

$(document).ready(function() {

	loadRoleList();
});

/**
 * 加载列表数据
 */
function loadRoleList() {

	var role_list_table = $("#role_list_table");
	role_list_table.datagrid({
		title : "角色信息",
		method : "post", //get方式可以查看easyui封装的分页参数
		url : _ctx + "/system/role/list",
		queryParams : {

			"roleCode" : "1001",
			"roleName" : $("#condition_role_name_input").val()
		},
		fit : true,
		sortName : 'code',//排序字段(传递后台)
		sortOrder : 'asc',//排序方式(传递后台)
		pageSize : 20,
		pageList : [ 20, 50, 100 ],
		rownumbers : true,
		pagination : true,
		striped : true,
		fitColumns : true,
		autoRowHeight : false,
		loadMsg : 'loading, please wait...',
//		loadMsg : '加载中, 请稍后...',
		// pageNumber: 2, //在设置分页属性的时候初始化页码
		showFooter : true,
		ctrlSelect : false,//ctrl多选
		singleSelect : true,//是否单选
		rowStyler : function(index, row) {
			if (row.roleStatus == 'M') {
				return 'background-color:red;color:#fff;';
			}
		},
		loadFilter : function(data) {
			// 返回过滤数据显示。该函数带一个参数'data'用来指向源数据（即：获取的数据源，比如Json对象）。您可以改变源数据的标准数据格式。这个函数必须返回包含'total'和'rows'属性的标准数据对象。
			if (data.roleStatus) {
				return data.roleStatus;
			} else {
				return data;
			}
		},
		onDblClickRow : function(rowIndex, rowData) {
			//row的双击事件
			openRolePage('edit', rowData.roleId);
		},
		frozenColumns : [ [ {
			//冻结列
			field : '',
			checkbox : true
		} ] ],
		toolbar : [ {
			text : '添加',
			iconCls : 'icon-add',
			handler : function() {

				openRolePage('add', '');
			}
		}, '-', {
			text : '修改',
			iconCls : 'icon-edit',
			handler : function() {

				var row = $("#role_list_table").datagrid("getSelected");
				if (null == row) {
					$.messager.alert("错误", "请选择要修改的数据！");
					return false;
				}
				openRolePage('edit', row.roleId);
			}
		}, '-', {
			text : '删除',
			iconCls : 'icon-remove',
			handler : function() {

				var row = $("#role_list_table").datagrid("getSelected");
				if (null == row) {
					$.messager.alert("错误", "请选择要刪除的数据！");
					return false;
				}
				delRole(row);
			}

		}, '-', {
			text : '打印',
			iconCls : 'icon-print',
			handler : function() {

				$.messager.alert("消息", " do print");
			}
		} ]
	});
}

/**
 * 删除角色
 * 
 * @param {Object}
 *            id
 */
function delRole(row) {

	$.messager.confirm('确认', '您确认想要删除记录吗？', function(r) {
		if (r) {
			delRoleById(row);
		}
	});
}

/**
 * 根据id删除
 * 
 * @param id
 */
function delRoleById(row) {

	$.ajax({
		url : _ctx + "/system/role/delete",
		type : "post",
		dataType : "JSON",
		data : row,
		success : function(backdata) {
			var data = eval(backdata);
			if (data.flag) {
				$.messager.alert('消息', data.msg);
				roleListFlush();
			}
		},
		error : function(msg) {
			alert(JSON.stringify( msg));
		}

	});

}

/**
 * 打开角色页面
 * 
 * @param {Object}
 *            falg
 * @param {Object}
 *            id
 */
function openRolePage(falg, id) {

	var title = "";
	var href = "";
	if ("add" == falg) {
		title = "新增";
		href = _ctx + "/system/role/info";
	} else if ("edit" == falg) {
		title = "修改";
		href = _ctx + "/system/role/info?id=" + id;
	} else {
		$.messager.alert("错误", "状态错误！");
		return false;
	}

	$("#role_popup_div").dialog({
		title : "角色【" + title + "】",
		maximizable : false,
		resizable : true,
		width : 400,
		height : 300,
		closed : false,
		cache : false,
		href : href,
		modal : true,
		onLoad : function() {
			$("#role_info_page_flag").val(falg);
		},
		buttons : [ {
			text : "保存",
			iconCls : "icon-save",
			handler : function() {

				saveRole();
				$("#role_popup_div").dialog("close");
				roleListFlush();
			}
		}, {
			text : "取消",
			iconCls : "icon-cancel",
			handler : function() {

				$.messager.confirm('确认', '还未提交保存,真的要关闭?', function(r) {
					if (r) {
						$("#role_popup_div").dialog("close");
					}
				});
			}
		} ]
	});
}

/**
 * 检索按钮
 */
function SearchRole() {
	
	$.messager.alert('我的消息', '频繁检索将增加服务器负担！', 'warning', flushRoleListCallback);
}

/**
 * 检索回调
 */
function flushRoleListCallback() {

	$.messager.progress();
	roleListFlush();
	$.messager.progress('close');

}

/**
 * 重置按钮 TODO
 */
function ResetRole() {

	$("#condition_role_code_input").val('');
	$("#condition_role_name_input").val('');

	$.messager.show({
				title : '我的消息',
				msg : "<a href='http://www.google.com' target='_black'>Google一下</a><br/>消息将在5秒后关闭。",
				timeout : 5000,
				showType : 'slide'
			});
}

/**
 * 刷新列表
 */
function roleListFlush() {
	
	$("#role_list_table").datagrid("load", $("#role_search_condition_form").serializeArray() );
}

/**
 * 保存角色
 */
function saveRole() {

	$('#role_add_form').form({
		url : _ctx + "/system/role/save",
		// async: false,
		onSubmit : function() {
			// do some check
			// return false to prevent submit;
		},
		// data: $("#role_add_form").serializeArray(),
		success : function(data) {

			// change the JSON string to javascript object
			var data = eval('(' + data + ')');
			if (data.flag) {
				$.messager.alert('消息', data.msg);
				roleListFlush();
			}
		}
	});
	$('#role_add_form').submit();
}



/**
 * 用户js
 */

/**
 * list_table 必须放在最上面,否则出错
 */
var user_list_table = $("#user_list_table");

$(document).ready(function() {

	loadUserList();
});

/**
 * 加载列表数据
 */
function loadUserList() {

	user_list_table.datagrid({
		title : "用户信息",
		method : "post", // get方式可以查看easyui封装的分页参数
		url : _ctx + "/system/user/list",
//		queryParams : serializSearchForm(), // TODO 使用jQ序列化表单数据会乱码,暂时采用这种方式
		queryParams : $("#user_search_form :input").serializeArray(), // TODO 使用jQ序列化表单数据会乱码,暂时采用这种方式
		fit : true,
		sortName : 'username',// 排序字段(传递后台)
		sortOrder : 'asc',// 排序方式(传递后台)
		pageSize : 20,
		pageList : [ 20, 50, 100 ],
		rownumbers : true,
		pagination : true,
		striped : true,
		fitColumns : true,
		autoRowHeight : false,
		loadMsg : 'loading, please wait...',
		showFooter : true,
		ctrlSelect : false,// ctrl多选
		singleSelect : true,// 是否单选
		onDblClickRow : function(rowIndex, rowData) {
			// 双击事件
			openUserPage('edit', rowData.id);
		},
		frozenColumns : [ [ {
			// 冻结列
			field : '',
			checkbox : true
		} ] ],
		toolbar : [ {
			text : '添加',
			iconCls : 'icon-add',
			handler : function() {

				// 打开新增
				openUserPage('add', '');
			}
		}, '-', {
			text : '修改',
			iconCls : 'icon-edit',
			handler : function() {

				var row = user_list_table.datagrid("getSelected");
				if (null == row) {
					$.messager.alert("ERROR", "请选择要修改的数据！", "error");
					return false;
				}
				// 打开修改
				openUserPage('edit', row.id);
			}
		}, '-', {
			text : '删除',
			iconCls : 'icon-remove',
			handler : function() {

				var row = user_list_table.datagrid("getSelected");
				if (null == row) {
					$.messager.alert("ERROR", "请选择要刪除的数据！", "error");
					return false;
				}
				delUser(row);
			}

		}, '-', {
			text : '打印',
			iconCls : 'icon-print',
			handler : function() {
				
				// TODO
				$.messager.alert("消息", " do print");
			}
		} ]
	});
}

/**
 * 删除用户
 * 
 * @param {Object}
 *            id
 */
function delUser(row) {

	$.messager.confirm('确认', '您确认想要删除记录吗？', function(r) {
		if (r) {
			delUserSinge(row);
		}
	});
}

/**
 * 删除
 * 描述：传入实体，可以按照自定义条件删除
 * @param row
 */
function delUserSinge(row) {

	$.ajax({
		url : _ctx +"/system/user/delete",
		type : "post",
		dataType : "JSON",
		data : row,
		success : function(backdata) {
			var data = eval(backdata);
			if (data.flag) {
				$.messager.alert('消息', data.msg);
				userListFlush();
			}
		},
		error : function(msg) {
			alert(JSON.stringify(msg));
		}
	});
}

/**
 * 打开用户页面
 * 
 * @param {Object}
 *            falg
 * @param {Object}
 *            id
 */
function openUserPage(falg, id) {

	var title = "";
	var href = "";
	var url = _ctx + "/system/user/info";
	if ("add" == falg) {
		title = "新增";
		href = url;
	} else if ("edit" == falg) {
		title = "修改";
		href = url + "?id=" + id;
	} else {
		$.messager.alert("错误", "状态错误！", "error");
		return false;
	}

	$("#user_popup_div").dialog({
		title : "用户【" + title + "】",
		maximizable : false,
		resizable : true,
		width : 400,
		height : 300,
		closed : false,
		cache : false,
		href : href,
		modal : true,
		onLoad : function() {
			$("#accountInfoPageFlag").val(falg);
		},
		buttons : [ {
			text : "保存",
			iconCls : "icon-save",
			handler : function() {

				saveUser();
				$("#user_popup_div").dialog("close");
				userListFlush();
			}
		}, {
			text : "取消",
			iconCls : "icon-cancel",
			handler : function() {

				$.messager.confirm('确认', '还未提交保存,真的要关闭?', function(r) {
					if (r) {
						$("#user_popup_div").dialog("close");
					}
				});
			}
		} ]
	});
}

/**
 * 检索按钮
 */
function searchUser() {

//	$.messager.alert('我的消息', '频繁检索将增加服务器负担！', 'warning',
//			flushUserListCallback);
	// TODO
	userListFlush();
}

/**
 * 检索回调
 */
function flushUserListCallback() {

	$.messager.progress();
	userListFlush();
	$.messager.progress('close');

}

/**
 * 重置按钮 TODO
 */
function resetUser() {

	$.each($("#user_search_form input"), function(index, obj) {
		// alert(typeof(obj));
		var type = $(obj).attr('type');
		if ('text' == type) {
			$(obj).val('');
		} else {
			alert('other input');
		}
	});
}

/**
 * 刷新列表
 */
function userListFlush() {

	// 序列化表单数据方式会导致提交失败 TODO 原因未知
	// user_list_table.datagrid("load",
	// $("#user_search_form").serialize() );

	user_list_table.datagrid("load", serializSearchForm());
}

/**
 * 保存用户
 */
function saveUser() {

	$('#user_info_form').form({
		type : "POST",
		url : _ctx + "/system/user/save",
		onSubmit : function() {
			// check;
		},
		success : function(data) {
			var data = eval('(' + data + ')');
			if (data.flag) {
				$.messager.alert('消息', data.msg);
//				userListFlush();
			}
		}
	});
	$('#user_info_form').submit();
}

/**
 * 序列化检索条件
 */
function serializSearchForm() {
	var jsonSearch = {
		"search_user_code" : $("#search_user_code").val(),
		"search_user_name" : $("#search_user_name").val()
	};

	// 序列化方式失败!
	// var jsonSearch = $("#user_search_form input").serialize();
	// alert(jsonSearch);

	return jsonSearch;
}


function userAction(value, row, index){
	
	
//	$.messager.alert(value);
	return "<a href='javascript:;' onclick=\"openUserPage('edit', '"+ row.id +"');\">修改</a> " +
			"| <a href='javascript:;' onclick=\"delUser('"+ row +"');\">删除</a>";
	
	
}











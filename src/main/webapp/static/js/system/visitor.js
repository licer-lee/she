/**
 * 账户类别js
 */

/**
 * list_table 必须放在最上面,否则出错
 */
var visitor_list_table = $("#visitor_list_table");

$(document).ready(function() {

	loadAccountTypeList();
});

/**
 * 加载列表数据
 */
function loadAccountTypeList() {

	visitor_list_table.datagrid({
		title : "访问信息",
		method : "post", // get方式可以查看easyui封装的分页参数
		url : "../system/visitor/list",
//		queryParams : serializSearchForm(), // TODO 使用jQ序列化表单数据会乱码,暂时采用这种方式
		queryParams : $("#visitor_search_form :input").serializeArray(), // TODO 使用jQ序列化表单数据会乱码,暂时采用这种方式
		fit : true,
		sortName : 'time',// 排序字段(传递后台)
		sortOrder : 'desc',// 排序方式(传递后台)
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
			openAccountTypePage('edit', rowData.accountTypeId);
		},
		onSelect: function(index, row){
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
				openAccountTypePage('add', '');
			}
		}, '-', {
			text : '修改',
			iconCls : 'icon-edit',
			handler : function() {

				var row = visitor_list_table.datagrid("getSelected");
				if (null == row) {
					$.messager.alert("错误", "请选择要修改的数据！");
					return false;
				}
				// 打开修改
				openAccountTypePage('edit', row.accountTypeId);
			}
		}, '-', {
			text : '删除',
			iconCls : 'icon-remove',
			handler : function() {

				var row = visitor_list_table.datagrid("getSelected");
				if (null == row) {
					$.messager.alert("错误", "请选择要刪除的数据！");
					return false;
				}
				delAccountType(row);
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
 * 删除账户类别
 * 
 * @param {Object}
 *            id
 */
function delAccountType(row) {

	$.messager.confirm('确认', '您确认想要删除记录吗？', function(r) {
		if (r) {
			delAccountTypeSinge(row);
		}
	});
}

/**
 * 删除
 * 描述：传入实体，可以按照自定义条件删除
 * @param row
 */
function delAccountTypeSinge(row) {

	$.ajax({
		url : "../business/accountType/delAccountType",
		type : "post",
		dataType : "JSON",
		data : row,
		success : function(backdata) {
			var data = eval(backdata);
			if (data.flag) {
				$.messager.alert('消息', data.msg);
				accountTypeListFlush();
			}
		},
		error : function(msg) {
			alert(JSON.stringify(msg));
		}
	});
}

/**
 * 打开账户类别页面
 * 
 * @param {Object}
 *            falg
 * @param {Object}
 *            id
 */
function openAccountTypePage(falg, id) {

	var title = "";
	var href = "";
	var url = "../business/accountType/accountTypeInfo";
	if ("add" == falg) {
		title = "新增";
		href = url;
	} else if ("edit" == falg) {
		title = "修改";
		href = url + "?accountTypeId=" + id;
	} else {
		$.messager.alert("错误", "状态错误！");
		return false;
	}

	$("#visitor_popup_div").dialog({
		title : "账户类别【" + title + "】",
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

				saveAccountType();
				$("#visitor_popup_div").dialog("close");
				accountTypeListFlush();
			}
		}, {
			text : "取消",
			iconCls : "icon-cancel",
			handler : function() {

				$.messager.confirm('确认', '还未提交保存,真的要关闭?', function(r) {
					if (r) {
						$("#visitor_popup_div").dialog("close");
					}
				});
			}
		} ]
	});
}

/**
 * 检索按钮
 */
function searchAccountType() {

//	$.messager.alert('我的消息', '频繁检索将增加服务器负担！', 'warning',
//			flushAccountTypeListCallback);
	// TODO
	accountTypeListFlush();
}

/**
 * 检索回调
 */
function flushAccountTypeListCallback() {

	$.messager.progress();
	accountTypeListFlush();
	$.messager.progress('close');

}

/**
 * 重置按钮 TODO
 */
function resetAccountType() {

	$.each($("#visitor_search_form input"), function(index, obj) {
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
function accountTypeListFlush() {

	// 序列化表单数据方式会导致提交失败 TODO 原因未知
	// visitor_list_table.datagrid("load",
	// $("#visitor_search_form").serialize() );

	visitor_list_table.datagrid("load", serializSearchForm());
}

/**
 * 保存账户类别
 */
function saveAccountType() {

	$('#visitor_add_form').form({
		type : "post",
		url : "../business/accountType/addAccountType",
		onSubmit : function() {
			// check;
		},
		success : function(data) {
			var data = eval('(' + data + ')');
			if (data.flag) {
				$.messager.alert('消息', data.msg);
				accountTypeListFlush();
			}
		}
	});
	$('#visitor_add_form').submit();
}

/**
 * 序列化检索条件
 */
function serializSearchForm() {
	var jsonSearch = {
		"search_visitor_code" : $("#search_visitor_code").val(),
		"search_visitor_name" : $("#search_visitor_name").val()
	};

	// 序列化方式失败!
	// var jsonSearch = $("#visitor_search_form input").serialize();
	// alert(jsonSearch);

	return jsonSearch;
}

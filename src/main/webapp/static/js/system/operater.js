/**
 * 操作员管理js
 */
$(document).ready(function() {

	//	alert(333);
	loadOperaterList();
});

/**
 * 加载列表数据
 */
function loadOperaterList() {

	var operater_list_table = $("#operater_list_table");
	operater_list_table.datagrid({
		title: "操作员信息",
		method: "get",
		url: "../system/operater/operater_data.json",
		queryParams: {

			"operater_id": $("#condition_operater_id_input").val(),
			"operater_name": $("#condition_operater_name_input").val()
		},
		fit: true,
		sortName: 'operaterCode',
		sortOrder: 'asc',
		pageSize: 30,
		pageList: [30, 50, 100],
		rownumbers: true,
		pagination: true,
		striped: true,
		fitColumns: true,
		autoRowHeight: false,
		loadMsg: 'loading, please wait a moment',
		//pagePosition: 'top',
		pageNumber: 2, //在设置分页属性的时候初始化页码
		showFooter: true,
		ctrlSelect: true,
		singleSelect: false,
		rowStyler: function(index, row) {
			if (row.operaterStatus == 'M') {
				return 'background-color:red;color:#fff;';
			}
		},
		loadFilter: function(data) {
			//返回过滤数据显示。该函数带一个参数'data'用来指向源数据（即：获取的数据源，比如Json对象）。您可以改变源数据的标准数据格式。这个函数必须返回包含'total'和'rows'属性的标准数据对象。
			if (data.operaterStatus) {
				return data.operaterStatus;
			} else {
				return data;
			}
		},
		onDblClickRow: function(rowIndex, rowData) {
			openOperaterPage('edit', rowData.operaterCode);
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

				openOperaterPage('add', '');
			}
		}, '-', {
			text: '修改',
			iconCls: 'icon-edit',
			handler: function() {

				var row = $("#operater_list_table").datagrid("getSelected");
				if (null == row) {
					alert("请选择要修改的数据！");
					return false;
				}
				openOperaterPage('edit', row.operaterCode);
			}
		}, '-', {
			text: '删除',
			iconCls: 'icon-remove',
			handler: function() {

				var row = $("#operater_list_table").datagrid("getSelected");
				if (null == row) {
					alert("请选择要刪除的数据！");
					return false;
				}
				delOperater(row.operaterCode);
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
 * 删除操作员
 * @param {Object} id
 */
function delOperater(id) {
	alert(id);
}

/**
 * 打开操作员页面
 * @param {Object} falg
 * @param {Object} id
 */
function openOperaterPage(falg, id) {

	var title = "";
	var href = "";
	if ("add" == falg) {
		title = "新增";
		href = "../system/operater/operaterInfo";
	} else if ("edit" == falg) {
		title = "修改";
		href = "../system/operater/operaterInfo?operater_id=" + id;
	} else {
		alert("状态错误！");
		return false;
	}

	$("#operater_popup_div").dialog({
		title: "操作员【" + title + "】",
		maximizable: false,
		resizable: true,
		width: 400,
		height: 300,
		closed: false,
		cache: false,
		href: href,
		modal: true,
		onLoad: function() {
			$("#operater_info_page_flag").val(falg);
		},
		buttons: [{
			text: "保存",
			iconCls: "icon-save",
			handler: function() {

				alert("save");
				$("#operater_popup_div").dialog("close");
			}
		}, {
			text: "取消",
			iconCls: "icon-cancel",
			handler: function() {

				var result = window.confirm("还未提交保存,真的要关闭?");
				if (result) {
					$("#operater_popup_div").dialog("close");
				}
			}
		}]
	});
}

/**
 * 检索按钮
 */
function searchOperater() {

	//	alert("do search!");
	operaterListFlush();
}

/**
 * 重置按钮
 */
function resetOperater() {

	$("#condition_operater_id_input").val('');
	$("#condition_operater_name_input").val('');
}

function operaterListFlush() {
	$("#operater_list_table").datagrid("load", {
		"operater_id": $("#condition_operater_id_input").val(),
		"operater_name": $("#condition_operater_name_input").val()
	});
}
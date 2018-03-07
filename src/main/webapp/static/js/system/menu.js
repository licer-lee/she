/**
 * 菜单管理js
 */

/**
 * list_table 必须放在最上面,否则出错
 */
var menu_list_table = $("#menu_list_table");

$(document).ready(function() {

	loadMenuList();
});

/**
 * 加载列表数据
 */
function loadMenuList() {

	menu_list_table.datagrid({
		title: "菜单信息",
		method: "post",
//		url: _ctx+"/system/menu/menu_data.json",
		url: _ctx+"/system/menu/list",
		queryParams: {
			"menu_id": $("#condition_menu_id_input").val(),
			"menu_name": $("#condition_menu_name_input").val()
		},
		fit: true,
		sortName: 'id',
		sortOrder: 'asc',
//		pageSize: 20,
//		pageList: [20, 50, 100],
		rownumbers: true,
		pagination: true,
		striped: true,
		fitColumns: true,
		autoRowHeight: false,
		loadMsg: 'loading, please wait a moment',
		//pagePosition: 'top',
		pageNumber: 1, //在设置分页属性的时候初始化页码
		showFooter: true,
		ctrlSelect: true,
		singleSelect: false,
		rowStyler: function(index, row) {
			/*if (row.menuStatus == 'M') {
				return 'background-color:red;color:#fff;';
			}*/
		},
		loadFilter: function(data) {
			//返回过滤数据显示。该函数带一个参数'data'用来指向源数据（即：获取的数据源，比如Json对象）。您可以改变源数据的标准数据格式。这个函数必须返回包含'total'和'rows'属性的标准数据对象。
			if (data.menuStatus) {
				return data.menuStatus;
			} else {
				return data;
			}
		},
		onDblClickRow: function(rowIndex, rowData) {
			openMenuPage('edit', rowData.id);
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

				openMenuPage('add', '');
			}
		}, '-', {
			text: '修改',
			iconCls: 'icon-edit',
			handler: function() {

				var row = menu_list_table.datagrid("getSelected");
				if (null == row) {
					alert("请选择要修改的数据！");
					return false;
				}
				openMenuPage('edit', row.id);
			}
		}, '-', {
			text: '删除',
			iconCls: 'icon-remove',
			handler: function() {

				var row = menu_list_table.datagrid("getSelected");
				if (null == row) {
					alert("请选择要刪除的数据！");
					return false;
				}
				delMenu(row.menuCode);
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
 * 删除菜单
 * @param {Object} id
 */
function delMenu(id) {
	alert(id);
}

/**
 * 打开菜单页面
 * @param {Object} falg
 * @param {Object} id
 */
function openMenuPage(falg, id) {

	var title = "";
	var href = "";
	if ("add" == falg) {
		title = "新增";
		href = _ctx +"/system/menu/info";
	} else if ("edit" == falg) {
		title = "修改";
		href = _ctx +"/system/menu/info?id=" + id;
	} else {
		alert("状态错误！");
		return false;
	}

	$("#menu_popup_div").dialog({
		title: "菜单【" + title + "】",
		maximizable: false,
		resizable: false,
		width: 600,
		height: 400,
		closed: false,
		cache: false,
		href: href,
		modal: true,
		onLoad: function() {
			$("#menu_info_page_flag").val(falg);
		},
		buttons: [{
			text: "保存",
			iconCls: "icon-save",
			handler: function() {

				saveMenu();
				
				$("#menu_popup_div").dialog("close");
			}
		}, {
			text: "取消",
			iconCls: "icon-cancel",
			handler: function() {

				var result = window.confirm("还未提交保存,真的要关闭?");
				if (result) {
					$("#menu_popup_div").dialog("close");
				}
			}
		}]
	});
}

/**
 * 保存
 */
function saveMenu() {

	$('#menu_info_form').form({
		type : "POST",
		url : _ctx + "/system/menu/addMenu",
		onSubmit : function() {
			// check;
			
			
		},
		success : function(bd) {
//			var data = eval('(' + data + ')');
			var data = $.parseJSON(bd);
			
			if (data.flag) {
				$.messager.alert('消息', data.msg);
//				userListFlush();
			}
		}
	});
	$('#menu_info_form').submit();
}


/**
 * 检索按钮
 */
function SearchMenu() {

	//	alert("do search!");
	menuListFlush();
}

/**
 * 重置按钮
 */
function ResetMenu() {

	$("#condition_menu_id_input").val('');
	$("#condition_menu_name_input").val('');
}

function menuListFlush() {
	menu_list_table.datagrid("load", {
		"menu_id": $("#condition_menu_id_input").val(),
		"menu_name": $("#condition_menu_name_input").val()
	});
}


function getParent(value, row, index ){
//	alert(value);
//	if(row){
//		return row.parent.name;
//	}else{
//		return '';
//	}
	
}








/**
 * 账户管理js
 */

/**
 * list_table 必须放在最上面,否则出错
 */
var account_list_table = $("#account_list_table");

$(document).ready(function() {

	loadAccountList();
	
//	$("#account_name_input").bind("keyup", function(e){
//		alert(11);
//		if(e.keyCode == 13){
//			saveAccount();
//		}
//
//	});
	
	
	
});

/**
 * 加载列表数据
 */
function loadAccountList() {

	account_list_table.datagrid({
		title : "账户信息",
		method : "post",
		url : "../business/account/getAccountList",
		queryParams : serializSearchForm(),
		fit : true,
		sortName : 'account',// 排序字段(传递后台)
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
			// row的双击事件
			openAccountPage('edit', rowData.accountId,
					rowData.accountType.accountTypeId);
			// alert(JSON.stringify( rowData.accountType));
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

				openAccountPage('add', '', '');
			}
		}, '-', {
			text : '修改',
			iconCls : 'icon-edit',
			handler : function() {

				var row = account_list_table.datagrid("getSelected");
				if (null == row) {
					$.messager.alert("错误", "请选择要修改的数据！");
					return false;
				}
				openAccountPage('edit', row.accountId, row.accountType.accountTypeId);
			}
		}, '-', {
			text : '删除',
			iconCls : 'icon-remove',
			handler : function() {

				var row = account_list_table.datagrid("getSelected");
				if (null == row) {
					$.messager.alert("错误", "请选择要刪除的数据！");
					return false;
				}
				delAccount(row);
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
 * 删除账户
 * 
 * @param {Object}
 *            id
 */
function delAccount(row) {

	$.messager.confirm('确认', '您确认想要删除记录吗？', function(r) {
		if (r) {
			delAccountById(row);
		}
	});
}

/**
 * 根据id删除
 * 
 * @param id
 */
function delAccountById(row) {

	console.log(JSON.stringify(row));
	//根据key删除json元素
	//( TODO json中value如果是对象,通过spring装配实体时会出错.这里因为accountType不是必须元素,临时解决方案就是删除accountType )
	delete row['accountType'];
	console.log(JSON.stringify(row));
	
	$.ajax({
		url : "../business/account/delAccount",
		type : "post",
		dataType : "JSON",
		data : row,
		//contentType: "application/json",
//		data : JSON.stringify(row),
		success : function(backdata) {
			var data = eval(backdata);
			if (data.flag) {
				$.messager.alert('消息', data.msg);
				accountListFlush();
			}
		},
		error : function(request, status, e) {
			//alert(JSON.stringify(request));
			alert(JSON.stringify(status));
			//alert(JSON.stringify(e));
		}
	});
}

/**
 * 打开账户页面
 * 
 * @param {Object}
 *            flag
 * @param {Object}
 *            id
 */
function openAccountPage(flag, id, typeId) {

	var title = "";
	var href = "";
	if ("add" == flag) {
		title = "新增";
		href = "../business/account/accountInfo";
	} else if ("edit" == flag) {
		title = "修改";
		href = "../business/account/accountInfo?accountId=" + id;
	} else {
		$.messager.alert("错误", "状态错误！");
		return false;
	}

	$("#account_popup_div").dialog({
		title : "账户【" + title + "】",
		maximizable : false,
		resizable : true,
		width : 400,
		height : 300,
		closed : false,
		cache : false,
		href : href,
		modal : true,
		onLoad : function() {
			// 加载完成后触发
			$("#account_info_page_flag").val(flag);
			// 设置combobox的值
			$('#account_type_input').combobox('setValue', typeId);
		},
		buttons : [ {
			text : "保存",
			iconCls : "icon-save",
			handler : function() {

				saveAccount();
				$("#account_popup_div").dialog("close");
				accountListFlush();
			}
		}, {
			text : "取消",
			iconCls : "icon-cancel",
			handler : function() {

				$.messager.confirm('确认', '还未提交保存,真的要关闭?', function(r) {
					if (r) {
						$("#account_popup_div").dialog("close");
					}
				});
			}
		} ]
	});
}

/**
 * 检索按钮
 */
function searchAccount() {

//	$.messager.alert('我的消息', '频繁检索将增加服务器负担！', 'warning',
//			flushAccountListCallback);
	
	accountListFlush();
}

/**
 * 检索回调
 */
function flushAccountListCallback() {

	$.messager.progress();
	accountListFlush();
	$.messager.progress('close');
}

/**
 * 重置按钮 TODO
 */
function resetAccount() {

	$.each($("#account_search_form input"), function(index, obj) {
		var type = $(obj).attr('type');
		if ('text' == type) {
			$(obj).val('');
		}else if('hidden' == type){
			$(obj).val('');
		} 
		else {
			// TODO
			//alert('other input');
		}
	});
}

/**
 * 刷新列表
 */
function accountListFlush() {

	account_list_table.datagrid("load", serializSearchForm());
}

/**
 * 保存账户
 */
function saveAccount() {
	
	//alert($("#account_add_form").serialize());
	//return;
	
	$.ajax({
		type:"post",
		url:"../business/account/addAccount",
		dataType:"json",
		data:$("#account_add_form").serialize(),
		async:false,
		onSubmit: function(){
			return $("#account_add_form").form('validate');
		},
		success:function(backdata){
			var data = eval(backdata);
			if (data.flag) {
				$.messager.alert('消息', data.msg);
			}
		},
		error:function(request, status, event){
			alert(JSON.stringify(status));
		}
	});
}

/**
 * 保存1
 */
function saveAccount1() {

	$('#account_add_form').form({
		type : "post",
		async: false,
		url : "../business/account/addAccount",
		onSubmit : function() {
			return $(this).form("validate");
		},
		success : function(data) {
			var data = eval(backdata);
			if (data.flag) {
				$.messager.alert('消息', data.msg);
			}
		}
	});
	$('#account_add_form').submit();
}

/**
 * 序列化检索条件
 */
function serializSearchForm() {
	
	var search_account_type_id ;
	var obj = document.getElementsByName('search_account_type_id');
	//alert(search_account_type_id[0].value);
	if( obj.length > 0 ){
		search_account_type_id = obj[0].value;
	}
	
	var jsonSearch = {
		"search_account_type_id" : search_account_type_id, 
		"search_account_code" : $("#search_account_code").val(),
		"search_account_note" : $("#search_account_note").val()
	};
	return jsonSearch;
}



function showType(){
	
	$("<div>3232</div>").dialog({
		title: 'My Dialog',
		width: 400,
		height: 200,
		closed: false,
		cache: false,
		//href: '../business/accountType/list.jsp',
		modal: true
		
	});
	
}

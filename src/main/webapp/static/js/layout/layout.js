/**
 * 中心首页js auth liwc
 */
$(document).ready(function() {

	// 周期性获取当前时间
	window.setInterval("defaultgetdate()", 1000);
});

/**
 * 添加tab选项卡
 * 
 * @param {Object}
 *            tabs
 * @param {Object}
 *            title
 * @param {Object}
 *            url
 */
function addTab(tabs, title, url) {

	// 只保留一个tab(除了个人主页)
	$(".tabs li").each(function(index, obj) {
		// 获取所有可关闭的选项卡
		var tab = $(".tabs-closable", this).text();
		$(".easyui-tabs").tabs('close', tab);
	});

	if (!$("#" + tabs).tabs("exists", title)) {
		createTab(tabs, title, url);
	} else {

		// $("#" + tabs).tabs('select', title); //选中并刷新
		// var currTab = $('#tabs').tabs('getSelected');
		// var url2 = $(currTab.panel('options').content).attr('src');
		// alert(url2);
		// if (url2 != undefined && currTab.panel('options').title != '个人主页') {
		// $("#" + tabs).tabs('update', {
		// tab: currTab,
		// iconCls: 'icon-help',
		// options: {
		// href: url2
		// }
		// });
		// }
	}
	$("#" + tabs).tabs("select", title);
}

/**
 * 创建tab面板
 * 
 * @param {Object}
 *            tabs
 * @param {Object}
 *            name
 * @param {Object}
 *            url
 * @return {Object} newTab
 */
function createTab(tabs, title, url) {
	$("#" + tabs).tabs('add', {
		title : title,
		closable : true,
		href : url,
		// iconCls: 'icon-reload',
		selected : true,
	});
	return $("#" + tabs).tabs("getTab", title);
}

/**
 * 创建iframe页面
 * 
 * @param {Object}
 *            url
 */
function createFrame(url) {
	var s = '<iframe scrolling="auto" frameborder="0" src="' + url
			+ '" style="width:100%;height:100%;"></iframe>';
	return s;
}

/**
 * js获取当前时间
 */
function defaultgetdate() {
	$("#default_top_datetime")
			.text(
					new Date().getFullYear()
							+ "-"
							+ (new Date().getMonth() + 1)
							+ "-"
							+ new Date().getDate()
							+ " "
							+ new Array("星期日", "星期一", "星期二", "星期三", "星期四",
									"星期五", "星期六")[new Date().getDay()] + " "
							+ new Date().toLocaleTimeString());
}

/**
 * 获取菜单数据
 */
function getMenuList() {
	$.ajax({
		type : "get",
		url : "menu.json",
		dataType : "JSON",
		async : false,
		success : function(backdata) {
			alert(JSON.stringify(backdata));
			createMenu(backdata);
		},
		error : function(e, status, msg) {
			alert(JSON.stringify(e));
		}
	});
}

/**
 * 创建菜单列表
 * 
 * @param {Object}
 *            data
 */
function createMenu(data) {
	var menu_list_div = $("#menu_div");
	var menu = "";
	var d = eval(data);
	var menus = new Array();
	menus = d.menu_list;
	for (var i = 0; i < menus.length; i++) {
		menu = menu
				+ "<div title='"
				+ menus[i].menu_name
				+ "' data-options='' style='overflow:auto;padding:10px;'></div>";
	}
	alert(menu);
	menu_list_div.append(menu);
}
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/meta.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>添加/编辑页面</title>
</head>

<body>

	<form id="menu_info_form" name="menu_info_form" id method="post" >
		<!-- 页面flag：add/edit -->
		<input type="hidden" name="menu_page_flag" id="menu_page_flag" />
		<!-- id -->
		<input type="hidden" id="id" name="id" value="${id }">

		<div id="account_add_div">
			<table width="100%" style="margin: 0 auto;" border="0"
				cellspacing="0" cellpadding="0">
				<tr>
					<td id="main_form" bgcolor="#FFFFFF" style="vertical-align: top;">
						<div
							style="background: url('<c:out value="${ctx}"/>/static/images/inputPageHeadBg.gif') repeat-x scroll 0% 0% transparent; padding: 10px;">
							<div id="ItemBlock_Title">
								&nbsp; 
								<img border="0" src="<c:out value="${ctx}"/>/static/images/item_point.gif" />
								&nbsp;基本信息 &nbsp;
							</div>
						</div>

						<table class="addtable_class" width="100%" border="0">
							<tr>
								<td align='right'>名称：</td>
								<td><input type="text" id="name" name="name"
									class="easyui-textbox " title="" value="${name }"
									style="width: 200px;" data-options="required:true" /> 
									<span class="Prompt">*</span>
								</td>
							</tr>
							<tr>
								<td align='right'>图标：</td>
								<td><input type="text" id="icon" name="icon"
									class="easyui-textbox inputText easyui-tooltip" title="" value="${icon }"
									style="width: 200px;" data-options="" /> 
									<span class="Prompt">*</span>
								</td>
							</tr>
							<tr>
								<td align='right'>URL：</td>
								<td><input type="text" id="url" name="url"
									class="easyui-textbox inputText easyui-tooltip" title="" value="${url }"
									style="width: 200px;" data-options="" /> 
									<span class="Prompt">*</span>
								</td>
							</tr>
							<tr>
								<td align='right'>序号：</td>
								<td><input type="text" id="orderNo" name="orderNo"
									class="easyui-textbox inputText easyui-tooltip" title="" value="${orderNo }"
									style="width: 200px;" data-options="" /> 
									<span class="Prompt">*</span>
								</td>
							</tr>
							<tr>
								<td align='right'>类型：</td>
								<td>
									<label>
										<input type="radio" name="type" value="module" >模块</input>
                                     </label>
                                     <label>
										<input type="radio" name="type" value="page" checked="checked">页面</input>
                                     </label>

									<span class="Prompt">*</span></td>
							</tr>
							
							<tr id="parentMenuSelect">
								<td align='right'>父菜单：</td>
								<td>
									<input class="easyui-combobox" name="parent.id" id="parent"
										data-options="
					                    url:'${ctx }/system/menu/getRootMenu',
					                    method:'get',
					                    valueField:'id',
					                    textField:'name',
					                    value:['${parent.id }' ],
					                    multiple:false,
					                    panelHeight:'auto',
					                    label: 'Language:',
					                    labelPosition: 'top'
					                    ">
									<span class="Prompt">*</span></td>
							</tr>
							
						</table>
					</td>
				</tr>
			</table>
		</div>
	</form>
	
	<script type="text/javascript">

$(function(){

	console.log('${parent.id}');
	
	$('input[name="type"]').on('click', function(){
		var val = $('input[name="type"]:checked').val();
		if(val == 'page'){
			$('#parentMenuSelect').show();
		}else{
			$('#parentMenuSelect').hide();
		}
	});
	
	
	var type = '${type}';
	if(type){
		$('input[name="type"][value="'+type+'"]').click();
		if(type == 'page'){
			$('#parentMenuSelect').show();
		}else{
			$('#parentMenuSelect').hide();
		}
	}
	
});


</script>

</body>

</html>
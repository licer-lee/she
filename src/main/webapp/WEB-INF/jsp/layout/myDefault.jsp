<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/meta.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>默认shou页</title>

<style type="text/css">
.title {
	font-size: 16px;
	font-weight: bold;
	padding: 2px 1px;
	background: #eee;
	overflow: hidden;
	border-bottom: 1px solid #ccc;
}

.t-list {
	padding: 5px;
}
</style>
</head>

<body class="easyui-layout">


	<div region="north" class="title" border="false" style="width: 100%; height:60px;">
			jQuery EasyUI Portal
			
			<input class="easyui-switchbutton" data-options="onText:'Yes',offText:'No'">
			
	</div>



	<div region="center" border="false" style="width: 100%; height: 100%;">
		
		<!-- Portal -->
		<div id="pp" style="position:relative; height: auto">



			<div style="width:30%;">
				<div title="Searching" iconCls="icon-search" closable="true" style="height:100%;padding:10px;">

				</div>
			</div>


			<!-- clock -->
			<div style="width:50px;" >
				<div title="Clock" closable="true"
					style="text-align:center;background:#f3eeaf;height:auto;padding:5px;">
					<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
						codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0"
						width="100" height="100">
						<param name="movie" value="http://www.respectsoft.com/onlineclock/analog.swf">
						<param name=quality value=high>
						<param name="wmode" value="transparent">
						<embed src="http://www.respectsoft.com/onlineclock/analog.swf"
							width="100" height="100" quality=high
							pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash"
							type="application/x-shockwave-flash" wmode="transparent">
						</embed>
					</object>
				</div>
			</div>



		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			$('#pp').portal({
				border : false,
				fit : true
			});

			//add();
		});

		function add() {
			for ( var i = 0; i < 5; i++) {
				var p = $('<div/>').appendTo('body');
				p.panel({
					title : 'Title' + i,
					content : '<div style="padding:5px;">Content' + (i + 1)
							+ '</div>',
					height : 100,
					closable : true,
					collapsible : true
				});
				$('#pp').portal('add', {
					panel : p,
					columnIndex : i
				});
			}
			$('#pp').portal('resize');
		}

		function remove() {
			$('#pp').portal('remove', $('#pgrid'));
			$('#pp').portal('resize');
		}
		
		$('#ss').searchbox({
		    searcher:function(value,name){
		        alert(value + "," + name);
		    },
		    menu:'#mm',
		    prompt:'Please Input Value'
		});
	</script>
</body>

</html>
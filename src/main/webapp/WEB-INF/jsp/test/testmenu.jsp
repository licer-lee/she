<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/meta.jsp"%>

<!DOCTYPE html>
<html>
<head>
<title>menu</title>

</head>
<body>

	<div>
		<ul id="treeDemo" class="ztree"></ul>
	</div>

<script type="text/javascript">
d = new dTree('d');

d.add(0,-1,'My example tree');
d.add(1,0,'Node 1','example01.html');
d.add(2,0,'Node 2','example01.html');
d.add(3,1,'Node 1.1','example01.html');
d.add(4,0,'Node 3','example01.html');
d.add(5,3,'Node 1.1.1','example01.html');
d.add(6,5,'Node 1.1.1.1','example01.html');
d.add(7,0,'Node 4','example01.html');
d.add(8,1,'Node 1.2','example01.html');
d.add(9,0,'My Pictures','example01.html','Pictures I\'ve taken over the years','','','${ctx}/static/dtree/img/imgfolder.gif');
d.add(10,9,'The trip to Iceland','example01.html','Pictures of Gullfoss and Geysir');
d.add(11,9,'Mom\'s birthday','example01.html');
d.add(12,0,'Recycle Bin','example01.html','','','${ctx}/dtree/img/trash.gif');

document.write(d);

</script>
</body>


</html>
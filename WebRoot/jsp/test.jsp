<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page import="java.net.URLDecoder"%>
<%@ page contentType="text/html;charset=utf8"%>
<title>test</title>
<script type="text/javascript" src="/gov/js/jquery-1.8.3.min.js"></script>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
</head>
<body>
   <input type="text" id="token" value="${token }">
	<div id="tb">
	      ID:<div id="result"></div>
	</div> 
</body> 
<!-- 所有的自己编写的js都放在最下面引入，不能放在上面。否则取不到token -->
<script type="text/javascript" src="/gov/js/common.js"></script>
<script type="text/javascript" src="/gov/js/test.js"></script>
<script type="text/javascript">     
//	add(20);
    getOne(20);
</script>   
</html>
</span>

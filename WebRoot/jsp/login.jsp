<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page import="java.net.URLDecoder"%>
<%@ page contentType="text/html;charset=utf8"%>
<title>login</title>
<script type="text/javascript" src="/gov/js/jquery-1.8.3.min.js"></script>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" /> 
<script type="text/javascript">
</script>
<script type="JavaScript">  
<%  
 //request.getSession().setAttribute("token","123123");
%>  
<%  
String token=request.getParameter("token");  
if(token!=null&&!token.equals("")){
request.getSession().setAttribute("token",token);  
}
%> 
</script>  
</head>

<body>
     <input type="text" id="token" value="${token }">
	<div id="tb">登陆
	     用户名<input id="username" value="admin" type="text">
	     密码<input id="pwd" value="admin" type="text">
	     <input type="button" onclick="login()" value="登陆">
	</div>
	</br></br></br>
		<div id="tb">注册
	     用户名<input id="regusername" value="admin" type="text">
	     密码<input id="regpwd" value="admin" type="text">
	     <input type="button" onclick="regdit()"  value="注册">
	</div>
</body>
<script type="text/javascript" src="/gov/js/common.js"></script>
<script type="text/javascript" src="/gov/js/login.js"></script>
</html>
</span>

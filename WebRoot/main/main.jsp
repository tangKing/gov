<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>嫩江县综合管理办公平台</title>
<script type="text/javascript">
		var tet="fasdfas";
 	</script>
</head>
<%  
String token=request.getParameter("token");  
if(token!=null&&!token.equals("")){
request.getSession().setAttribute("token",token);  
}

String username = request.getParameter("username");
String password = request.getParameter("password");
String dId = request.getParameter("dId");
String role = request.getParameter("role");
String rName = request.getParameter("rName");
request.getSession().setAttribute("username",username); 
request.getSession().setAttribute("password",password);
request.getSession().setAttribute("dep_id",dId); 
request.getSession().setAttribute("role",role); 
request.getSession().setAttribute("realName",rName); 
%>
<frameset rows="127,*,11" frameborder="no" border="0" framespacing="0">
  <frame src="top.jsp" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" />
  <frameset rows="*" cols="8,147,10,*,8" id="frame">
	<frame src="temp.jsp" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" />
	<frame src="left.jsp?role=${role }" name="leftFrame" noresize="noresize" marginwidth="0" marginheight="0" frameborder="0" scrolling="auto">
	<frame src="white.jsp" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" />
	<frame src="right.jsp" name="rightFrame" marginwidth="0" marginheight="0" frameborder="0" scrolling="yes">
	<frame src="temp.jsp" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" />
</frameset>

  <frame src="down.jsp" name="bottomFrame" scrolling="No" noresize="noresize" id="bottomFrame" />
</frameset>
<noframes><body>
</body>
</noframes></html>

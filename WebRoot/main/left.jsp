<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE3 {
	font-size: 12px;
	color: #435255;
}
.STYLE4 {font-size: 12px}
.STYLE5 {font-size: 12px; font-weight: bold; }
-->
</style></head>
<%
	Object obj = request.getSession().getAttribute("role");
	if(obj==null){
		String role = request.getParameter("role");
	}
	int role = 0;
	if(null != obj){
		role = Integer.parseInt((String)obj);
	}
%>
<body>
<table width="147" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="23" background="../images/main/main_34.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="9%">&nbsp;</td>
        <td width="83%"><div align="center" class="STYLE5">督办系统</div></td>
        <td width="8%">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  
  		<tr>
    <td valign="top"><div align="center">
      <table width="82%" border="0" align="center" cellpadding="0" cellspacing="0">
       <%
  	if(role == 1){
  %>
        <tr>
          <td height="38"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="33" height="28"><img src="../images/main/main_40.gif" width="28" height="28"></td>
              <td width="99"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td height="23" class="STYLE4" style="cursor:hand">
					<a href="duban_add.jsp" target="rightFrame" style="text-decoration:none;color:#000000;cursor:hand">
					督办通知单</a></td>
                  </tr>
              </table></td>
            </tr>
          </table></td>
        </tr>
  <%		
  	}
  %>

  		<tr>
          <td height="38"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="33" height="28"><img src="../images/main/main_48.gif" width="28" height="28"></td>
              <td width="99"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td height="23" class="STYLE4" style="cursor:hand" onMouseOver="this.style.backgroundImage='url(../images/main/tab_bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'">
					<a href="duban_list.jsp" target="rightFrame" style="text-decoration:none;color:#000000;cursor:hand">
					查看通知单
					</a>
					</td>
                  </tr>
              </table></td>
            </tr>
          </table></td>
        </tr>

  <%
  	if(role == 1){
  %>
  		<tr>
          <td height="38"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="33" height="28"><img src="../images/main/main_50.gif" width="28" height="28"></td>
              <td width="99"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td height="23" class="STYLE4" style="cursor:hand" onMouseOver="this.style.backgroundImage='url(../images/main/tab_bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'">
					<a href="zhengfu_add.jsp" target="rightFrame" style="text-decoration:none;color:#000000;cursor:hand">
					政府发文单
					</a>
					</td>
                  </tr>
              </table></td>
            </tr>
          </table></td>
        </tr>
  <%		
  	}
  %>

	<tr>
          <td height="38"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="33" height="28"><img src="../images/main/main_46.gif" width="28" height="28"></td>
              <td width="99"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td height="23" class="STYLE4" style="cursor:hand" onMouseOver="this.style.backgroundImage='url(../images/main/tab_bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'">
					<a href="zhengfu_list.jsp" target="rightFrame" style="text-decoration:none;color:#000000;cursor:hand">
					查看发文单</a></td>
                  </tr>
              </table></td>
            </tr>
          </table></td>
        </tr>
      <tr>
          <td height="38"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="33" height="28"><img src="../images/main/main_48.gif" width="28" height="28"></td>
              <td width="99"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td height="23" class="STYLE4" style="cursor:hand" onMouseOver="this.style.backgroundImage='url(../images/main/tab_bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'">
					<a href="duban_create.jsp" target="rightFrame" style="text-decoration:none;color:#000000;cursor:hand">
					新建督办单</a></td>
                  </tr>
              </table></td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td height="38"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="33" height="28"><img src="../images/main/main_50.gif" width="28" height="28"></td>
              <td width="99"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td height="23" class="STYLE4" style="cursor:hand" onMouseOver="this.style.backgroundImage='url(../images/main/tab_bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><a href="duban_showList.jsp" target="rightFrame" style="text-decoration:none;color:#000000;cursor:hand">查看督办单</a></td>
                  </tr>
              </table></td>
            </tr>
          </table></td>
        </tr>

        <tr>
          <td height="38">&nbsp;</td>
        </tr>
      </table>
    </div></td>
  </tr>
  <tr>
    <td height="19" background="../images/main/main_69.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="24%">&nbsp;</td>
        <td width="76%" valign="bottom"><span class="STYLE3">版本：2016 v1.0</span></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>

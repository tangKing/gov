<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<style type="text/css">
body {
  margin-left: 3px;
  margin-top: 0px;
  margin-right: 3px;
  margin-bottom: 0px;
}
.STYLE1 {
  color: #e1e2e3;
  font-size: 14px;
}
.STYLE6 {color: #000000; font-size: 12; }
.STYLE10 {color: #000000; font-size: 14px; }
.STYLE19 {
  color: #344b50;
  font-size: 14px;
}
.STYLE21 {
  font-size: 14px;
  color: #3b6375;
}
.STYLE22 {
  font-size: 14px;
  color: #295568;
}
.mod {
  width: 24.7%;
  display: inline-block;
  font-size: 14px;
  margin-top: 5px;
}
.mod-icon {
  padding: 0 5px;
}
.mod-right {
  padding-right: 5px;
  text-align: right;
}
.bd-c {
  border: 1px solid #ADD2DA;
  border-top: 0;
  min-height: 100px;
}
a {
  color: #333;
  text-decoration: none;
}
a:hover {
  color: #325178;
  text-decoration: underline;
}
.fr {
  float: right;
}
.fl {
  float: left;
}
ul, ul li {
  padding: 0;
  margin: 0;
  list-style: none;
}
.list ul li {
  border-bottom: 1px dashed #ADD2DA;
  padding: 5px;
}
.list ul li:last-child {
  border-bottom: 0;
}
.list ul li .fr {
  position: relative;
  top: 3px;
}
.list-icon ul li {
  padding-left: 30px;
  background-repeat: no-repeat;
  background-position: 7px 5px;
}
.list-icon-1 ul li {
  background-image:url(../images/main/icon1.png);
}
.list-icon-2 ul li {
  background-image:url(../images/main/icon2.png);
}
.list-icon-3 ul li {
  background-image:url(../images/main/icon3.png);
}
.list-icon-4 ul li {
  background-image:url(../images/main/icon4.png);
}
.list-icon-5 ul li {
  background-image:url(../images/main/icon5.png);
}
.list-icon-6 ul li {
  background-image:url(../images/main/icon6.png);
}
.list-icon-7 ul li {
  background-image:url(../images/main/icon7.png);
}

@media screen and (min-width: 1200px) {
  .mod {
    width: 99.7%;
  }
}
@media screen and (max-width: 1200px) {
  .mod {
    width: 99.7%;
  }
}
@media screen and (max-width: 800px) {
  .mod {
    width: 99.7%;
  }
}
table .formTable{width:100%;border-collapse: collapse;z-index:-1}
table .formTable td{border: 1px  solid #000;height:30px;text-align:center;}
table .formTable table td{border: 0px  solid #000;height:30px;text-align:center;}
 
</style>
<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
</head>

<body>
<input type="hidden" id="token" value="${token}"/>
<input type="hidden" id="paramId" value="${param.id}"/>
<input type="hidden" id="type" value="index"/>
<div class="mod">
  <table width="70%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="6%" height="19" valign="middle"><div class="mod-icon"><img src="<%=basePath%>/images/main/tb.gif" width="14" height="14" /></div></td>
                  <td width="94%" valign="middle"><span class="STYLE1">督办模块设置</span></td>
                </tr>
              </table></td>
            </tr>
          </table></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td>
      <table class="formTable">
   	<tr>
   		<td width="15%">模块名称</td>
   		<td width="35%"><input type="text" name="paramName" id="paramName" style="width:98%"/></td>
   		<td width="15%">显示序号</td>
   		<td width="35%">
   		<input type="text" name="order" id="order" style="width:98%"/>
   		</td>
   	</tr>
	<tr height="25">
	<td colspan="4" >
		<input type="button" value="保存" onclick="add()"/><input type="button" value="退回"/></td>
	</tr>
	</table>
	</td>
	</tr>
   </table>
</div>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript" src="../js/param.js"></script>
</body>
</html>

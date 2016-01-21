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
 <link rel="stylesheet" type="text/css" href="../css/table.css" />
<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../js/jquery.form.js"></script>
 

</head>
<%
	String type=request.getParameter("type");
	Object obj = request.getParameter("role");
	int role = 3;
	if(null != obj){
		role = Integer.parseInt((String)obj);
	}
%>
<body>
<input type="hidden" id="editType" value="${param.type}"/>
<input type="hidden" id="token" value="${token}"/>
<div class="mod">
<form name="form2" id="form2" method="post" action="">
<input type="hidden" id="createId" name="id" value="${param.id}"/>
  <table width="70%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="6%" height="19" valign="middle"><div class="mod-icon"><img src="../images/main/tb.gif" width="14" height="14" /></div></td>
                  <td width="94%" valign="middle"><span class="STYLE1"> 督办单</span></td>
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
   		<td width="20%">代表姓名</td>
   		<td ><input type="text" class="txtInput" name="dbxm" id="dbxm"/></td>
   	</tr>
   	<tr height="60">
   		<td>主要内容</td>
   		<td align="left"><textarea rows="3" name="zynr" id="zynr"></textarea></td>
   	</tr>
   	<tr height="60">
   		<td>完成情况</td>
   		<td><textarea rows="3" name="wcqk" id="wcpk"></textarea></td>
   	</tr>
   	<tr>
   		<td>主管领导</td>
   		<td><input type="text" class="txtInput" name="zgld" id="zgld"/></td>
   	</tr>
   	<tr>
   		<td>承办单位</td>
   		<td><select style="float:left" name="cbdw" id="cbdw">
   
   		</select></td>
   	</tr>
   	<tr height="25">
   		<td>承办人</td>
   		<td><input type="text" class="txtInput" name="cbr" id="cbr"/></td>
   	</tr>
   	<tr height="25">
   		<td>审批情况</td>
   		<td ><select style="float:left" name="spqk" id="spqk">
   		<option value="1">未处理</option>
		<option value="2">主管审批通过</option>
		<option value="3">主管退回</option>
		<option value="4">县长审批通过</option>
		<option value="5">县长退回</option>
   		</select></td>
   	</tr>
   	<tr height="25">
   		<td>所属模块</td>
   		<td ><select style="float:left" name="ssmk" id="ssmk">
   
   		</select></td>
   	</tr>

	<tr height="25">
	<td colspan="4" >
		<input type="button" value="保存" onclick="add()"/><input type="button" value="取消"/></td>
	</tr>
	</table>
   </table>
   </form>
</div>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript" src="../js/duban_create.js"></script>
</body>
</html>

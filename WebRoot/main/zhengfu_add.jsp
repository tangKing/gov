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
	Object obj = request.getSession().getAttribute("role");
	int role = 3;
	if(null != obj){
		role = Integer.parseInt((String)obj);
	}
%>
<body>
<input type="hidden" id="editType" value="${param.type}"/>
<input type="hidden" id="token" value="${token}"/>
<input type="hidden" id="token" value="${token}"/>
<div class="mod">
<form name="form1" id="form1" method="post" action="">
<input type="hidden" id="zhengfuId" name="id" value="${param.id}"/>
  <table width="70%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="6%" height="19" valign="middle"><div class="mod-icon"><img src="../images/main/tb.gif" width="14" height="14" /></div></td>
                  <td width="94%" valign="middle"><span class="STYLE1">嫩江县人民政府办公室发文</span></td>
                </tr>
              </table></td>
            </tr>
          </table></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td>
	  <br/>
	  嫩政<span>[</span><input type="text" id="zfbh" name="zfbh" class="txtInput" style="width:50px;"/><span>]</span>号
	  <span style="float:right">机密程度：<input type="text" id="jmcd" name="jmcd" class="txtInput" style="width:15px;"/></span>
      <table class="formTable">
	  <tr height="60">
   		<td>县长、常务副县长签发</td>
   		<td colspan="5" ><textarea rows="3" name="xzqf" id="xzqf"></textarea></td>
   	</tr>
   	<tr>
   		<td>主管副县长<br>意见</td>
   		<td colspan="2"><input type="text" name="fxzyj" id="fxzyj" class="txtInput"/>
   		</td>
   		<td>办公室副主任意见</td>
   		<td colspan="2"><input type="text" name="fzryj"  id="fzryj" class="txtInput"/>
   		</td>
   	</tr>
	<tr>
   		<td rowspan="2">拟办单位</td>
   		<td rowspan="2"><textarea rows="3" name="nbdw"  id="nbdw"></textarea></td>
   		<td >拟办人</td>
   		<td ><input type="text"   id="nbr" name="nbr" class="txtInput"/>
   		</td>
		<td rowspan="2">办公室<br>核稿人</td>
   		<td rowspan="2"><input type="text" id="bgshgr" name="bgshgr" class="txtInput"/></td>
   	</tr>
	<tr>
   	
   		<td width="10%">核稿人</td>
   		<td width="25%"><input type="text" id="hgr" name="hgr" class="txtInput"/></textarea>
   		</td>
   	</tr>
   	<tr>
   		<td width="10%">印制份数</td>
   		<td width="25%"><textarea rows="3" id="yzfs" name="yzfs"></textarea></td>
   		<td width="10%">打&nbsp;字&nbsp;人<br>或<br>微机操作人</td>
   		<td width="25%"><textarea rows="3" name="dzr" id="dzr"></textarea></td>
		<td width="10%">校对<br>责任人</td>
   		<td><textarea rows="3" name="xdfzr" id="xdfzr"></textarea></td>
   	</tr>
   	<tr height="60">
   		<td>主送</td>
   		<td colspan="5" ><textarea rows="3" name="zs" id="zs"></textarea></td>
   	</tr>
   	<tr height="60">
   		<td>抄送</td>
   		<td colspan="5" ><textarea rows="3" name="cs" id="cs"></textarea></td>
   	</tr>
   	<tr height="60">
   		<td>文件<br/>标题</td>
   		<td colspan="5" ><textarea rows="3" name="wzbt"  id="wzbt"></textarea></td>
   	</tr>
   	<%
   		if(null == type || type.equals("")){
   	%>
   	<tr height="25">
	<td colspan="6" >
		<input type="button" onclick="add()" value="保存"/><input type="button" value="返回" onclick="javascript:history.go(-1)"/></td>
	</tr>
   	<%		
   		}
   	%>
   	
   </table>
   </form>
</div>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript" src="../js/zhengfu_add.js"></script>

</body>
</html>

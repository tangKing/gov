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
<link rel="stylesheet" type="text/css" href="../css/list.css" />
<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
</head>
<script>
var  highlightcolor='#d5f4fe';
//此处clickcolor只能用win系统颜色代码才能成功,如果用#xxxxxx的代码就不行,还没搞清楚为什么:(
var  clickcolor='#51b2f6';
function  changeto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=highlightcolor&&source.id!="nc"&&cs[1].style.backgroundColor!=clickcolor)
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=highlightcolor;
}
}

function  changeback(){
if  (event.fromElement.contains(event.toElement)||source.contains(event.toElement)||source.id=="nc")
return
if  (event.toElement!=source&&cs[1].style.backgroundColor!=clickcolor)
//source.style.backgroundColor=originalcolor
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}

function  clickto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=clickcolor&&source.id!="nc")
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=clickcolor;
}
else
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}
</script>
<%
	Object obj = request.getSession().getAttribute("role");
	int role = 0;
	if(null != obj){
		role = Integer.parseInt((String)obj);
	}
%>
<body>
<input type="hidden" id="depId" value="${dep_id}"/>
<input type="hidden" id="role" value="${role}" />
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="6%" height="19" valign="bottom"><div align="center"><img src="../images/main/tb.gif" width="14" height="14" /></div></td>
                <td width="94%" valign="bottom"><span class="STYLE1"> 审核督办通知单</span></td>
              </tr>
            </table></td>
            <td><div align="right"><span class="STYLE1">
              <a onclick="SelectAll()"><input type="checkbox" name="checkbox11" id="checkbox11" />
              全选      &nbsp;&nbsp;</a>
              <%
              	if(role != 1){
              %>
              	<a onclick="updateStatus('shen')">
              		<img src="../images/main/add.gif" width="10" height="10" /> 审核   &nbsp;
              	</a> 
              <%		
              	}
              %>
			 <%
              	if(role == 1){
              %>              
             <!-- <a onclick="updateStatus('edit')"> 
             <img src="../images/main/del.gif" width="10" height="10" onclick="updateStatus(2)"/> 修改  &nbsp;&nbsp;
             </a>  -->
             <%}%>
             <a onclick="show()"> 
              <img src="../images/main/edit.gif" width="10" height="10" /> 查看   &nbsp;
              </a>
              </span><span class="STYLE1"> &nbsp;</span></div></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0"  cellpadding="0" cellspacing="1" bgcolor="#a8c7ce">
      <tr>
        <td width="4%" height="40" bgcolor="d3eaef" class="STYLE10"><div align="center">
         
        </div></td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">督办类别</span></div></td>
        <td width="15%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">发件部门</span></div></td>
        <td width="14%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">收件日期</span></div></td>
        <td width="16%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">承办单位</span></div></td>
        <td width="14%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">督办内容概要</span></div></td>
        <td width="14%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">办理要求概要</span></div></td>
		<td width="13%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">处理状态</span></div></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="30">  
    <table  id="listTable" width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" onmouseover="changeto()"  onmouseout="changeback()" style="text-align:center">
      
    </table></td>
  </tr>
   <jsp:include page="../system/page.jsp" />
</table>
</body>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript" src="../js/duban_list.js"></script>
</html>

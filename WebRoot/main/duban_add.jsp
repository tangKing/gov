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
<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script> 
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
<div class="mod">
<input type="hidden" id="editType" value="${param.type}"/>
<input type="hidden" id="token" value="${token}"/>
<form name="form1" id="form1" method="post" action="">
  <table width="70%" border="0" align="center" cellpadding="0" cellspacing="0">
  <input type="hidden" id="token" value="${token}"/>
  <input type="hidden" id="dubanId" name="id" value="${param.id}"/>
  <input type="hidden" name="dep_id" value="${dep_id}"/>
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="6%" height="19" valign="middle"><div class="mod-icon"><img src="<%=basePath%>/images/main/tb.gif" width="14" height="14" /></div></td>
                  <td width="94%" valign="middle"><span class="STYLE1"> 督办通知单</span></td>
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
   		<td width="15%">督办类别</td>
   		<td width="35%"><select id="type" name="type" class="txtInput" ></select></td>
   		<td width="15%">收件日期</td>
   		<td width="35%"><input type="text" id="pickTime" name="pickTime" class="txtInput" onClick="WdatePicker()" readonly="readonly"/></td>
   	</tr>
   	<tr>
   		<td>发件部门</td>
   		<td><input type="hidden" class="txtInput" name="sendDepart" id="sendDepart" value="${dep_id}"/>
   		<span style="float:left;padding-left:5px;font-size:12px;">${depName}</span>
   		</td>
   		<td>承办单位</td>
   		<td><select name="takeDepart" id="takeDepart" class="txtInput" ></select></td>
   	</tr>
   	<tr height="60">
   		<td>督办内容<br/>概要</td>
   		<td colspan="3" ><textarea rows="3" name="outline" id="outline" ></textarea></td>
   	</tr>
   	<tr height="60">
   		<td>办&nbsp;公&nbsp;室<br/>拟办意见</td>
   		<td colspan="3" ><textarea rows="3" name="OfficeSuggestion" id="OfficeSuggestion"></textarea></td>
   	</tr>
   	<tr height="60">
   		<td>分管县长<br/>批&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;示</td>
   		<td colspan="3" ><textarea rows="3" name="instructions" id="instructions"></textarea></td>
   	</tr>
   	<tr>
   		<td>办理时限</td>
   		<td><input type="text" class="txtInput" name="processTime" id="processTime"/></td>
   		<td>(月)反馈</td>
   		<td><input type="text" class="txtInput" name="feedback" id="feedback"/></td>
   	</tr>
   	<tr height="60">
   		<td>办理要求<br/>概要</td>
   		<td colspan="3" ><textarea rows="3" name="handleAsk" id="handleAsk"></textarea></td>
   	</tr>
   	<tr height="60">
   		<td>承办单位<br/>领导签字</td>
   		<td colspan="3" >
   		<%if(role != 1){
   		%>
   		<textarea rows="3" name="leaderSign" id="leaderSign"></textarea>
   		<%
   		} %>
   		
   		<img src="../images/main/111.png" alt="" width="150" id="zhuguanImg1" style="display:none"/>
   		<img src="../images/main/222.png" alt="" width="150" id="zhuguanImg2" style="display:none"/>
   		<%
   			if(null!= type && type.equals("shen") && role == 2){
   		%>
   			<input type="button" value="通过" id="zhuguanBtn" onclick="zhuguanUpdate()" style="display:none"/>
   			<input type="button" value="退回" id="zhuguanBtn2" onclick="zhuguanBack()" style="display:none"/>
   		<%		
   			}
   		%>
   		</td>
   	</tr>
   	<tr height="60">
   		<td>分管&nbsp;&nbsp;县长<br/>对办理结果<br/>意见</td>
   		<td colspan="3" >
   		<%if(role != 1){
   		%>
   		<textarea rows="3" name="resultSuggestion" id="resultSuggestion"></textarea>
   		<%
   		} %>
   		
   		<img src="../images/main/111.png" alt="" width="150" id="xianzhangImg1" style="display:none"/>
   		<img src="../images/main/222.png" alt="" width="150" id="xianzhangImg2" style="display:none"/>
   		<%
   			if(null!= type && type.equals("shen") && role == 3){
   		%>
   			<input type="button" value="通过" id="xianzhangBtn" onclick="xianzhangUpdate()" style="display:none"/>
   			<input type="button" value="退回" id="xianzhangBtn2" onclick="xianzhangBack()" style="display:none"/>
   		<%		
   			}
   		%>
   		</td>
   	</tr>
		<tr height="25">
   		<td colspan="4" >
   			<table width="100%" border="0" height="100%">
   				<tr>
   					<td style="border-right:1px solid #000">
   						电话：0456-7524998
   					</td>
   					<td style="border-right:1px solid #000">
   						邮箱：njxdcs@163.com
   					</td>
   					<td>
   						地址：政府办公楼709
   					</td>
   				</tr>
   			</table>
   		</td>
   	</tr>
   	
	<tr height="25">
	<td colspan="4" >
	<%
   		if(null!= type && type.equals("show")){
   	%>
   		<input type="button" value="返回" onclick="javascript:history.back(-1);"/>
   	<%		
   		}else if(null!= type && type.equals("shen")){
   	%>
   		
   	<%		
   		}else{
   	%>		
   			<input type="button" onclick="add()" value="保存"/>
   	<%
   		}
   	%></td>
	</tr>
   </table>
   </form>
</div>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript" src="../js/duban_add.js"></script>
</body>
</html>

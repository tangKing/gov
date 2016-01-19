<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="33%"><div align="left"><span class="STYLE22">&nbsp;&nbsp;&nbsp;&nbsp;
        共有<strong id="totalNum"> 1</strong> 条记录，
        当前第<strong id="pageNo"> 1</strong> 页，
        共 <strong id="pageSize">10</strong> 页</span></div>
        <input type="hidden" id="preNum" /><input type="hidden" id="nextNum" /><input type="hidden" id="totalPage" />
        </td>
        <td width="67%"><table width="312" border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td width="49"><div align="center">
            <img src="../images/main/main_54.gif" width="40" height="15" onclick="goFirst()"/></div></td>
            <td width="49"><div align="center">
            <img src="../images/main/main_56.gif" width="45" height="15" onclick="goPre()"/></div></td>
            <td width="49"><div align="center">
            <img src="../images/main/main_58.gif" width="45" height="15" onclick="goNext()"/></div></td>
            <td width="49"><div align="center">
            <img src="../images/main/main_60.gif" width="40" height="15" onclick="goDown()"/></div></td>
            <td width="37" class="STYLE22"><div align="center"></div></td>
            <td width="22"><div align="center">
            </div></td>
            <td width="22" class="STYLE22"><div align="center"></div></td>
            <td width="35"></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
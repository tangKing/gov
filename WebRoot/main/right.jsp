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
  font-size: 12px;
}
.STYLE6 {color: #000000; font-size: 12; }
.STYLE10 {color: #000000; font-size: 12px; }
.STYLE19 {
  color: #344b50;
  font-size: 12px;
}
.STYLE21 {
  font-size: 12px;
  color: #3b6375;
}
.STYLE22 {
  font-size: 12px;
  color: #295568;
}
.mod {
  width: 49.5%;
  display: inline-block;
  font-size: 12px;
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
  position:relative;
}
.bd_span{
float:left;color:#000;position:absolute;bottom:0px;
}

a {
  color: #333;
  text-decoration: none;
}
a:hover {
  color: #e1e2e3;
  text-decoration: none;
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

/* @media screen and (min-width: 1200px) {
  .mod {
    width: 49.7%;
  }
}
@media screen and (max-width: 1200px) {
  .mod {
    width: 49.7%;
  }
}
@media screen and (max-width: 800px) {
  .mod {
    width: 99.7%;
  }
} */
</style>
<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>

</head>

<body>
<div class="mod" id="tab">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="6%" height="19" valign="middle"><div class="mod-icon"><img src="../images/main/tb.gif" width="14" height="14" /></div></td>
                  <td width="94%" valign="middle">
				  <span class="STYLE1" id="paramName0"> 人大代表建议1
				  </span>
				  
				  </td>
                </tr>
              </table></td>
			
              <td><div class="mod-right"><span class="STYLE1"><input type="hidden" id="paramId0"/>
              <a  style="text-decoration: none;" onclick="showmore(0)">
              <span class="STYLE1">更多 ...</span>
              </a></span></div></td>
            </tr>
          </table></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td>
        <div class="bd-c">
          <div class="list list-icon list-icon-1">
            <ul id="contentUL0">
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >人大代表建议</a>
              </li>
			  <span class="bd_span">
             <img src="../images/main/file.gif" width="14" height="14" style="top:10px;"/>
             <a  style="text-decoration: none;" onclick="showNO(0)">未按时上报</a>|
				  <img src="../images/main/file.gif" width="14" height="14" />
				  <a   style="text-decoration: none;" onclick="showBack(0)">退回</a>&nbsp;&nbsp;
				  <font id="showDept0">单位一，单位二</font>
				  <b id="noBack0" style="display:none">单位一、单位二</b>
				  <b id="back0" style="display:none">单位三、单位四</b>
			</span>
            </ul>
          </div>
        </div>
      </td>
    </tr>
  </table>
</div>

<div class="mod">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="6%" height="19" valign="middle"><div class="mod-icon"><img src="../images/main/tb.gif" width="14" height="14" /></div></td>
                  <td width="94%" valign="middle"><span class="STYLE1" id="paramName1">政协委员提案</span></td>
                </tr>
              </table></td>
              <td><div class="mod-right"><span class="STYLE1"><input type="hidden" id="paramId1"/>
              <a  style="text-decoration: none;" onclick="showmore(1)">
              <span class="STYLE1">更多 ...</span>
              </a></span></div></td>
            </tr>
          </table></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td>
        <div class="bd-c">
          <div class="list list-icon list-icon-2">
            <ul id="contentUL1">
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >政协委员提案</a>
              </li>
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >政协委员提案1</a>
              </li>
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >政协委员提案</a>
              </li>
              <span class="bd_span">
             <img src="../images/main/file.gif" width="14" height="14" style="top:10px;"/>
             <a  style="text-decoration: none;" onclick="showNO(1)">未按时上报</a>|
				  <img src="../images/main/file.gif" width="14" height="14" />
				  <a   style="text-decoration: none;" onclick="showBack(1)">退回</a>&nbsp;&nbsp;
				  <font id="showDept1">单位一，单位二</font>
				  <b id="noBack1" style="display:none">单位一、单位二</b>
				  <b id="back1" style="display:none">单位三、单位四</b>
			</span>
            </ul>
          </div>
        </div>
      </td>
    </tr>
  </table>
</div>

<div class="mod">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="6%" height="19" valign="middle"><div class="mod-icon"><img src="../images/main/tb.gif" width="14" height="14" /></div></td>
                  <td width="94%" valign="middle"><span class="STYLE1" id="paramName2">县政府工作报告分解
				  
				  </span></td>
                </tr>
              </table></td>
              <td><div class="mod-right"><span class="STYLE1"><input type="hidden" id="paramId2"/>
              <a  style="text-decoration: none;" onclick="showmore(2)">
              <span class="STYLE1">更多 ...</span>
              </a></span></div></td>
            </tr>
          </table></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td>
        <div class="bd-c">
          <div class="list list-icon list-icon-3">
            <ul  id="contentUL2">
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >县政府工作报告分解</a>
              </li>
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >县政府工作报告分解</a>
              </li>
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >县政府工作报告分解</a>
              </li>
              <span class="bd_span">
             <img src="../images/main/file.gif" width="14" height="14" style="top:10px;"/>
             <a  style="text-decoration: none;" onclick="showNO(2)">未按时上报</a>|
				  <img src="../images/main/file.gif" width="14" height="14" />
				  <a   style="text-decoration: none;" onclick="showBack(2)">退回</a>&nbsp;&nbsp;
				  <font id="showDept2">单位一，单位二</font>
				  <b id="noBack2" style="display:none">单位一、单位二</b>
				  <b id="back2" style="display:none">单位三、单位四</b>
			</span>
            </ul>
          </div>
        </div>
      </td>
    </tr>
  </table>
</div>

<div class="mod">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="6%" height="19" valign="middle"><div class="mod-icon"><img src="../images/main/tb.gif" width="14" height="14" /></div></td>
                  <td width="94%" valign="middle"><span class="STYLE1" id="paramName3">重点项目
				  
				  </span></td>
                </tr>
              </table></td>
              <td><div class="mod-right"><span class="STYLE1"><input type="hidden" id="paramId3"/>
              <a  style="text-decoration: none;" onclick="showmore(3)">
              <span class="STYLE1">更多 ...</span></a></div></td>
            </tr>
          </table></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td>
        <div class="bd-c">
          <div class="list list-icon list-icon-4">
            <ul  id="contentUL3">
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >重点项目示例1</a>
              </li>
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >重点项目示例1</a>
              </li>
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >重点项目示例1</a>
              </li>
			  <span class="bd_span">
             <img src="../images/main/file.gif" width="14" height="14" style="top:10px;"/>
             <a  style="text-decoration: none;" onclick="showNO(3)">未按时上报</a>|
				  <img src="../images/main/file.gif" width="14" height="14" />
				  <a   style="text-decoration: none;" onclick="showBack(3)">退回</a>&nbsp;&nbsp;
				  <font id="showDept3">单位一，单位二</font>
				  <b id="noBack03" style="display:none">单位一、单位二</b>
				  <b id="back3" style="display:none">单位三、单位四</b>
			</span>
            </ul>
          </div>
        </div>
      </td>
    </tr>
  </table>
</div>

<div class="mod">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="6%" height="19" valign="middle"><div class="mod-icon"><img src="../images/main/tb.gif" width="14" height="14" /></div></td>
                  <td width="94%" valign="middle"><span class="STYLE1" id="paramName4">招商引资
				  
				  </span></td>
                </tr>
              </table></td>
              <td><div class="mod-right"><span class="STYLE1"><input type="hidden" id="paramId4"/>
              <a  style="text-decoration: none;" onclick="showmore(4)">
              <span class="STYLE1">更多 ...</span></a></span></div></td>
            </tr>
          </table></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td>
        <div class="bd-c">
          <div class="list list-icon list-icon-5">
            <ul  id="contentUL4">
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >招商引资示例1</a>
              </li>
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >招商引资示例1</a>
              </li>
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >招商引资示例1</a>
              </li>
			  <span class="bd_span">
             <img src="../images/main/file.gif" width="14" height="14" style="top:10px;"/>
             <a  style="text-decoration: none;" onclick="showNO(4)">未按时上报</a>|
				  <img src="../images/main/file.gif" width="14" height="14" />
				  <a   style="text-decoration: none;" onclick="showBack(4)">退回</a>&nbsp;&nbsp;
				  <font id="showDept4">单位一，单位二</font>
				  <b id="noBack4" style="display:none">单位一、单位二</b>
				  <b id="back4" style="display:none">单位三、单位四</b>
			</span>
            </ul>
          </div>
        </div>
      </td>
    </tr>
  </table>
</div>

<div class="mod">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="6%" height="19" valign="middle"><div class="mod-icon"><img src="../images/main/tb.gif" width="14" height="14" /></div></td>
                  <td width="94%" valign="middle"><span class="STYLE1" id="paramName5">向上争取</span></td>
                </tr>
              </table></td>
              <td><div class="mod-right"><span class="STYLE1"><input type="hidden" id="paramId5"/>
              <a  style="text-decoration: none;" onclick="showmore(5)">
              <span class="STYLE1">更多 ...</span></a></span></div></td>
            </tr>
          </table></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td>
        <div class="bd-c">
          <div class="list list-icon list-icon-6">
            <ul id="contentUL5">
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >向上争取示例1</a>
              </li>
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >向上争取示例1</a>
              </li>
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >向上争取示例1</a>
              </li>
			  <span class="bd_span">
             <img src="../images/main/file.gif" width="14" height="14" style="top:10px;"/>
             <a  style="text-decoration: none;" onclick="showNO(5)">未按时上报</a>|
				  <img src="../images/main/file.gif" width="14" height="14" />
				  <a   style="text-decoration: none;" onclick="showBack(5)">退回</a>&nbsp;&nbsp;
				  <font id="showDept5">单位一，单位二</font>
				  <b id="noBack5" style="display:none">单位一、单位二</b>
				  <b id="back5" style="display:none">单位三、单位四</b>
			</span>
            </ul>
          </div>
        </div>
      </td>
    </tr>
  </table>
</div>

<div class="mod">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="6%" height="19" valign="middle"><div class="mod-icon"><img src="../images/main/tb.gif" width="14" height="14" /></div></td>
                  <td width="94%" valign="middle"><span class="STYLE1" id="paramName6">市惠民实事
				
				  </span></td>
                </tr>
              </table></td>
              <td><div class="mod-right">
              <input type="hidden" id="paramId6"/>
              <a  style="text-decoration: none;" onclick="showmore(6)">
              <span class="STYLE1">更多 ...</span>
              </a>
              </div></td>
            </tr>
          </table></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td>
        <div class="bd-c">
          <div class="list list-icon list-icon-7">
            <ul id="contentUL6">
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >市惠民实事示例1</a>
              </li>
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >市惠民实事示例1</a>
              </li>
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >市惠民实事示例1</a>
              </li>
			  <span class="bd_span">
             <img src="../images/main/file.gif" width="14" height="14" style="top:10px;"/>
             <a  style="text-decoration: none;" onclick="showNO(6)">未按时上报</a>|
				  <img src="../images/main/file.gif" width="14" height="14" />
				  <a   style="text-decoration: none;" onclick="showBack(6)">退回</a>&nbsp;&nbsp;
				  <font id="showDept6">单位一，单位二</font>
				  <b id="noBack6" style="display:none">单位一、单位二</b>
				  <b id="back6" style="display:none">单位三、单位四</b>
			</span>
            </ul>
          </div>
        </div>
      </td>
    </tr>
  </table>
</div>

<div class="mod">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="6%" height="19" valign="middle"><div class="mod-icon"><img src="../images/main/tb.gif" width="14" height="14" /></div></td>
                  <td width="94%" valign="middle"><span class="STYLE1" id="paramName7">全县绩效考核
				
				  </span></td>
                </tr>
              </table></td>
              <td><div class="mod-right"><span class="STYLE1"><input type="hidden" id="paramId7"/>
              <a  style="text-decoration: none;" onclick="showmore(7)">
              <span class="STYLE1">更多 ...</span>
              </a></span></div></td>
            </tr>
          </table></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td>
        <div class="bd-c">
          <div class="list list-icon list-icon-2">
            <ul id="contentUL7">
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >全县绩效考核示例1</a>
              </li>
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >全县绩效考核示例1</a>
              </li>
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >全县绩效考核示例1</a>
              </li>
			  <span class="bd_span">
             <img src="../images/main/file.gif" width="14" height="14" style="top:10px;"/>
             <a  style="text-decoration: none;" onclick="showNO(7)">未按时上报</a>|
				  <img src="../images/main/file.gif" width="14" height="14" />
				  <a   style="text-decoration: none;" onclick="showBack(7)">退回</a>&nbsp;&nbsp;
				  <font id="showDept7">单位一，单位二</font>
				  <b id="noBack7" style="display:none">单位一、单位二</b>
				  <b id="back7" style="display:none">单位三、单位四</b>
			</span>
            </ul>
          </div>
        </div>
      </td>
    </tr>
  </table>
</div>

<!-- 剩余的模块 -->
<div class="mod" style="display:none" id="modul8">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="6%" height="19" valign="middle"><div class="mod-icon"><img src="../images/main/tb.gif" width="14" height="14" /></div></td>
                  <td width="94%" valign="middle"><span class="STYLE1" id="paramName8">全县绩效考核
				
				  </span></td>
                </tr>
              </table></td>
              <td><div class="mod-right"><span class="STYLE1"><input type="hidden" id="paramId8"/>
              <a  style="text-decoration: none;" onclick="showmore(8)">
              <span class="STYLE1">更多 ...</span>
              </a></span></div></td>
            </tr>
          </table></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td>
        <div class="bd-c">
          <div class="list list-icon list-icon-2">
            <ul id="contentUL7">
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >全县绩效考核示例1</a>
              </li>
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >全县绩效考核示例1</a>
              </li>
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >全县绩效考核示例1</a>
              </li>
			  <span class="bd_span">
             <img src="../images/main/file.gif" width="14" height="14" style="top:10px;"/>
             <a  style="text-decoration: none;" onclick="showNO(8)">未按时上报</a>|
				  <img src="../images/main/file.gif" width="14" height="14" />
				  <a   style="text-decoration: none;" onclick="showBack(8)">退回</a>&nbsp;&nbsp;
				  <font id="showDept8">单位一，单位二</font>
				  <b id="noBack8" style="display:none">单位一、单位二</b>
				  <b id="back8" style="display:none">单位三、单位四</b>
			</span>
            </ul>
          </div>
        </div>
      </td>
    </tr>
  </table>
</div>
<div class="mod" style="display:none" id="modul9">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="6%" height="19" valign="middle"><div class="mod-icon"><img src="../images/main/tb.gif" width="14" height="14" /></div></td>
                  <td width="94%" valign="middle"><span class="STYLE1" id="paramName9">全县绩效考核
				
				  </span></td>
                </tr>
              </table></td>
              <td><div class="mod-right"><span class="STYLE1"><input type="hidden" id="paramId9"/>
              <a  style="text-decoration: none;" onclick="showmore(9)">
              <span class="STYLE1">更多 ...</span>
              </a></span></div></td>
            </tr>
          </table></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td>
        <div class="bd-c">
          <div class="list list-icon list-icon-2">
            <ul id="contentUL7">
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >全县绩效考核示例1</a>
              </li>
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >全县绩效考核示例1</a>
              </li>
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >全县绩效考核示例1</a>
              </li>
			  <span class="bd_span">
             <img src="../images/main/file.gif" width="14" height="14" style="top:10px;"/>
             <a  style="text-decoration: none;" onclick="showNO(9)">未按时上报</a>|
				  <img src="../images/main/file.gif" width="14" height="14" />
				  <a   style="text-decoration: none;" onclick="showBack(9)">退回</a>&nbsp;&nbsp;
				  <font id="showDept9">单位一，单位二</font>
				  <b id="noBack9" style="display:none">单位一、单位二</b>
				  <b id="back9" style="display:none">单位三、单位四</b>
			</span>
            </ul>
          </div>
        </div>
      </td>
    </tr>
  </table>
</div>
<div class="mod" style="display:none" id="modul10">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="6%" height="19" valign="middle"><div class="mod-icon"><img src="../images/main/tb.gif" width="14" height="14" /></div></td>
                  <td width="94%" valign="middle"><span class="STYLE1" id="paramName10">全县绩效考核
				
				  </span></td>
                </tr>
              </table></td>
              <td><div class="mod-right"><span class="STYLE1"><input type="hidden" id="paramId10"/>
              <a  style="text-decoration: none;" onclick="showmore(10)">
              <span class="STYLE1">更多 ...</span>
              </a></span></div></td>
            </tr>
          </table></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td>
        <div class="bd-c">
          <div class="list list-icon list-icon-2">
            <ul id="contentUL7">
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >全县绩效考核示例1</a>
              </li>
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >全县绩效考核示例1</a>
              </li>
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >全县绩效考核示例1</a>
              </li>
			  <span class="bd_span">
             <img src="../images/main/file.gif" width="14" height="14" style="top:10px;"/>
             <a  style="text-decoration: none;" onclick="showNO(10)">未按时上报</a>|
				  <img src="../images/main/file.gif" width="14" height="14" />
				  <a   style="text-decoration: none;" onclick="showBack(10)">退回</a>&nbsp;&nbsp;
				  <font id="showDept10">单位一，单位二</font>
				  <b id="noBack10" style="display:none">单位一、单位二</b>
				  <b id="back10" style="display:none">单位三、单位四</b>
			</span>
            </ul>
          </div>
        </div>
      </td>
    </tr>
  </table>
</div>
<div class="mod" style="display:none" id="modul11">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="6%" height="19" valign="middle"><div class="mod-icon"><img src="../images/main/tb.gif" width="14" height="14" /></div></td>
                  <td width="94%" valign="middle"><span class="STYLE1" id="paramName11">全县绩效考核
				
				  </span></td>
                </tr>
              </table></td>
              <td><div class="mod-right"><span class="STYLE1"><input type="hidden" id="paramId11"/>
              <a  style="text-decoration: none;" onclick="showmore(11)">
              <span class="STYLE1">更多 ...</span>
              </a></span></div></td>
            </tr>
          </table></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td>
        <div class="bd-c">
          <div class="list list-icon list-icon-2">
            <ul id="contentUL7">
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >全县绩效考核示例1</a>
              </li>
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >全县绩效考核示例1</a>
              </li>
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >全县绩效考核示例1</a>
              </li>
			  <span class="bd_span">
             <img src="../images/main/file.gif" width="14" height="14" style="top:10px;"/>
             <a  style="text-decoration: none;" onclick="showNO(11)">未按时上报</a>|
				  <img src="../images/main/file.gif" width="14" height="14" />
				  <a   style="text-decoration: none;" onclick="showBack(11)">退回</a>&nbsp;&nbsp;
				  <font id="showDept11">单位一，单位二</font>
				  <b id="noBack11" style="display:none">单位一、单位二</b>
				  <b id="back11" style="display:none">单位三、单位四</b>
			</span>
            </ul>
          </div>
        </div>
      </td>
    </tr>
  </table>
</div>
<div class="mod" style="display:none" id="modul12">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="6%" height="19" valign="middle"><div class="mod-icon"><img src="../images/main/tb.gif" width="14" height="14" /></div></td>
                  <td width="94%" valign="middle"><span class="STYLE1" id="paramName12">全县绩效考核
				
				  </span></td>
                </tr>
              </table></td>
              <td><div class="mod-right"><span class="STYLE1"><input type="hidden" id="paramId12"/>
              <a  style="text-decoration: none;" onclick="showmore(12)">
              <span class="STYLE1">更多 ...</span>
              </a></span></div></td>
            </tr>
          </table></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td>
        <div class="bd-c">
          <div class="list list-icon list-icon-2">
            <ul id="contentUL7">
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >全县绩效考核示例1</a>
              </li>
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >全县绩效考核示例1</a>
              </li>
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >全县绩效考核示例1</a>
              </li>
			  <span class="bd_span">
             <img src="../images/main/file.gif" width="14" height="14" style="top:10px;"/>
             <a  style="text-decoration: none;" onclick="showNO(12)">未按时上报</a>|
				  <img src="../images/main/file.gif" width="14" height="14" />
				  <a   style="text-decoration: none;" onclick="showBack(12)">退回</a>&nbsp;&nbsp;
				  <font id="showDept12">单位一，单位二</font>
				  <b id="noBack12" style="display:none">单位一、单位二</b>
				  <b id="back12" style="display:none">单位三、单位四</b>
			</span>
            </ul>
          </div>
        </div>
      </td>
    </tr>
  </table>
</div>
<div class="mod" style="display:none" id="modul13">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="6%" height="19" valign="middle"><div class="mod-icon"><img src="../images/main/tb.gif" width="14" height="14" /></div></td>
                  <td width="94%" valign="middle"><span class="STYLE1" id="paramName13">全县绩效考核
				
				  </span></td>
                </tr>
              </table></td>
              <td><div class="mod-right"><span class="STYLE1"><input type="hidden" id="paramId13"/>
              <a  style="text-decoration: none;" onclick="showmore(13)">
              <span class="STYLE1">更多 ...</span>
              </a></span></div></td>
            </tr>
          </table></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td>
        <div class="bd-c">
          <div class="list list-icon list-icon-2">
            <ul id="contentUL7">
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >全县绩效考核示例1</a>
              </li>
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >全县绩效考核示例1</a>
              </li>
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >全县绩效考核示例1</a>
              </li>
			  <span class="bd_span">
             <img src="../images/main/file.gif" width="14" height="14" style="top:10px;"/>
             <a  style="text-decoration: none;" onclick="showNO(13)">未按时上报</a>|
				  <img src="../images/main/file.gif" width="14" height="14" />
				  <a   style="text-decoration: none;" onclick="showBack(13)">退回</a>&nbsp;&nbsp;
				  <font id="showDept13">单位一，单位二</font>
				  <b id="noBack13" style="display:none">单位一、单位二</b>
				  <b id="back13" style="display:none">单位三、单位四</b>
			</span>
            </ul>
          </div>
        </div>
      </td>
    </tr>
  </table>
</div>
<div class="mod" style="display:none" id="modul14">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="6%" height="19" valign="middle"><div class="mod-icon"><img src="../images/main/tb.gif" width="14" height="14" /></div></td>
                  <td width="94%" valign="middle"><span class="STYLE1" id="paramName14">全县绩效考核
				
				  </span></td>
                </tr>
              </table></td>
              <td><div class="mod-right"><span class="STYLE1"><input type="hidden" id="paramId14"/>
              <a  style="text-decoration: none;" onclick="showmore(14)">
              <span class="STYLE1">更多 ...</span>
              </a></span></div></td>
            </tr>
          </table></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td>
        <div class="bd-c">
          <div class="list list-icon list-icon-2">
            <ul id="contentUL7">
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >全县绩效考核示例1</a>
              </li>
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >全县绩效考核示例1</a>
              </li>
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >全县绩效考核示例1</a>
              </li>
			  <span class="bd_span">
             <img src="../images/main/file.gif" width="14" height="14" style="top:10px;"/>
             <a  style="text-decoration: none;" onclick="showNO(14)">未按时上报</a>|
				  <img src="../images/main/file.gif" width="14" height="14" />
				  <a   style="text-decoration: none;" onclick="showBack(14)">退回</a>&nbsp;&nbsp;
				  <font id="showDept14">单位一，单位二</font>
				  <b id="noBack14" style="display:none">单位一、单位二</b>
				  <b id="back14" style="display:none">单位三、单位四</b>
			</span>
            </ul>
          </div>
        </div>
      </td>
    </tr>
  </table>
</div>
<div class="mod" style="display:none" id="modul15">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="6%" height="19" valign="middle"><div class="mod-icon"><img src="../images/main/tb.gif" width="14" height="14" /></div></td>
                  <td width="94%" valign="middle"><span class="STYLE1" id="paramName15">全县绩效考核
				
				  </span></td>
                </tr>
              </table></td>
              <td><div class="mod-right"><span class="STYLE1"><input type="hidden" id="paramId15"/>
              <a  style="text-decoration: none;" onclick="showmore(15)">
              <span class="STYLE1">更多 ...</span>
              </a></span></div></td>
            </tr>
          </table></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td>
        <div class="bd-c">
          <div class="list list-icon list-icon-2">
            <ul id="contentUL7">
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >全县绩效考核示例1</a>
              </li>
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >全县绩效考核示例1</a>
              </li>
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >全县绩效考核示例1</a>
              </li>
			  <span class="bd_span">
             <img src="../images/main/file.gif" width="14" height="14" style="top:10px;"/>
             <a  style="text-decoration: none;" onclick="showNO(15)">未按时上报</a>|
				  <img src="../images/main/file.gif" width="14" height="14" />
				  <a   style="text-decoration: none;" onclick="showBack(15)">退回</a>&nbsp;&nbsp;
				  <font id="showDept15">单位一，单位二</font>
				  <b id="noBack15" style="display:none">单位一、单位二</b>
				  <b id="back15" style="display:none">单位三、单位四</b>
			</span>
            </ul>
          </div>
        </div>
      </td>
    </tr>
  </table>
</div>
<div class="mod" style="display:none" id="modul16">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="6%" height="19" valign="middle"><div class="mod-icon"><img src="../images/main/tb.gif" width="14" height="14" /></div></td>
                  <td width="94%" valign="middle"><span class="STYLE1" id="paramName16">全县绩效考核
				
				  </span></td>
                </tr>
              </table></td>
              <td><div class="mod-right"><span class="STYLE1"><input type="hidden" id="paramId16"/>
              <a  style="text-decoration: none;" onclick="showmore(16)">
              <span class="STYLE1">更多 ...</span>
              </a></span></div></td>
            </tr>
          </table></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td>
        <div class="bd-c">
          <div class="list list-icon list-icon-2">
            <ul id="contentUL7">
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >全县绩效考核示例1</a>
              </li>
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >全县绩效考核示例1</a>
              </li>
              <li>
                <span class="fr">嫩江嫩网行业政务事业部&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;2016-01-12</span>
                <a >全县绩效考核示例1</a>
              </li>
			  <span class="bd_span">
             <img src="../images/main/file.gif" width="14" height="14" style="top:10px;"/>
             <a  style="text-decoration: none;" onclick="showNO(16)">未按时上报</a>|
				  <img src="../images/main/file.gif" width="14" height="14" />
				  <a   style="text-decoration: none;" onclick="showBack(16)">退回</a>&nbsp;&nbsp;
				  <font id="showDept16">单位一，单位二</font>
				  <b id="noBack16" style="display:none">单位一、单位二</b>
				  <b id="back16" style="display:none">单位三、单位四</b>
			</span>
            </ul>
          </div>
        </div>
      </td>
    </tr>
  </table>
</div>
<div style="margin-left: auto;margin-right: auto;text-align: center;">
<input type="button" value="查看全部模块" onclick="showAll()" id="showBtn"/>

</div>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript" src="../js/mainWeb.js"></script>
</body>
</html>

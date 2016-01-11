<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page import="java.net.URLDecoder"%>
<%@ page contentType="text/html;charset=utf8"%>
<title>login</title>
<script type="text/javascript" src="/gov/dd/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/gov/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="/gov/js/highcharts.js"></script>
<script type="text/javascript" src="/gov/js/funnel.js"></script>
<script type="text/javascript" src="/gov/js/highcharts-more.js"></script>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" /> 
<script type="text/javascript">
	function login() {
	var username= $("#username").val();
	 var pwd=   $("#pwd").val();
	   $.getJSON("http://127.0.0.1:7081/login?m=login&username="+username+"&pwd="+pwd+"&callback=?", function(json){ 
        var code = json.code;
        if(code!=200){
        alert("用户名或密码错误");
        }else{
         var token = json.token;
         $("#token").attr("value",token);
         alert(token);
        }
      });
	}
	function regdit() {
	var username= $("#regusername").val();
	 var pwd=   $("#regpwd").val();
	   $.getJSON("http://127.0.0.1:7081/login?m=regdit&username="+username+"&pwd="+pwd+"&callback=?", function(json){ 
	  var code = json.code;
	    if(code==200){
	       var token = json.token;
           $("#token").attr("value",token);
	         var msg = json.msg;
	         alert(msg);
        }else{
           var msg = json.msg;
           alert(msg);
        }
      });
	}
</script>
</head>

<body>
     <input type="text" id="token" value="">
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
</html>
</span>

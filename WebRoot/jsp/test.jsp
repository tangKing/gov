<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page import="java.net.URLDecoder"%>
<%@ page contentType="text/html;charset=utf8"%>
<title>test</title>
<script type="text/javascript" src="/gov/dd/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/gov/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="/gov/js/highcharts.js"></script>
<script type="text/javascript" src="/gov/js/funnel.js"></script>
<script type="text/javascript" src="/gov/js/highcharts-more.js"></script>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" /> 
<script type="text/javascript">
	function getOne(id) {
	   $.getJSON("http://127.0.0.1:7081/test?m=getOne&id="+id+"&callback=?", function(json){ 
        document.getElementById("result").innerHTML = json.result.id;
      });
	}
	function add(id) {
		$.getJSON("http://127.0.0.1:7081/test?m=add&id="+id+"&callback=?", function(json){  
		 var code=json.code;
		 if(code==200){
		 		alert("添加成功");
		 	}    
      });
	}
</script>
<script type="text/javascript">     
	add(20);
    getOne(20);
</script>   
</head>

<body>
	<div id="tb">
	      ID:<div id="result"></div>
	</div>
</body>
</html>
</span>

$(document).ready(function(){
	var paramId = $("#paramId").val();
	if(paramId != ""){
		$.ajax({
			  type: "POST",
			  url: server_param_domain+"m=getOne",
			  data:{"id":paramId},
			  dataType: "jsonp",
			  success: function(json) {
				  var code = json.code;
			        if(code==200){
			          $("#paramName").val(json.result.paramName);
			          $("#endtime").val(json.result.endtime);
			        }
		      }  
		});
	}
	
}); 

function add() {//登陆 
	var paramName= $("#paramName").val();
	var endtime = $("#endtime").val();
	 if(paramName == ""){
		 alert("模块名称不能为空!");
		 return;
	 }
	 
	 $.ajax({
			  type: "POST",
			  url: server_param_domain+"m=add",
			  data:{"paramName":paramName,"type":"config","id":$("#paramId").val(),"endtime":endtime},
			  contentType: "application/x-www-form-urlencoded; charset=utf-8", 
			  dataType: "jsonp",
			  success: function(json) {
				  var code = json.code;
			        if(code!=200){
			        	alert("保存失败");
			        }else{
			         window.location.href = web_domain+'/system/param_config_list.jsp'; 
			        }
		      }  
		});
}
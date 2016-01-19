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
			          $("#order").val(json.result.order);
			        }
		      }  
		});
	}
	
}); 

function add() {//登陆 
	var paramName= $("#paramName").val();
	 var order=   $("#order").val();
	 if(paramName == ""){
		 alert("模块名称不能为空!");
		 return;
	 }
	 
	 if(order == ""){
		 order = 1;
	 }
	 
	 $.ajax({
			  type: "POST",
			  url: server_param_domain+"m=add",
			  data:{"paramName":paramName,"order":order,"type":"index","id":$("#paramId").val()},
			  contentType: "application/x-www-form-urlencoded; charset=utf-8", 
			  dataType: "jsonp",
			  success: function(json) {
				  var code = json.code;
			        if(code!=200){
			        	alert("保存失败");
			        }else{
			         window.location.href = web_domain+'/system/param_list.jsp'; 
			        }
		      }  
		});
}
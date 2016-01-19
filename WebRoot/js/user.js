$(document).ready(function(){
	find();
	
	var userId = $("#userId").val();
	if(userId != ""){
		$.ajax({
			  type: "POST",
			  url: server_user_domain+"m=getOne",
			  data:{"id":userId},
			  dataType: "jsonp",
			  success: function(json) {
				  var code = json.code;
			        if(code==200){
			          $("#username").val(json.result.username);
			          $("#password").val(json.result.password);
			          $("#repwd").val(json.result.password);
			          $("#pName").val(json.result.dep_id);
			          $("#realname").val(json.result.realname);
			          $("#role").val(json.result.role);
			        }
		      }  
		});
	}
	
}); 

function add() {//登陆 
	var username= $("#username").val();
	 var password=   $("#password").val();
	 var repwd =  $("#repwd").val();
	 if(username == ""){
		 alert("用户名不能为空!");
		 return;
	 }
	 
	 if(password == ""){
		 alert("密码不能为空");
		 return;
	 }
	 
	 if(repwd == ""){
		 alert("确认密码不能为空");
		 return;
	 }
	 
	 if(password != repwd){
		 alert("两次输入的密码不一致");
		 return;
	 }
	 
	 
	 $.ajax({
			  type: "POST",
			  url: server_user_domain+"m=add",
			  data:{"username":username,"password":password,"depId":$("#pName").val(),
				  "realname":$("#realname").val(),"role":$("#role").val(),"id":$("#userId").val()},
			  contentType: "application/x-www-form-urlencoded; charset=utf-8", 
			  dataType: "jsonp",
			  success: function(json) {
				  var code = json.code;
			        if(code!=200){
			        	alert("保存失败");
			        }else{
			         window.location.href = web_domain+'/system/user_list.jsp'; 
			        }
		      }  
		});
}

function find() {//查询全部部门
	   $.getJSON(server_dept_domain+"m=queryAll&page=1&pageSize=2000", function(json){ 
        var code = json.code;
        if(code!=200){
        	alert("数据初始化失败");
        }else{
        	$.each(json.result.list,function(n,obj){
        		$("#pName").append("<option value=\""+obj.id+"\">"+obj.depName+"</option>");
        	});
        }
      });
}

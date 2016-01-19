$(document).ready(function(){
	find();
	
	var deptId = $("#depId").val();
	if(deptId != ""){
		$.ajax({
			  type: "POST",
			  url: server_dept_domain+"m=getOne",
			  data:{"id":deptId},
			  dataType: "jsonp",
			  success: function(json) {
				  var code = json.code;
			        if(code==200){
			          $("#depName").val(json.result.depName);
			          $("#pName").val(json.result.pId);
			        }
		      }  
		});
	}
	
}); 

function add() {//登陆 
	var depName= $("#depName").val();
	 var pName=   $("#pName").val();
	   $.ajax({
			  type: "POST",
			  url: server_dept_domain+"m=add",
			  data:{"depName":depName,"pName":pName,"id":$("#depId").val()},
			  contentType: "application/x-www-form-urlencoded; charset=utf-8", 
			  dataType: "jsonp",
			  success: function(json) {
				  var code = json.code;
			        if(code!=200){
			        	alert("保存失败");
			        }else{
			         window.location.href = web_domain+'/system/dept_list.jsp?token='+token; 
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

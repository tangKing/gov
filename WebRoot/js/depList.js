$(document).ready(function(){
	find();
}); 

function add() {//登陆
	window.location.href = web_domain+'/system/dept_add.jsp';
}

listUrl = server_dept_domain;

function find() {//查询全部部门
	query(1);
}

function edit(){
	var ids = $('input[name="deptId"]:checked');
	var length = ids.length;
	if(length == 0){
		alert("请选择要修改的数据");
		return;
	}
	
	if(length > 1){
		alert("一次只能修改一条数据");
		return;
	}
	
	window.location.href = web_domain+"/system/right.jsp?id="+$(ids[0]).val();
}

function query(page){
	$.ajax({
		  type: "POST",
		  url: listUrl+"m=queryAll",
		  data:{"page":page,"pageSize":pageSize},
		  dataType: "jsonp",
		  success: function(json) {
			  var code = json.code;
		        if(code!=200){
		        	alert("数据初始化失败");
		        }else{
		        	$("#listTable").empty();
		        	$.each(json.result.list,function(n,obj){
		        		$("#listTable").append("<tr><td  height=\"30\" bgcolor=\"#FFFFFF\">" +
		        				"<input type=\"checkbox\" name=\"deptId\" id=\"checkbox2\" value=\""+obj.id+"\"/></td>" +
		        						"<td height=\"30\" bgcolor=\"#FFFFFF\" class=\"STYLE19\">"+obj.depName+"</td></tr>");
		        	});
		        	
		        	pageDiv(json.result);
		        }
	      }  
		});
}

function del(){
	var delId = "";
    $('input[name="deptId"]:checked').each(function(){
    	if(delId == ""){
    		delId = $(this).val();
    	}else{
    		delId += "," + $(this).val();
    	}
    }); 
    
    if(delId == ""){
    	alert("请选择要删除的数据");
    	
    	return;
    }
    
    $.getJSON(server_dept_domain+"m=del&ids="+delId, function(json){ 
        var code = json.code;
        if(code!=200){
        	alert("数据删除失败");
        }else{
        	window.location.href = web_domain+'/system/dept_list.jsp?token='+token; 
        }
      });
}
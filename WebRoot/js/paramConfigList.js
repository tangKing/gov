$(document).ready(function(){
	find();
}); 

function add() {//添加
	window.location.href = web_domain+'/system/param_config_add.jsp';
}

listUrl = server_param_domain;

function find() {//查询全部部门
	query(1);
}

function edit(){
	var ids = $('input[name="paramId"]:checked');
	var length = ids.length;
	if(length == 0){
		alert("请选择要修改的数据");
		return;
	}
	
	if(length > 1){
		alert("一次只能修改一条数据");
		return;
	}
	
	window.location.href = web_domain+"/system/param_config_add.jsp?id="+$(ids[0]).val();
}

function query(page){
	$.ajax({
		  type: "POST",
		  url: listUrl+"m=queryAll",
		  data:{"page":page,"pageSize":pageSize,"type":"config"},
		  dataType: "jsonp",
		  success: function(json) {
			  var code = json.code;
		        if(code!=200){
		        	alert("数据初始化失败");
		        }else{
		        	$("#listTable").empty();
		        	$.each(json.result.list,function(n,obj){
		        		$("#listTable").append("<tr><td  height=\"30\" bgcolor=\"#FFFFFF\">" +
		        				"<input type=\"checkbox\" name=\"paramId\" id=\"checkbox2\" value=\""+obj.id+"\"/></td>" +
		        						"<td height=\"30\" bgcolor=\"#FFFFFF\" class=\"STYLE19\">"+obj.paramName+"</td>" +
		        						"<td height=\"30\" bgcolor=\"#FFFFFF\" class=\"STYLE19\">"+obj.endtime+"</td>" +
		        								"</tr>"
		        						);
		        	});
		        	
		        	pageDiv(json.result);
		        }
	      }  
		});
}

function del(){
	var paramId = "";
    $('input[name="paramId"]:checked').each(function(){
    	if(paramId == ""){
    		paramId = $(this).val();
    	}else{
    		paramId += "," + $(this).val();
    	}
    }); 
    
    if(paramId == ""){
    	alert("请选择要删除的数据");
    	
    	return;
    }
    
    $.getJSON(server_param_domain+"m=del&ids="+paramId, function(json){ 
        var code = json.code;
        if(code!=200){
        	alert("数据删除失败");
        }else{
        	window.location.href = web_domain+'/system/param_config_list.jsp'; 
        }
      });
}
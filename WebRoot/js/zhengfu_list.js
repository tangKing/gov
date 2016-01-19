$(document).ready(function(){
	query(1);
}); 
listUrl = server_zhengfu_domain;
function query(page) {//查询全部部门
	 var requestUrl=listUrl+"m=queryAll";
	 var  data={"page":page,"pageSize":pageSize};
	 execAjax(requestUrl,data,findBack);
}
function findBack(json){
	 $("#listTable").empty();
	 $.each(json.result.list,function(n,obj){
 		$("#listTable").append("<tr>" +
 				"<td  height=\"30\" width=\"4%\" bgcolor=\"#FFFFFF\"><input type=\"checkbox\"     name=\"unitId\" id=\"checkbox2\" value=\""+obj.id+"\"/></td>" +
 				"<td height=\"30\" bgcolor=\"#FFFFFF\"  width=\"10%\" class=\"STYLE19\">"+obj.nbdw+"</td>" +
 				"<td height=\"30\" bgcolor=\"#FFFFFF\"  width=\"15%\"  class=\"STYLE19\">"+obj.nbr+"</td>" +
 				"<td height=\"30\" bgcolor=\"#FFFFFF\" width=\"14%\" class=\"STYLE19\">"+obj.hgr+"</td>" +
 				"<td height=\"30\" bgcolor=\"#FFFFFF\" width=\"16%\" class=\"STYLE19\">"+obj.yzfs+"</td>" +
 				"<td height=\"30\" bgcolor=\"#FFFFFF\" width=\"14%\" class=\"STYLE19\">"+obj.wzbt+"</td>" +
 				"<td height=\"30\" bgcolor=\"#FFFFFF\" width=\"14%\" class=\"STYLE19\">"+obj.bgshgr+"</td>" +
 				"<td height=\"30\" bgcolor=\"#FFFFFF\" width=\"13%\" class=\"STYLE19\">"+obj.xdfzr+"</td>" +
 				"</tr>");
 	});
	 
	pageDiv(json.result);
}
function updateStatus(status){//修改状态，1通过，2退回
	var ids = $('input[name="unitId"]:checked');
	var length = ids.length;
	if(length == 0){
		alert("请选择要修改的数据");
		return;
	}
	
	for(var i=0;i<ids.length;i++){
		upd($(ids[i]).val(),status);
	}
	alert('操作成功');
}
function upd(id,status) {//查询全部部门
	 var requestUrl=listUrl+"m=updateStatus";
	 var  data={"id":id,"status":status};
	 execAjax(requestUrl,data,updindBack);
}
function updindBack(json){
	alert(json.msg);
//	query(1);
}

function show(){
	var ids = $('input[name="unitId"]:checked');
	var length = ids.length;
	if(length == 0){
		alert("请选择要查看的数据");
		return;
	}
	
	if(length > 1){
		alert("一次只能查看一条数据");
		return;
	}
	
	window.location.href = web_domain+"/main/zhengfu_add.jsp?id="+$(ids[0]).val() +"&type=show";
}
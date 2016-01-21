var depId=$("#depId").val();//直接定义为本页的全局变量
var role=$("#role").val();
$(document).ready(function(){
	query(1,$("#paramId").val());
}); 
listUrl = server_duban_domain;

/**
 * 角色联合部门查询
 * role=1 查询全部状态数据
 * role=2 查询状态等于1的数据
 * role=3 查询状态等于2的数据
 * @param page
 * @param depId
 * @param role
 */
function query(page,paramId) {//查询全部部门
	 var requestUrl=listUrl+"m=queryAll";
	 var  data={"page":page,"pageSize":pageSize,"depId":depId,"role":role,"paramId":paramId};
	 execAjax(requestUrl,data,findBack);
}
function findBack(json){
	 $("#listTable").empty();
	 $.each(json.result.list,function(n,obj){
 		$("#listTable").append("<tr>" +
 				"<td  height=\"30\" width=\"4%\" bgcolor=\"#FFFFFF\"><input type=\"checkbox\"     name=\"unitId\" id=\"checkbox2\" value=\""+obj.id+"\"/></td>" +
 				"<td height=\"30\" bgcolor=\"#FFFFFF\"  width=\"10%\" class=\"STYLE19\">"+obj.typeName+"</td>" +
 				"<td height=\"30\" bgcolor=\"#FFFFFF\"  width=\"15%\"  class=\"STYLE19\">"+obj.sendDepName+"</td>" +
 				"<td height=\"30\" bgcolor=\"#FFFFFF\" width=\"14%\" class=\"STYLE19\">"+obj.pickTime+"</td>" +
 				"<td height=\"30\" bgcolor=\"#FFFFFF\" width=\"16%\" class=\"STYLE19\">"+obj.depName+"</td>" +
 				"<td height=\"30\" bgcolor=\"#FFFFFF\" width=\"14%\" class=\"STYLE19\">"+obj.outline+"</td>" +
 				"<td height=\"30\" bgcolor=\"#FFFFFF\" width=\"14%\" class=\"STYLE19\">"+obj.handleAsk+"</td>" +
 				"<td height=\"30\" bgcolor=\"#FFFFFF\" width=\"13%\" class=\"STYLE19\">"+dubanStatus[''+obj.status+'']+"</td>" +
 				"</tr>");
 	});
	 
	pageDiv(json.result);
}
function updateStatus(status){//修改状态，1通过，2退回
	var ids = $('input[name="unitId"]:checked');
	var length = ids.length;
	if(length == 0){
		alert("请选择要操作的数据");
		return;
	}
	
	if(length > 1){
		alert("一次只能操作一条数据");
		return;
	}
	window.location.href = web_domain+"/main/duban_add.jsp?id="+$(ids[0]).val() +"&type="+status;
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
	
	window.location.href = web_domain+"/main/duban_add.jsp?id="+$(ids[0]).val() +"&type=show";
}

function upd(id,status) {//查询全部部门
	 var requestUrl=listUrl+"m=updateStatus";
	 var  data={"id":id,"status":status};
	 execAjax(requestUrl,data,updindBack);
}
function updindBack(json){
	
//	query(1);
}
$(document).ready(function(){
	show();
}); 

function show() {//查询全部部门
	var requestUrl=server_webIndex_create_domain+"m=show";
	var data={"type":"index","page":1,"pageSize":"1000"};
	execAjax(requestUrl,data,showCallback);
}

function showCallback(obj){
	$.each(obj.result,function(n,param){
		$("#paramId"+n).val(param.id);
		$("#contentUL"+n+" li").remove();
		$.each(param.content,function(k,c){
			var status = c.spqk;
			var tip="";
			if(status == 3 || status == 5){
				tip = "(退)";
			}
			$("#contentUL"+n).append("<li>"+
	                "<span class=\"fr\">"+c.depName+"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;"+c.time+"</span>"+
	                "<a href=\"#\">"+c.dbxm+tip+"</a>"+
	              "</li>");
		});
		
		$("#paramName"+n).text(param.paramName);
		
		//未上报的
		var i = 0;
		var deptName = "";
		$.each(param.noMap,function(key,noDept){     
			deptName +="      "+ noDept;
			i+=1;
			
			if(i==3){
				return false;
			}
		 });
		
		//被退回的
		var j = 0;
		var deptName1 = "";
		$.each(param.back,function(key,back){     
			deptName1 +="      "+ back;
			j+=1;
			
			if(j==3){
				return false;
			}     
		 });
		
		$("#showDept"+n).text(deptName);
		$("#noBack"+n).text(deptName);
		$("#back"+n).text(deptName1);
	});
}

function showNO(i){
	$("#showDept"+i).text($("#noBack"+i).text());
}

function showBack(i){
	$("#showDept"+i).text($("#back"+i).text());
}

function showmore(i){
	var id=$("#paramId"+i).val();
	window.location.href = web_domain+'/main/duban_showList.jsp?id='+id;
}

function showAll(){
	for(var i = 8;i < 17;i++){
		var paramId = $("#paramId"+i).val();
		if(paramId != null && paramId != ""){
			$("#modul"+i).show();
		}
	}
	
	$("#showBtn").hide();
}
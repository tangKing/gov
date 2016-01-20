$(document).ready(function(){
	findMk();
	
	findDept();
	
	showDes();
});
function add() {//查询全部部门
	 //verificationToken($("#token").val());//严重token是否有效，无效则跳转到登录页
	 /*
	 *直接将表单提交
	 **/	 alert("添加成功！!!!");
	var requestUrl=server_duban_create_domain+"m=add";
	document.form2.action=requestUrl;
	   document.form2.submit();
	//$('#form2').ajaxSubmit(function(data) {  
	//    alert(data);//弹出ajax请求后的回调结果
	//});
	  
	   window.location.href = web_domain+'/main/duban_showList.jsp'; 
}
function findMk(){
	var requestUrl=server_param_domain+"m=queryAll";
	var data={"type":"index","page":1,"pageSize":"1000"};
	execAjax(requestUrl,data,findMkcallBack);
}

function findDept() {//查询全部部门
	  $.getJSON(server_dept_domain+"m=queryAll&page=1&pageSize=2000", function(json){ 
     var code = json.code;
     if(code!=200){
     	alert("数据初始化失败");
     }else{
     	$.each(json.result.list,function(n,obj){
     		$("#cbdw").append("<option value=\""+obj.id+"\">"+obj.depName+"</option>");
     	});
     }
   });
}

function findMkcallBack(json){
	if(json.code == 200){
		$("#ssmk").empty();
		$.each(json.result.list,function(n,obj){
	 		$("#ssmk").append(
	 				"<option value=\""+obj.id+"\">"+obj.paramName+"</option>"
	 				);
	 });
	}
}

function showDes() {//查询全部部门
	var createId = $("#createId").val();
	
 	if(createId != ""){
 		var requestUrl=server_duban_create_domain+"m=getOne";
 		var data={"id":createId};
 		execAjax(requestUrl,data,showDesBack);
	}
}

function showDesBack(json) {//查询全部部门
	var code = json.code;
	
    if(code==200){
      var obj = json.result;
      $("#createId").val(obj.id);
      $("#dbxm").val(obj.dbxm);
      $("#zynr").val(obj.zynr);
      $("#wcpk").val(obj.wcpk);
      $("#zgld").val(obj.zgld);
      $("#cbdw").val(obj.cbdw);
      $("#cbr").val(obj.cbr);
      $("#spqk").val(obj.spqk);
    }
}
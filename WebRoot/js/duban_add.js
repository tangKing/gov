$(document).ready(function(){
	showDes();
});

function add() {//查询全部部门
	 //verificationToken($("#token").val());//严重token是否有效，无效则跳转到登录页
	 /*
	 *直接将表单提交
	 **/
	var requestUrl=server_duban_domain+"m=add";
	document.form1.action=requestUrl;
	//alert("--11-2"+document.form1.action);
	//document.getElementById("form1").submit();
	$('#form1').ajaxSubmit(function(data) {  
	    alert(data);//弹出ajax请求后的回调结果
	});
	window.open("duban_list.jsp","_self","rightFrame");
}

function showDes() {//查询全部部门
	var dubanId = $("#dubanId").val();
 	if(dubanId != ""){
		$.ajax({
			  type: "POST",
			  url: server_duban_domain+"m=getOne",
			  data:{"id":dubanId},
			  dataType: "jsonp",
			  success: function(json) {
				  var code = json.code;
			        if(code==200){
			          var obj = json.result;
			          $("#dubanId").val(obj.id);
			          $("#type").val(obj.type);
			          $("#pickTime").val(obj.pickTime);
			          $("#sendDepart").val(obj.sendDepart);
			          $("#takeDepart").val(obj.takeDepart);
			          $("#outline").val(obj.outline);
			          $("#OfficeSuggestion").val(obj.OfficeSuggestion);
			          $("#instructions").val(obj.instructions);
			          $("#processTime").val(obj.processTime);
			          $("#feedback").val(obj.feedback);
			          $("#handleAsk").val(obj.handleAsk);
			          $("#leaderSign").val(obj.leaderSign);
			          $("#resultSuggestion").val(obj.resultSuggestion);
			          
			          var status = obj.status;
			          if($("#editType").val()!="edit"){
			        	  $("input[type!='button']").attr("readonly","readonly");
				          $("textarea").attr("readonly","readonly");
				          
				          if(status == 1){// 未审核
				        	  $("#zhuguanBtn").show();
				        	  $("#zhuguanBtn2").show();
				          }else if(status == 2){
				        	  $("#zhuguanImg1").show();
				        	  $("#xianzhangBtn").show();
				        	  $("#xianzhangBtn2").show();
				          }else if(status == 3){
				        	  $("#zhuguanImg2").show();
				        	  $("#xianzhangBtn").show();
				        	  $("#xianzhangBtn2").show();
				          }else if(status == 4){
				        	  $("#xianzhangImg1").show();
				          }else if(status == 5){
				        	  $("#xianzhangImg2").show();
				          }
			          }
			        }
		      }  
		});
	}
}

/**
 * 主管审核通过
 */
function zhuguanUpdate(){
	zhuguanUpdateAjax($("#dubanId").val(),2);
}

/**
 * 主管退回
 */
function zhuguanBack(){
	zhuguanBackAjax($("#dubanId").val(),3);
}

function zhuguanBackAjax(id,status) {
	 var requestUrl=server_duban_domain+"m=updateStatus";
	 var  data={"id":id,"status":status};
	 execAjax(requestUrl,data,zhuguanBackAjaxBack);
}

function zhuguanUpdateAjax(id,status) {
	 var requestUrl=server_duban_domain+"m=updateStatus";
	 var  data={"id":id,"status":status};
	 execAjax(requestUrl,data,zhuguanUpdateAjaxBack);
}

function zhuguanUpdateAjaxBack(json){
	if(json.code==200){
		alert("审核成功");
		$("#zhuguanImg1").show();
		$("#zhuguanBtn").hide();
		$("#zhuguanBtn2").hide();
	}else{
		alert("审核异常");
	}
}

function zhuguanBackAjaxBack(json){
	if(json.code==200){
		alert("退回成功");
		$("#zhuguanImg2").show();
		$("#zhuguanBtn").hide();
		$("#zhuguanBtn2").hide();
	}else{
		alert("退回异常");
	}
}

/**
 * 县长审核通过
 */
function xianzhangUpdate(){
	xianzhangUpdateAjax($("#dubanId").val(),4);
}

/**
 * 县长退回
 */
function xianzhangBack(){
	xianzhangBackAjax($("#dubanId").val(),5);
}

function xianzhangBackAjax(id,status) {
	 var requestUrl=server_duban_domain+"m=updateStatus";
	 var  data={"id":id,"status":status};
	 execAjax(requestUrl,data,xianzhangBackAjaxBack);
}

function xianzhangUpdateAjax(id,status) {
	 var requestUrl=server_duban_domain+"m=updateStatus";
	 var  data={"id":id,"status":status};
	 execAjax(requestUrl,data,xianzhangUpdateAjaxBack);
}

function xianzhangUpdateAjaxBack(json){
	if(json.code==200){
		alert("审核成功");
		$("#xianzhangImg1").show();
		$("#xianzhangBtn").hide();
		$("#xianzhangBtn2").hide();
	}else{
		alert("审核异常");
	}
}

function xianzhangBackAjaxBack(json){
	if(json.code==200){
		alert("退回成功");
		$("#xianzhangImg2").show();
		$("#xianzhangBtn").hide();
		$("#xianzhangBtn2").hide();
	}else{
		alert("退回异常");
	}
}
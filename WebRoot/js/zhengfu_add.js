$(document).ready(function(){
	showDes();
});
function add() {//查询全部部门
	 //verificationToken($("#token").val());//严重token是否有效，无效则跳转到登录页
	 /*
	 *直接将表单提交
	 **/
	var requestUrl=server_zhengfu_domain+"m=add";
	document.form1.action=requestUrl;
	//alert("--111-2"+document.form1.action);
	//document.getElementById("form1").submit();
	$('#form1').ajaxSubmit(function(data) {  
	    alert(data);//弹出ajax请求后的回调结果
	});
	window.open("zhengfu_list.jsp","_self","rightFrame");
}

function showDes() {//查询全部部门
	var zhengfuId = $("#zhengfuId").val();
 	if(zhengfuId != ""){
		$.ajax({
			  type: "POST",
			  url: server_zhengfu_domain+"m=getOne",
			  data:{"id":zhengfuId},
			  dataType: "jsonp",
			  success: function(json) {
				  var code = json.code;
			        if(code==200){
			          var obj = json.result;
			          $("#zhengfuId").val(obj.id);
			          $("#zfbh").val(obj.zfbh);
			          $("#jmcd").val(obj.jmcd);
			          $("#xzqf").val(obj.xzqf);
			          $("#fxzyj").val(obj.fxzyj);
			          $("#fzryj").val(obj.fzryj);
			          $("#nbdw").val(obj.nbdw);
			          $("#nbr").val(obj.nbr);
			          $("#bgshgr").val(obj.bgshgr);
			          $("#hgr").val(obj.hgr);
			          $("#yzfs").val(obj.yzfs);
			          $("#dzr").val(obj.dzr);
			          $("#xdfzr").val(obj.xdfzr);
			          $("#zs").val(obj.zs);
			          $("#cs").val(obj.cs);
			          $("#wzbt").val(obj.wzbt);
			        }
		      }  
		});
	}
}

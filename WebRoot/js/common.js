var token= $("#token").val();
var web_domain="http://127.0.0.1:8080/gov-git";//tomcat 访问地址
var server_test_domain="http://127.0.0.1:7081/test?callback=?&token="+token+"&";//服务端访问地址
var server_login_domain="http://127.0.0.1:7081/login?callback=?&token="+token+"&";//服务端访问地址
var server_user_domain="http://127.0.0.1:7081/user?callback=?&token="+token+"&";//服务端访问地址
var server_dept_domain="http://127.0.0.1:7081/dept?callback=?&token="+token+"&";//服务端访问地址
var server_param_domain="http://127.0.0.1:7081/param?callback=?&token="+token+"&";//服务端访问地址
var server_duban_domain="http://127.0.0.1:7081/duban?callback=?&token="+token+"&";//服务端访问地址
var server_zhengfu_domain="http://127.0.0.1:7081/zhengfu?callback=?&token="+token+"&";//服务端访问地址
var server_duban_create_domain="http://127.0.0.1:7081/dbcreate?callback=?&token="+token+"&";//服务端访问地址
var server_webIndex_create_domain="http://127.0.0.1:7081/webIndex?callback=?&token="+token+"&";//服务端访问地址

var listUrl = "";
var pageSize = 20;

var dubanStatus = {"1":"未处理","2":"主管审核通过","3":"主管退回","4":"县长审核通过","5":"县长退回"};

function againlogin() {//重新登陆
	 	 alert("token失效，请先登陆");
	 	parent.location.href = web_domain+'/login.jsp'; 
}

function SelectAll() {
	var len = $("input[type='checkbox']:checked").length; 
	if(len>1){
		$("input[type='checkbox']").attr("checked",false);
	}else{
		$("input[type='checkbox']").attr("checked",true);
	}
}

function pageDiv(pageModel){
	$("#totalNum").text(pageModel.totalRecords);
	$("#pageNo").text(pageModel.pageNo);
	$("#pageSize").text(pageModel.totalPages);
	$("#preNum").val(pageModel.prePage);
	$("#nextNum").val(pageModel.nextPage);
	$("#totalPage").val(pageModel.totalPages);
}

function goFirst(){
	query(1);
}

function goPre(){
	query($("#preNum").val());
}

function goNext(){
	query($("#nextNum").val());
}

function goDown(){
	query($("#totalPage").val());
}
function execAjax(requestUrl, data,callback) {//执行ajax
	   $.ajax({
			  type: "POST",
			  url: requestUrl,
			  data:data,
			  contentType: "application/x-www-form-urlencoded; charset=utf-8", 
			  dataType: "jsonp",
			  success: function(json) {
				  callback(json);
		      }  
		});
}
//验证token
function verificationToken(token){
	//if(token==''|| token==null){
	//	alert('token失效，请登录');
	//	 window.location.href = web_domain+'/main/main.jsp?token='+token; 
	//	return false;
	//}
	//  $.getJSON(server_login_domain+"m=verificationToken&token="+token, function(json){ 
	//        var code = json.code;
	 //       if(code!=200){
	 //       alert('token失效，请登录');
	 //  		 window.location.href = web_domain+'/main/main.jsp?token='+token; 
	//        }
	//      });
}
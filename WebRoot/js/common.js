var token= $("#token").val();
var web_domain="http://127.0.0.1:8080/gov";//tomcat 访问地址
var server_test_domain="http://127.0.0.1:7081/test?callback=?&token="+token+"&";//服务端访问地址
var server_login_domain="http://127.0.0.1:7081/login?callback=?&token="+token+"&";//服务端访问地址

function againlogin() {//重新登陆
	 	 alert("token失效，请先登陆");
         window.location.href = web_domain+'/jsp/login.jsp'; 
}

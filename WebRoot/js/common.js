var token= $("#token").val();
function againlogin() {//重新登陆
	 	alert("token失效，请先登陆");
         window.location.href = 'http://127.0.0.1:8080/gov/jsp/login.jsp'; 
}

function login() {//登陆
	var username= $("#username").val();
	 var pwd=   $("#pwd").val();
	   $.getJSON(server_login_domain+"m=login&username="+username+"&pwd="+pwd, function(json){ 
        var code = json.code;
        if(code!=200){
        alert("用户名或密码错误");
        }else{
        var token = json.token;
         $("#token").attr("value",token);
         alert("登陆成功");
         window.location.href = web_domain+'/jsp/login.jsp?token='+token; 
        }
      });
	}
function regdit() {//注册
	var username= $("#regusername").val();
	 var pwd=   $("#regpwd").val();
	   $.getJSON(server_login_domain+"m=regdit&username="+username+"&pwd="+pwd, function(json){ 
	  var code = json.code;
	    if(code==200){
	         var msg = json.msg;
	         alert(msg);
        }else{
           var msg = json.msg;
           alert(msg);
        }
      });
	}
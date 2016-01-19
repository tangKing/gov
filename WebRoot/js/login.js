function login() {//登陆
	var username= $("#username").val();
	 var pwd=   $("#password").val();
	   $.getJSON(server_login_domain+"m=login&username="+username+"&pwd="+pwd, function(json){ 
        var code = json.code;
        if(code!=200){
        alert("用户名或密码错误");
        }else{
        var token = json.token;
         $("#token").attr("value",token);
         var user = json.user;
         var data = "&username="+user.username+"&password="+user.password+"&dId="+user.dep_id+"&role="+user.role+"&rName="+user.rolename;
         window.location.href = web_domain+'/main/main.jsp?token='+token+data; 
        }
      });
	}
function regdit() {//注册 
	var username= $("#regusername").val();
	 var pwd=   $("#regpwd").val();
	 var role=   $("#role").val();
	   $.getJSON(server_login_domain+"m=regdit&username="+username+"&pwd="+pwd+"&role="+role, function(json){ 
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
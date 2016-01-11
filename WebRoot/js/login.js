function login() {//登陆
	var username= $("#username").val();
	 var pwd=   $("#pwd").val();
	   $.getJSON("http://127.0.0.1:7081/login?m=login&username="+username+"&pwd="+pwd+"&callback=?", function(json){ 
        var code = json.code;
        if(code!=200){
        alert("用户名或密码错误");
        }else{
        var token = json.token;
         $("#token").attr("value",token);
         alert("登陆成功");
         window.location.href = 'http://127.0.0.1:8080/gov/jsp/login.jsp?token='+token; 
        }
      });
	}
function regdit() {//注册
	var username= $("#regusername").val();
	 var pwd=   $("#regpwd").val();
	   $.getJSON("http://127.0.0.1:7081/login?m=regdit&username="+username+"&pwd="+pwd+"&callback=?", function(json){ 
	  var code = json.code;
	    if(code==200){
	       //var token = json.token;
         //  $("#token").attr("value",token);
	         var msg = json.msg;
	         alert(msg);
        }else{
           var msg = json.msg;
           alert(msg);
        }
      });
	}
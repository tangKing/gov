var token= $("#token").val();
function getOne(id) {//token必须传递，否则会被认为没有登陆
	   $.getJSON("http://127.0.0.1:7081/test?m=getOne&id="+id+"&callback=?&token="+token, function(json){
			 var code=json.code;
			 if(code==200){
			        document.getElementById("result").innerHTML = json.result.id;
			 }else{
				 alert("token失效，请先登陆");
			 }
      });
	}
function add(id) {//token必须传递，否则会被认为没有登陆
		$.getJSON("http://127.0.0.1:7081/test?m=add&id="+id+"&callback=?&token="+token, function(json){  
		 var code=json.code;
		 if(code==200){
		 		alert("添加成功");
		 } else{
				 alert("token失效，请先登陆");
			 }  
      });
	}
function getOne(id) {//token必须传递，否则会被认为没有登陆
	   $.getJSON(server_domain+"m=getOne&id="+id, function(json){
			 var code=json.code;
			 if(code==200){
			        document.getElementById("result").innerHTML = json.result.id;
			 }else{
				 againlogin();
			 } 
      }); 
	}
function add(id) {//token必须传递，否则会被认为没有登陆
		$.getJSON(server_domain+"&m=add&id="+id, function(json){  
		 var code=json.code;
		 if(code==200){
		 		alert("添加成功");
		 }else{
			 againlogin();
		}  
      });
	}
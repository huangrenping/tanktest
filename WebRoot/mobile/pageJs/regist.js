
$(function(){
	yanzhenma();
	
	
	function yanzhenma(){
		$("#zhuce").click(function(){
			debugger
				var email=$("#email").val().replace(/\s+/g,"");
				var name=$("#username").val().replace(/\s+/g,"");
				var username=$("#username2").val().replace(/\s+/g,"");
				var userpwd=$("#userpwd").val().replace(/\s+/g,"");
				var userpwd2=$("#userpwd2").val().replace(/\s+/g,"");
				if(email.length==0){
					layer.msg("邮箱地址不能为空！");
					return false;
				}else if(name.length<3){
					layer.msg("用户名不能小于3位长度！");
					return false;
				}else if(username.length<3){
					layer.msg("用户昵称不能小于3位长度！");
					return false;
				}else if(userpwd.length<3 &&userpwd2.length<3){
					layer.msg("两次密码不能小于3位长度！");
					return false;
				}else if(userpwd!=userpwd2){
					layer.msg("两次密码不一致！");
					return false;
				}else{
						$.ajax({
						type:"post",
						url:webPath+"/user/front/add?email="+email,
						data:{"name":name,"userpwd":userpwd,"username":username},
						dataType:"json",
						async:true,
						success:function(data){
								layer.msg(data.msg);

						}
					});
				}
				
		})

	}
	
	  //失去焦点时，判断用户名是否重复
	  $("#email").blur(function(){
		  var email=$("#email").val();
			  if(email.length>0){
				  $.ajax({
					  url:webPath+"/user/front/selectoneemail?email="+email,
				 	  type:'post',
				 	  cache:false,
				 	  error : function(XMLHttpRequest, textStatus, errorThrown) {
				 			layer.closeAll('loading');
				 			layer.msg("网络异常!请刷新。。。")
				 		}, 
				 	    success:function(json){
				 	    	$("#isemail").show();
				 	    	$("#isemail").attr("value",json.msg);// 填充内容
				 	    	//延迟0.5S关闭
				 	    }
				  })
			  }
		});
	  
	  //失去焦点时，判断邮箱是否重复申请
	  $("#username").blur(function(){
		  var username=$("#username").val();
			  if(username.length>0){
				  $.ajax({
					  url:webPath+"/user/selectoneloginName?loginname="+username,
				 	  type:'post',
				 	  cache:false,
				 	  error : function(XMLHttpRequest, textStatus, errorThrown) {
				 			layer.closeAll('loading');
				 			layer.msg("网络异常!请刷新。。。")
				 		}, 
				 	    success:function(json){
				 	    	$("#ischunzai").show();
				 	    	$("#ischunzai").attr("value",json.msg);// 填充内容
				 	    	//延迟0.5S关闭
				 	    }
				  })
			  }
		});

})
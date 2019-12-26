
$(function(){
	updatepwd();
	
	
	function updatepwd(){
		$("#payBtn").click(function(){
				debugger;
				var password2=$("#password2").val().replace(/\s+/g,"");
				var password3=$("#password3").val().replace(/\s+/g,"");
				var loginname=$("#loginname").val();
				if(password2.length<3){
					layer.msg("新密码长度不能小于3！");
					return false;
				}else if(password3.length<3){
					layer.msg("确认密码长度不能小于3！");
					return false;
				}else if(password2!=password3){
					layer.msg("两次密码不一致！");
					return false;
				}else{
					
						$.ajax({
						type:"get",
						url:webPath+"/user/front/updatepwd",
						data:{"loginname":loginname,"password":password2},
						dataType:"json",
						async:true,
						error : function(XMLHttpRequest, textStatus, errorThrown) {
				 			layer.closeAll('loading');
				 			layer.msg("网络异常!请刷新。。。")
				 		}, 
						success:function(data){
								layer.msg(data.msg);
					 	    	setTimeout(timeout,500)
					 	    	function timeout(){
					 	    		window.location.href=webPath+"/user/front/index";
					 	    	}
								
						}
					});
				}
				
		})

	}
	  //获得焦点事件
	  $(function() {
		  $("#oldpassword").focus();
		  });
	  //失去焦点时，判断旧密码是否正确
	  $("#oldpassword").blur(function(){
		  var oldpassword=$("#oldpassword").val();
		  var loginpwd=$("#loginpwd").val();
			  if(oldpassword!=loginpwd){
				  $("#jieguo").show();
				  $("#jieguo").attr("value","旧密码不对");// 填充内容
			  }else{
				  $("#jieguo").hide();
			  }
		});

})
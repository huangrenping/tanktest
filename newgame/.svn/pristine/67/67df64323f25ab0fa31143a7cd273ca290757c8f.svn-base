

$(function(){
	
	star();
	
	function star(){
		$("#mybut").click(function(){
			var loginName=$("#loginName").val().replace(/\s+/g,"");
			var loginPwd=$('#loginPwd').val().replace(/\s+/g,"");
			var preurl=$("#preurl").val();
			if(loginName.length==0){
				layer.msg("用户名不能为空！");
			}
			else if(loginPwd.length==0){
				layer.msg("密码不能为空！");
			}else{
				
				$.ajax({
					type:"post",
					data:{"loginName":loginName,"LoginPwd":loginPwd,"preurl":preurl},
					url:webPath+"/user/front/login",
					dataType:"json",
					async:true,
					success:function(data){
						//正常登录跳转
						if(data.code==500){
							layer.msg(data.msg);
						}else{
							layer.msg("登录成功");
							window.location.href=data.msg;
						}
					}
				});
			
			}
		})
	}
})


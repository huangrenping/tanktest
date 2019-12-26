/**
 * 作者：汪雄威
 * 代号：还有谁
 * 时间：2017-9-6
 */
layui.define(['form','layer','laypage','laydate'], function(exports){
	var $ = layui.jquery, 
	form = layui.form(),
	layer = layui.layer,
	laypage = layui.laypage;
	
	

	//登陆
	start();
	
	function start(){

		$("#mybtn").click(function(){
			var loginName=$("#loginName").val().replace(/\s+/g,"");
			var LoginPwd=$('#LoginPwd').val().replace(/\s+/g,"");
			if(loginName.length==0){
				layer.msg("用户名不能为空！");
			}
			else if(LoginPwd.length==0){
				layer.msg("密码不能为空！");
			}else{
				var datafrom=$("#myform").serialize();
				$.ajax({
				  url:webPath+"/login",
			 	  type:'post',
			 	  data:datafrom,
			 	  dataType:"json",
			 	  cache:false,
			 	  error : function(XMLHttpRequest, textStatus, errorThrown) {
			 			layer.closeAll('loading');
			 			layer.msg("网络异常!请刷新。。。");
			 	  },success:function(data){
			 		  if(data.code==200){
			 			 window.location.href=webPath+"/login2"; 
			 		  }else{
			 			 layer.msg(data.msg);
			 		  }
			 	  }
			  });
			}
		});
	}
});

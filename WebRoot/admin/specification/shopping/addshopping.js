 /**
	汪雄威
	用户管理分页查询
	2019-9-5
* */
layui.define(['form','layer','laypage','laydate'], function(exports){
	var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;
	 exports('addshopping', {});
   //注意，这里是模块输出的核心，模块名必须和list时的模块名一致

	 //查询所有用户等级，放到下拉框
	 //LevelAll();
	 //增加
	 saveuser();

	  //获得焦点事件
/*	  $(function() {
		  $("#loginname").focus();
		  });
	  //失去焦点时，判断用户名是否重复
	  $("#loginname").blur(function(){
		  var loginname=$("#loginname").val();
		  if(loginname.length>0){
			  $.ajax({
				  url:webPath+"/user/selectoneloginName?loginname="+loginname,
			 	  type:'post',
			 	  cache:false,
			 	  error : function(XMLHttpRequest, textStatus, errorThrown) {
			 			layer.closeAll('loading');
			 			layer.msg("网络异常!请刷新。。。")
			 		}, 
			 	    success:function(json){
			 	    	layer.msg(json.msg);
			 	    	//延迟0.5S关闭
			 	    }
			  })
		  }

		});*/
		 function saveuser() {
			 $("#saveBtn").click(function(){
				 var form=$("#hp_form").serialize();
				 debugger;
				 	$.ajax({
				 		url:webPath+"/shopping/saveuserorupdate",
				 	    type:'post',
				 	    data:form,
				 	    dataType:"json",
				 	    cache:false,
				 	    error : function(XMLHttpRequest, textStatus, errorThrown) {
				 			
				 			layer.msg("网络异常!请刷新。。。")
				 		}, 
				 	    success:function(json){
				 	    	layer.msg(json.msg)
				 	    	//延迟0.5S关闭
				 	    	setTimeout(timeout,500)
				 	    	function timeout(){
				 	    		var index = parent.layer.getFrameIndex(window.name); //获取当前窗体索引
					    		parent.layer.close(index); //执行关闭  这两句的意思是关闭当前窗口
				 	    	}
			 				
				 	    }
				 		
				 	});
			 
			})
		 }

/*				$("#saveBtn").click(function(){
					var loginname=$("#loginname").val().replace(/\s+/g,"");
					var email=$("#email").val();
					if(loginname.length==0){
						layer.msg("用户名不能为空！");
					}else if(!isEmail(email)){
						layer.msg("邮箱格式不正确(正确为xx@.xx)");
					}else{
					var formdata=$("#hp_form").serialize();
				 	$.ajax({
				 		url:webPath+"/user/saveuserorupdate",
				 	    type:'post',
				 	    data:formdata,
				 	    dataType:"json",
				 	    cache:false,
				 	    error : function(XMLHttpRequest, textStatus, errorThrown) {
				 			
				 			layer.msg("网络异常!请刷新。。。")
				 		}, 
				 	    success:function(json){
				 	    	layer.msg(json.msg)
				 	    	//延迟0.5S关闭
				 	    	setTimeout(timeout,500)
				 	    	function timeout(){
				 	    		var index = parent.layer.getFrameIndex(window.name); //获取当前窗体索引
					    		parent.layer.close(index); //执行关闭  这两句的意思是关闭当前窗口
				 	    	}
			 				
				 	    }
				 		
				 	});
				}
				 	
				})*/
			

	/**
	 * 正则表达his验证邮箱
	 */
	  	 function isEmail(str){
	         var reg = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
	         return reg.test(str);
	     }
	 
})
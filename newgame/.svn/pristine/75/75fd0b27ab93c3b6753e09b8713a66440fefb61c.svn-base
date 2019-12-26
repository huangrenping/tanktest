/**
 * 等级增加
 */

layui.define(['form','layer','laypage','laydate'], function(exports){
	var $ = layui.jquery, 
	form = layui.form(),
	layer = layui.layer,
	laypage = layui.laypage;
	 exports('Level', {});
	 
	 saveuser();
	 
	 /**
	  * 增加
	  * @returns
	  */
	  //获得焦点事件
	  $(function() {
		  $("#name").focus();
		  });
	  //失去焦点时，判断用户名是否重复
	  $("#name").blur(function(){
		  var name=$("#name").val().replace(/\s+/g,"");
		  var oldname=$("#oldname").val().replace(/\s+/g,"");
		  if(name.length>0 && name!=oldname){
			  $.ajax({
				  url:webPath+"/Level/selectleverl?name="+name,
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

		});
	  
	 function saveuser() {
			$("#saveBtn").click(function(){
				var name=$("#name").val().replace(/\s+/g,"");
				if(name.length==0){
					layer.msg("部门名称不能为空！");
				}else{
				var formdata=$("#hp_form").serialize();
			 	$.ajax({
			 		url:webPath+"/Level/saveLevel",
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
			 	
			})
		}
})
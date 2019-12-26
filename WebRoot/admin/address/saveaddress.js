 /**
	  * 收货地址管理
* */
layui.define(['form','layer','laypage','laydate'], function(exports){
	var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;
	 exports('saveaddress', {});
   //注意，这里是模块输出的核心，模块名必须和list时的模块名一致
	
   //保存用户
	 $("#addbut").click(function(){
		 	var mydata=$("#addressForm").serialize();
		 	$.ajax({
		 		type:"post",
		 		url:webPath +"/receiveAddress/saveAddress",
		 		async:true,
		 		data:mydata,
		 		success:function(data){
		 			if(data.code==200){
		 				parent.layer.msg("保存成功");
		 				var index = parent.layer.getFrameIndex(window.name); //获取当前窗体索引
			    		parent.layer.close(index); //执行关闭  这两句的意思是关闭当前窗口
		 			}else{
		 				layer.msg("对不起,服务器连接不上,请刷新");
		 			}
		 		}
		 	});
	})
	 
	 
	 
})
 /**
	  * 商品类型大类型管理
* */
layui.define(['form','layer','laypage','laydate'], function(exports){
	var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;
	 exports('specificationssave', {});
   //注意，这里是模块输出的核心，模块名必须和goodstypebiglist时的模块名一致
	 
	// 处理请求
		function processAajxSubmit(url,submitdata){
			$.ajax({
					type:"post",
					url:url,
					async:true,
					data:submitdata,
					success:function(json){
						if(json.code==200){
							$("#message").html(json.msg);
							var $modal = $('#my-alert');
							$modal.modal(); 
							
							var index = parent.layer.getFrameIndex(window.name);
							parent.layer.close(index);
							
							
						}else{
							layer.msg(json.msg);
						}
						
					}
				});	
		}
		//监听保存
		$("body").on("click","#btn-save",function(data){
			var submitdata = $("#save-form").serialize();
					processAajxSubmit(webPath+"/specifications/ajax/additem",submitdata);
					return false;
		});
		
	 
	 
})
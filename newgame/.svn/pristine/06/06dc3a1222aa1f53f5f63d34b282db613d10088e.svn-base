 /**
	  * 轮播图管理
* */
layui.define(['form','layer','laypage','laydate'], function(exports){
	var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;
	 exports('addCarouselImg', {});
   //注意，这里是模块输出的核心，模块名必须和list时的模块名一致
	//一进入,页面进行全查询
	 //  按钮绑定
	  $.hpUpload(webPath+"/carouselImg/upload",{"path":webPath},function(json){
		  console.log(json);
		  $("#carouselImg").val(json.imgPath);
		  $("#imgUrl").attr('src',webPath+"/"+json.imgPath);
	  }); 
		 // 处理请求
		function processAajxSubmit(url,submitdata){
			$.ajax({
					type:"post",
					url:url,
					async:true,
					data:submitdata,
					success:function(data){
						if(data.code==200){
							layer.msg(data.msg);
						}else{
							layer.msg(data.msg);
						}
						 var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
						  parent.layer.close(index); //再执行关闭  
					}
			    
				});	
		}
		addCarouselImg();
		//添加的方法
		function addCarouselImg(){
			$("#addCarouselImg-but").click(function(){
				var submitdata = $("#addCarouselImg-form").serialize();
				processAajxSubmit(webPath+"/carouselImg/ajax/addCarouselImg",submitdata);				
				return false;
			});
		}	

	
	 
	 
	 
	 
	 
})
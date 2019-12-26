 /**
	  * 商品类型小类型添加
* */
layui.define(['form','layer','laypage','laydate'], function(exports){
	var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;
	 exports('goodstypesmallsave', {});
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
							//$modal.modal(); 
							
							
						}else{
							layer.msg(json.msg);
						}
						
					}
				});	
		}
		//监听保存
		$("body").on("click","#btn-save",function(data){
			var submitdata = $("#save-form").serialize();
					processAajxSubmit(webPath+"/goodstypesamll/ajax/additem",submitdata);
					return false;
		});
		
		 //加载大类类别
		 loadGoodsTypeBiglist();
		 function  loadGoodsTypeBiglist(){
			 $.ajax({
					url:webPath+'/goodstypebig/ajax/goodstypebiglistname',
					type:"post",
					success:function(json){
						if(json.data && json.data.length>0){
			 				//var pageObj=json.data;
			 				var pageList=json.data;
			 				//数据封装
			 				$("#CarouselImg").empty();
			 				$.each(pageList,function(index,item){
			 					if(item.id!=null&&item.id>=0){
			 						$("#goodsTypeId").append(' <option value="'+item.id+'">'+item.name+'</option>');
			 					}
			 					
			 				});		
			 			}
						form.render("select");
					}
				});
		 }
		
	
	
	 
});


//上传图片，显示
layui.config({
	base : "js/"
}).use(['form','layer','jquery','upload','laydate'],function(){
	form = layui.form();
	var layer = parent.layer === undefined ? layui.layer : parent.layer;
		$ = layui.jquery;
		$form = $('form');
		laydate = layui.laydate;

    
	//  按钮绑定
		  $.hpUpload(webPath+"/goodstypesamll/ajax/upload",{"path":webPath},function(res){
			  
			  if(res.code==200){
			   		$("#imgUrl")[0].src=webPath+"/"+res.imgPath;
			   		$("#fImg").val(res.imgPath);
			   }
		  }); 
})




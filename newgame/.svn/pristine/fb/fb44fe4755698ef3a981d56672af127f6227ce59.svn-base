 /**
	  * 商品管理
* */
layui.define(['form','layer','laypage','laydate'], function(exports){
	var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;
	 exports('savegoods', {});
   //注意，这里是模块输出的核心，模块名必须和list时的模块名一致
	 
	     //上传图片
	    // 单个文件上传的内容
	   
		  $.hpUpload(webPath+"/goods/uploadFile",{"path":"/upload/"},function(json){
			  console.log(json);
			  $("#coverimg").val(json.imgPath);
			  $("#imgUrl").attr('src',webPath+json.imgPath);
		  });
		  
		  
	    var url= webPath+"/goods/uploadFiles"; // 提交目标地址
	    var data={"path" : "/upload/"};	
	    $.hpUpload_plus.viewUploadArea("#uploadViewDiv",url,data,function(json){
	    	           // 上传完成之后
	    			  layer.msg('上传成功')
	    			  var $html='';
				   $.each(json.imgPath,function(index,item){
					   var img_url=item.substring(1,item.length);
					   var $img='<input type="hidden" class="afters" name="carouselImgs" value="'+img_url+'"></input>';
					   $html+=$img;
				   })
				   if($('#hp-upload-div-data').find(".afters").length<=0){
					   $('#hp-upload-div-data').html('');
				   }
				   $('#hp-upload-div-data').append($html);
	    });
	
   //保存商品
	 $("#addbut").click(function(){
		 	var mydata=$("#goods_form").serialize();
		 	$.ajax({
		 		type:"post",
		 		url:webPath +"/goods/saveGoods",
		 		async:true,
		 		data:mydata,
		 		success:function(data){
		 			if(data.code==200){
		 				layer.msg("保存成功");
		 				window.location.href=webPath+"/goods/toGoodsList";
		 			}else{
		 				layer.msg("对不起,服务器连接不上,请刷新");
		 			}
		 		}
		 	});
	})
	//商品下拉选择框	

   $("#js-selected").on('change',function(){
			var bid=$("#js-selected").val();
			$("#goodstypesmall option[value!='0']").remove();
			var goodsTypeId=$("#goodsTypeId").val();
			$.ajax({
		 		type:"post",
		 		url:webPath +"/goodstypesamll/ajax/getTypesmalllistSelect",
		 		async:true,
		 		data:{"bid":bid},
		 		success:function(rs){
		 			if(rs.code==200){
		 				var content="";
		 				$.each(rs.data.typeSmallList,function(index,item){
		 					if(goodsTypeId==item.id){
		 						content+='<option value="'+item.id+'" selected="selected">'+item.name+'</option>';	
		 					}
		 					content+='<option value="'+item.id+'">'+item.name+'</option>';	
		 				})
		 				$("#goodstypesmall").append(content);
		 			}else{
		 				layer.msg("对不起,服务器连接不上,请刷新");
		 			}
		 		}
		 	});
		}
		)


	
	 
	 
	 
})
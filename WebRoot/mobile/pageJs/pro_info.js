$(function(){
	//获得评论
	getCommentbyId();
	//获得收藏人数
	getCollection();
	function  getCommentbyId() {
		var id=$("#goodId").val();
		$.ajax({
			url:webPath+"/comment/selectAllbyGid",
			data:{"id":id},
			type:'post',
			success:function(jsonData){
				var htmlContent = ""
				if(jsonData.code==200){
					$("#tab3").html("");
					$.each(jsonData.data.list,function(index,item){
						var username ="匿名用户";
						if(item.isShowName==1){
							username=item.user.username;
						}
						htmlContent+='<div class="weui-panel__bd">';
						htmlContent+='<div class="wy-media-box weui-media-box_text">';
						htmlContent+='<div class="weui-cell nopd weui-cell_access">';
						htmlContent+='<div class="weui-cell__hd"><img src="'+webPath+'/'+item.user.headimg+'" alt="" style="width:20px;margin-right:5px;display:block"></div>';
						htmlContent+='<div class="weui-cell__bd weui-cell_primary"><p>'+username+'</p></div>';
						htmlContent+='<span class="weui-cell__time">'+item.createtime+'</span>';
						htmlContent+='</div>';
						htmlContent+='<div class="comment-item-star"><span class="real-star comment-stars-width'+item.level+'"></span></div>';
						htmlContent+='<p class="weui-media-box__desc">'+item.content+'</p>';
						htmlContent+='<ul class="weui-uploader__files clear mg-com-img">';
						$.each(item.showimg,function(index1,item1){
							htmlContent+='<li class="weui-uploader__file" style="background-image:url('+webPath+'/'+item1+')"></li>';
						})
						htmlContent+='</ul>';
						htmlContent+='</div>';
						htmlContent+='</div>';
					});
					$("#tab3").html(htmlContent);
				}
				
			}
		});
		
	}
	$(document.body).pullToRefresh().on("pull-to-refresh", function() {
        setTimeout(function() {
          $("#time").text(new Date);
          $(document.body).pullToRefreshDone();}, 2000);
      });
      var loading = false;
      $(document.body).infinite().on("infinite", function() {
        if(loading) return;
        loading = true;
        setTimeout(function() {
        	page=page+1;
        	pingjia(page);
        	loading = false;
        }, 2000);
      });
	
	//收藏人数
	$("body").on("click", "#show-toast", function() {
		var uid=$("#user").val();
		if(uid==null||uid==""){
			$.toast("亲,收藏失败,请先登录","cancel", function() {
						window.location.href=webPath+"/toMobileLogin";
					});
		}else{
			var id=$("#goodId").val();
			$.ajax({
			type: "post",
			url: webPath+"/collect",
			data: { "id": id },
			success: function(jsondata) {
				if(jsondata.code == 200) {
					$.toast("收藏成功", function() {
						console.log('close');
						getCollection();
					});
				}else{
					$.toast("收藏失败", function() {
						console.log('close');
					});
				}
			}
		});
		}
		

	})
	function  getCollection(){
		var id=$("#goodId").val();
		$.ajax({
			url:webPath+"/getCollectNum",
			data:{"id":id},
			type:'post',
			success:function(jsonData){
				if(jsonData.code==200){
				 $("#collectnum").html(jsonData.data+"人");	
				}
				
			}
		});
	}
	//加入购物车
	$("body").on("click", "#mycat", function() {
			var goodid=$("#goodId").val();
			var title=$("#title").val();
			var price=$("#price").val();
			var goodsImg=$("#coverImg").val();
			var size=$("#size .active a").html();
			var color=$("#color .active a").html();
			
			if(size!=null&&size!=''&&color!=null&&color!=''){
				$.ajax({
					type: "post",
					url: webPath+"/shopCat/saveShopCat",
					data: { "goodsId": goodid,"num":1,"title":title,"price":price,"goodsImg":goodsImg,"specificationsInfo":size+" "+color},
					success: function(jsondata) {
						if(jsondata.code == 200) {
							$("#size li").removeClass(".active")
							$("#color li").removeClass(".active")
							$("#size1 li").removeClass(".active")
							$("#color1 li").removeClass(".active")
							getShopCatNumbyUid();
						}else{
							
						}
					}
					
				});
			}else{
				$.toast("亲,要选择商品规格哦","forbidden");
				return false;
			}
	})
	//当前用户购物车商品数量
	getShopCatNumbyUid();
	function  getShopCatNumbyUid(){
		
		$.ajax({
			url:webPath+"/shopCat/selectShopCatById",
			type:'post',
			success:function(jsonData){
				if(jsonData.code==200){
					if(jsonData.data.catNum!=0){
						$("#shopCat").html(jsonData.data.catNum);	
					}
				}
				
			}
		});
	}
	//立即购买
	$("#paynow").click(function(){
		var uid=$("#user").val();
		if(uid!=null||uid!=""){
			var arr =new Array();
			var data={}
			data.goodsId=$("#goodId").val();
			data.num=1;
			data.title=$("#title").val();
			data.goodsImg=$("#coverImg").val();
			var size=$("#size2 .active a").html();
			var color=$("#color2 .active a").html();
			var sp=size+color;
			data.specificationsInfo=sp;
			data.price=$("#price").val();
			arr.push(data);
			if(size!=null&&size!=''&&color!=null&&color!=''){
			$.ajax({
				type:"post",
				url:webPath+"/order/OrderSave",
				dataType:"json",
				async:true,
				data:{"orderList":JSON.stringify(arr)},
				success:function(jsonData){
					if(jsonData.code==200){
						window.location.href=webPath+"/order/getOneOrderByNo/"+jsonData.data+"";
					}else{
						$.toast(jsonDate.msg,"cancel", function() {
							window.location.href=webPath+"/toMobileLogin";
						});
					}
					
				}
			});
			}else{
				$.toast("亲,要选择商品规格哦","forbidden");
			}
		}else{
			$.toast("亲,请先登录哦","cancel",function() {
				window.location.href=webPath+"/toMobileLogin";
			});
			
		}
		
	})
	
     
	
})
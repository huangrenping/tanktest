/**
 * @description 首页js
 */
var myBannerSwiper,
	myNewsSwiper,
	myRqscSwiper,
	myXlmcSwiper;

$(function(){
	//初始化swiper
	FastClick.attach(document.body);
	myBannerSwiper = new Swiper(".swiper-banner",{
        loop: true,
        pagination: '.swiper-pagination',
        initialSlide:1,
        autoplay: 3000
    });
	myNewsSwiper = new Swiper(".swiper-news",{
		loop: true,
		pagination: '.swiper-pagination',
		direction: 'vertical',
		paginationHide :true,
        autoplay: 5000
    });
	myRqscSwiper = new Swiper(".swiper-rqsc",{
		pagination: '.swiper-pagination',
		loop: true,
		paginationType:'fraction',
        slidesPerView:2,
        paginationClickable: true,
        spaceBetween: 5
    });
	myXlmcSwiper = new Swiper(".swiper-xlmc",{
		pagination: '.swiper-pagination',
		paginationType:'fraction',
		loop: true,
    	slidesPerView:3,//显示的列数
//		slidesPerColumn: 2,//显示的行数
	    paginationClickable: true,
	    slidesPerGroup:3,
	    spaceBetween:2 //设置slier之间的间距
    });
    
    //动态加载轮播图数据
    initSwiperData(myBannerSwiper,webPath+"/carouselImg/ajax/getAllCarouselImg",1);
	//动态加载新闻数据
	initSwiperData(myNewsSwiper,webPath+"/news/ajax/getAllNews",2);
	//动态加载销量卖出数据（按销量降序排列前12条数据）
	initSwiperData(myXlmcSwiper,webPath+"/goods/ajax/getSLMCGoods",3);
	//动态加载人气销量数据（按让收藏和销量降序排列前6条）
	initSwiperData(myRqscSwiper,webPath+"/goods/ajax/getRenqiGoods",4);
	
	//加载为你推荐列表（所有商品到序排列前10条）
	initWNTJData(webPath+"/goods/ajax/getWNTJGoods");
	
});
	//请求数据swiper为对应swiper实例，url为请求路径,which为索引对应swiper实例
	function initSwiperData(swiper,url,which){
			$.ajax({
				url:url,
				type:'post',
				success:function(jsonData){
					if(jsonData.code==200){
						$.each(jsonData.data,function(index,item){
							if(which==1){
								swiper.appendSlide( '<div class="swiper-slide"><a href="'+webPath+'/showGoodsDetail/'+item.goodId+'"><img class="carousel-img" src="'+webPath+'/'+item.img+'" /></a></div>');
							}else if(which==2){
								swiper.appendSlide('<div class="swiper-slide"><a href="'+webPath+'/showDetail/'+item.id+'">'+item.title+'</a></div>');
							}else if(which==3){
								swiper.appendSlide( '<div class="swiper-slide"><a href="'+webPath+'/showGoodsDetail/'+item.id+'"><img class="xlmc-img" src="'+webPath+'/'+item.coverimg+'" /></a></div>');
							}else if(which==4){
								swiper.appendSlide('<div class="swiper-slide"><a href="'+webPath+'/showGoodsDetail/'+item.id+'"><img class="rqsc-img" src="'+webPath+'/'+item.coverimg+'" /></a></div>');
							}
//							swiper.update(true);//注意在每次动态添加swiper-slide元素后都需要调用swiper.update(true)方法更新一下，否则初始化会出问题
						});
					}else{
					}
				}
			});
	}
	function initWNTJData(url){
		$.ajax({
			url:url,
			type:'post',
			success:function(jsonData){
				var htmlContent = ""
				if(jsonData.code==200){
					$("#wntj-goods").html("");
					$.each(jsonData.data,function(index,item){
						htmlContent+='<li>';
						htmlContent+='<a href="'+webPath+'/showGoodsDetail/'+item.id+'">';
						htmlContent+='<div class="proimg"><img src="'+webPath+'/'+item.coverimg+'"></div>';
						htmlContent+='<div class="protxt">';
						htmlContent+='<div class="name">'+item.title+'</div>';
						htmlContent+='<div class="wy-pro-pri">¥<span>'+item.price+'</span></div>';
						htmlContent+='</div></a></li>';
					});
					$("#wntj-goods").html(htmlContent);
				}
			}
		});
		
		//当前用户购物车商品数量
		getShopCatNumbyUid();
		function  getShopCatNumbyUid(){
			$.ajax({
				url:webPath+"/order/ajax/getAllOrderByUid",
				type:'post',
				success:function(jsonData){
					if(jsonData.code==200){
						if(jsonData.data.catNum!=0){
							$("#shopCat").show();
							$("#shopCat").html(jsonData.data.catNum);	
						}	
					}
					
				}
			});
		}
		
	//模糊搜索
	  //点击搜索文本框中前的放大镜搜索
	  $(".weui-icon-search").click(function(){
		 //alert("go");
		 var flag="3"; //设置搜索后显示列表为综合排序
		 var sname=$("#searchInput").val();
		 //跳到分类搜索页面
		 window.location.href = encodeURI(encodeURI(webPath+"/goods/showMoreGoodsList?sname="+sname+"&flag="+flag));
		 
	  });	
		
}

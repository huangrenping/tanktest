  $(function() {
    FastClick.attach(document.body);
    //返回按钮监听事件
     $(".wy-header-icon-back").click(function(){
    	 	window.history.back();
   });
   goodstypebiglistname();
   goodstypesmalllistname(1);
  	//加载大类型	
	function goodstypebiglistname(){
		$.getJSON(webPath+"/goodstypebig/ajax/goodstypebiglistname",function(json){
			$.each(json.data, function(i,goodstypebig) {					
				$("#sidebar ul").append("<li data-id='"+goodstypebig.id+"'>"+goodstypebig.name+"</li>");	
				});
			$("#sidebar ul li:first").addClass("active");
			 $('#sidebar ul li').click(function(){
					$(this).addClass('active').siblings('li').removeClass('active');
					var index = $(this).index();
					$("#classifyName").text("新品"+$(this).text());
					$('#content').html("");
					//获取对应的小类型
					var id = $(this).attr("data-id");
					goodstypesmalllistname(id);
			})
		});	
		  
	}
	//加载小类型
	function goodstypesmalllistname(id){
		
		$.getJSON(webPath+"/goodstypesamll/ajax/getTypesmalllistSelect?bid="+id,function(json){
			$.each(json.data.typeSmallList, function(i,goodstypesmall) {					
					$("#content").append("<li class='w-3'>"+"<a href='"+webPath+"/goods/showMoreGoodsList?flag=3&sid="+goodstypesmall.id+"'>"+"</a>" +"<img src='"+webPath+'/'+goodstypesmall.img+"' width='100px' height='100px'>"+"<span>"+goodstypesmall.name+"</span>"+"</li>");	
				});
		});			  
	}
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
	
   
  });
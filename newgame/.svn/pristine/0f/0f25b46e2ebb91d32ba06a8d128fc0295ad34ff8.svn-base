
	var pageIn = 1;//下拉加载次数
	var pageLast = 1;//上拉刷新次数
	var toalPages =1;//总页数
	
	//加载分页显示
	function getaddall(pageNum,flag){
		// 获取筛选条件
 	 	function getQueryParam(){
		 	var data={};
		 	data['name']=$("#searchInput").val();
		 	data['flag']=flag||$("#flag").val();
		 	data['sid']=$("#sid").val();
		 	data['pageNum'] = pageNum||1;
		 	return data;
 	 	} 
 	 	 var data=getQueryParam();
 	 	
	 	$.ajax({
	 		url:webPath+"/goods/ajax/goodsProList",
	 	    data:data,
	 	    type:'post',
	 	    cache:false,
	 	    dataType:'json',
	 	    error : function(XMLHttpRequest, textStatus, errorThrown) {
	 			//layer.closeAll('loading');
	 			//layer.msg("网络异常!请刷新。。。")
	 		}, 
	 	    success:function(json){
	 	    	toalPages=json.data.pageInfo.lastPage;//总页数
	 	    	
	 			if(json.data && json.data.pageInfo.list.length>0){
	 				var pageObj=json.data;
	 				var pageList=json.data.pageInfo.list;
	 				var listhtml="";
	 				//下拉加载样式
	 				$("#notfoundList").hide();
	 				$("#loadlist").show();
	 					
	 					$.each(pageList,function(index,item){
		 					if(item.id!=null&&item.id>=0){
		 						
		 						listhtml=listhtml+'<div class="pro-items">';
		 						listhtml=listhtml+ '<a href="'+webPath+'/showGoodsDetail/'+item.id+'" class="weui-media-box weui-media-box_appmsg">';
		 						listhtml=listhtml+ '<div class="weui-media-box__hd"><img class="weui-media-box__thumb" src="'+webPath+'/'+item.coverimg+'" alt=""></div>';
		 						listhtml=listhtml+'<div class="weui-media-box__bd">';
		 						listhtml=listhtml+'<h1 class="weui-media-box__desc">'+item.title+'</h1>';
		 						listhtml=listhtml+'<div class="wy-pro-pri">¥<em class="num font-15">'+item.price+'</em></div>';
		 						listhtml=listhtml+'<ul class="weui-media-box__info prolist-ul">';
		 						listhtml=listhtml+'<li class="weui-media-box__info__meta"><em class="num">'+json.data.commentNumList[index]+'</em>条评价</li>';
		 						if(json.data.levelNum[index]!=(-1)){
		 							listhtml=listhtml+'<li class="weui-media-box__info__meta"><em class="num">'+json.data.levelNum[index]+'%</em>好评</li>';
		 						}else{
		 							listhtml=listhtml+'<li class="weui-media-box__info__meta">暂时没有评论</li>';
		 						}
		 						listhtml=listhtml+'</ul>';
		 						listhtml=listhtml+'</div>';
		 						listhtml=listhtml+'</a>';
		 						listhtml=listhtml+'</div>';
		 						
		 						
		 					}
		 					
		 				});
	 				
	 				$("#list").append(listhtml);
	 			}
	 			//加载页只有一页时隐藏‘正在加载’提示，显示‘没有更多数据’
	 			if(toalPages==1||toalPages==0){
	 				setTimeout(function(){
	 					$("#loadlist").hide();
	 					$("#notfoundList").show();
	 				},500);
	 				
	 			}
	 			
	 	    }
	 	});
	 }
	
 $(function(){
    FastClick.attach(document.body);
    $(".wy-header-icon-back").click(function(){
     	   window.history.back();
    });
  
  //分页显示(设置初始搜索样式)
  var sname=$("#sname").val();
  if(sname==null||sname==""){
	  getaddall(); 
  }else{
	  $("#searchText").click();
	  $("#searchInput").val(sname);
	  getaddall(); 
  }
  
  
  
  
//搜索栏目样式改变
  
  //设置初始样式	
  var flagitem = $("#flag").val();
  if(flagitem==null){
	  flagitem="3";
	  $(".weui-flex__item:first").removeClass("myheader1");
	  $(".weui-flex__item").not($(".weui-flex__item:first")).addClass("myheader1");
	  //$(".weui-flex__item").not($(".weui-flex__item:first")).children().addClass("myfontcolor");
  }else{
	  if( flagitem=='1-1'){
		  $(".weui-flex__item:eq(2)").removeClass("myheader1");
		  $(".weui-flex__item").not($(".weui-flex__item:eq(2)")).addClass("myheader1");
		 // $(".weui-flex__item").not($(".weui-flex__item:eq(2)")).children().addClass("myfontcolor");
		 // $(".weui-flex__item").not($(".weui-flex__item:eq(2)")).children().css("color","black");
	  }else if( flagitem=='2'){
		  $(".weui-flex__item:eq(1)").removeClass("myheader1");
		  $(".weui-flex__item").not($(".weui-flex__item:eq(1)")).addClass("myheader1");
		  //$(".weui-flex__item").not($(".weui-flex__item:eq(1)")).children().addClass("myfontcolor");
		  //$(".weui-flex__item:eq(1)").children().css("color","red");
		  //$(".weui-flex__item").not($(".weui-flex__item:eq(2)")).children().css("color","black");
		  
	  }else if( flagitem=='3'){
		  $(".weui-flex__item:first").removeClass("myheader1");
		  $(".weui-flex__item").not($(".weui-flex__item:first")).addClass("myheader1");
		 // $(".weui-flex__item").not($(".weui-flex__item:first")).children().addClass("myfontcolor");
	  }else if( flagitem=='4-1'){
		  $(".weui-flex__item:eq(3)").removeClass("myheader1");
		  $(".weui-flex__item").not($(".weui-flex__item:eq(3)")).addClass("myheader1");
		 // $(".weui-flex__item").not($(".weui-flex__item:eq(3)")).children().addClass("myfontcolor");
	  }
  }
  
  //点击改变搜索栏目样式
  $(".weui-flex").find("div").click(function(){
	  $(this).removeClass("myheader1");
	  $(".weui-flex__item").not($(this)).addClass("myheader1");
	  
  });
  //点击
  $(".weui-flex__item:first").click(function(){
	  $("#flag").val("3");
	  $("#list").html("");
	  pageIn=1;//每次点击设置初始页为1
	  pageLast=1;
	  getaddall(1);
  });
  $(".weui-flex__item:eq(1)").click(function(){
	  $("#flag").val("2");
	  $("#list").html("");
	  pageIn=1;//每次点击设置初始页为1
	  pageLast=1;
	  getaddall(1);
  });
  $(".weui-flex__item:eq(2)").click(function(){
	  $("#flag").val("1-1");
	  $("#list").html("");
	  pageIn=1;//每次点击设置初始页为1
	  pageLast=1;
	  getaddall(1);
  });
  $(".weui-flex__item:last").click(function(){
	  if($(".weui-flex__item:last").children().hasClass("SortAscCss") ){
		  $(".weui-flex__item:last").children().removeClass("SortAscCss");  
		  $(".weui-flex__item:last").children().addClass("SortDescCss"); 
		  $("#flag").val("4-2");
		  $("#list").html("");
		  pageIn=1;//每次点击设置初始页为1
		  pageLast=1;
		  getaddall(1);
	  }else{
		  $(".weui-flex__item:last").children().removeClass("SortDescCss");  
		  $(".weui-flex__item:last").children().addClass("SortAscCss"); 
		  $("#flag").val("4-1");
		  $("#list").html("");
		  pageIn=1;//每次点击设置初始页为1
		  pageLast=1;
		  getaddall(1);
	  }
	  
  });
  
  
  //模糊搜索
  //点击搜索文本框中前的放大镜搜索
  $(".weui-icon-search:first").click(function(){
	  $("#list").html("");//清空显示列表
	 
	 var flag="3"; //设置搜索后显示列表为综合排序
	 //改变搜索栏目样式，默认为综合
	 $(".weui-flex__item").addClass("myheader1");
	 $(".weui-flex__item:first").removeClass("myheader1");
	 $(".weui-flex__item:first").not( $(".weui-flex__item:first")).addClass("myheader1");
	 pageIn=1;//每次点击设置初始页为1
	 //pageLast=1;
	 getaddall(1,flag);
  });
  
  //上拉刷新，下拉加载
  $(document.body).pullToRefresh().on("pull-to-refresh", function() {
        setTimeout(function() {
          $("#time").text(new Date);
          $(document.body).pullToRefreshDone();
          pageLast=pageLast+1;
          $("#list").html("");//上拉刷新时将内容清空
          pageIn=1;
          getaddall(1);
        }, 2000);
      });
      // infinite
      var loading = false;
      $(document.body).infinite().on("infinite", function() {
    	  if(toalPages==pageIn){
    		  setTimeout(function() {
    			  $("#loadlist").hide();
    			  $("#notfoundList").show();
    		  }, 2000);
    		  return ;
    	  }
    	  
        if(loading) return;
        loading = true;
        pageIn=pageIn+1;
        setTimeout(function() {
        getaddall(pageIn);
          loading = false;
        }, 1000);
      });
      
 });
	
	

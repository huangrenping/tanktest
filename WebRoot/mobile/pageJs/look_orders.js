/***
*订单管理
*/
 $(function() {
    FastClick.attach(document.body);
       $(".wy-header-icon-back").click(function(){
     	window.history.back();
     });
       //查询该用户所有订单信息
       //触发dom被点击
       var mystates = $("#mystate").val();
   		if(mystates==1){
   		  $('#orderBtn1').trigger("click");
   		  initOrderDataByState(webPath+"/order/ajax/getAllOrderByUid","#tab2",1);
   		}else if(mystates==2){
   		  $('#orderBtn2').trigger("click");
   		  initOrderDataByState(webPath+"/order/ajax/getAllOrderByUid","#tab3",2);
   		}else if(mystates==3){
     		  $('#orderBtn3').trigger("click");
       		  initOrderDataByState(webPath+"/order/ajax/getAllOrderByUid","#tab4",3);
       		}else if(mystates==4){
     		  $('#orderBtn4').trigger("click");
       		  initOrderDataByState(webPath+"/order/ajax/getAllOrderByUid","#tab5",4);
       		}else if(mystates==5){
     		  $('#orderBtn5').trigger("click");
       		  initOrderDataByState(webPath+"/order/ajax/getAllOrderByUid","#tab6",5);
       		}else{
       		  initOrderDataByState(webPath+"/order/ajax/getAllOrderByUid","#tab1");
       		}
       
       //删除订单
       $(document).on("click", ".ords-btn-dele", function() {
    	   var id =$(this).attr("href1");
           $.confirm("您确定要删除此订单吗?", "确认删除?", function() {
        		$.ajax({
        			type: "post",
        			url: webPath+"/order/deleteOrder?id="+id,
        			success: function(jsondata) {
        				if(jsondata.code == 200) {
        					 $.toast("订单已经删除!");
        					  initOrderDataByState(webPath+"/order/ajax/getAllOrderByUid","#tab2",1);
        				}else{
        				}
        			}
        			
        		});
           }, function() {
             //取消操作
           });
         });
       
       //确认收货
 	  $(document).on("click", ".receipt", function() {
 		  var id =$(this).attr("href1");
 			$.ajax({
 				type: "post",
 				url: webPath+"/order/updateOrderState",
 				data:{"id":id,"state":4},
 				success: function(jsondata) {
 					if(jsondata.code == 200) {
 						 $.toast("五星好评送蓝豆哦，赶快去评价吧！", "收货完成！");
 						  initOrderDataByState(webPath+"/order/ajax/getAllOrderByUid","#tab4",3);
 					}else{
 					}
 				}
 			});
 		
       });
 	  //根据点击的tab加载对应商品订单列表信息
 	 $(document).on("click", ".weui-navbar a", function() {
 		 	var state = $(this).attr("orderState");
 		 	var tabId =$(this).attr("href");
// 		 	alert(''+tabId+'');
 		 	initOrderDataByState(webPath+"/order/ajax/getAllOrderByUid",tabId,state);
       });
 	 
  });
  //加载数据
  function initOrderDataByState(url,dom,mystate){
		$.ajax({
			url:url,
			type:'post',
			data:{"state":mystate},
			success:function(jsonData){
				var htmlContent = ""
				if(jsonData.code==200){
					$(''+dom+'').html("");
					if(jsonData.data.orderNum!=0){
					$.each(jsonData.data.orderList,function(index,item){
						var ord_status ="";
						var ord_com ="";
						if(item.state==1){
							ord_status="待付款";
							ord_com = "去付款";
						}else if(item.state==2){
							ord_status="待发货";
							ord_com = "";
						}else if(item.state==3){
							ord_status="待收货";
							ord_com = "确认收货";
						}else if(item.state==4){
							ord_status="已签收";
							ord_com = "去评价";
						}
						htmlContent+='<div class="weui-panel weui-panel_access">';
						htmlContent+='<div class="weui-panel__hd"><span>单号：'+item.no+'</span><span class="ord-status-txt-ts fr">'+ord_status+'</span></div>';
						htmlContent+=' <div class="weui-media-box__bd  pd-10">';
						var detailCount=0;
						$.each(jsonData.data.orderList[index].orderDetailList,function(count,orderDetail){
						detailCount=detailCount+orderDetail.num;
						htmlContent+='<div class="weui-media-box_appmsg ord-pro-list">';
						htmlContent+=' <div class="weui-media-box__hd"><a href="'+webPath+'/showGoodsDetail/'+orderDetail.goodsId+'"><img class="weui-media-box__thumb" src="'+webPath+'/'+orderDetail.goodsImg+'" alt=""></a></div>';
						htmlContent+='<div class="weui-media-box__bd">';
						htmlContent+=' <h1 class="weui-media-box__desc"><a href="'+webPath+'/showGoodsDetail/'+orderDetail.goodsId+'" class="ord-pro-link">'+orderDetail.title+'</a></h1>';
						htmlContent+='<p class="weui-media-box__desc">规格：'+orderDetail.specificationsInfo+'</p>';
						htmlContent+=' <div class="clear mg-t-10">';
						htmlContent+='<div class="wy-pro-pri fl">¥<em class="num font-15">'+orderDetail.price+'</em></div>';
						htmlContent+=' <div class="pro-amount fr"><span class="font-13">数量×<em class="name">'+orderDetail.num+'</em></span></div>';
						htmlContent+='</div>';
						htmlContent+='</div>';
						htmlContent+='</div>';
						htmlContent+=' </div>';
						});
						htmlContent+='<div class="ord-statistics">';
						htmlContent+='<span>共<em class="num">'+detailCount+'</em>件商品，</span>';
						htmlContent+='<span class="wy-pro-pri">总金额：¥<em class="num font-15">'+item.money+'</em></span>';
						htmlContent+='<span>(含运费<b>￥0.00</b>)</span>';
						htmlContent+='  </div>';
						htmlContent+='<div class="weui-panel__ft">';
						if(item.state==1){
							htmlContent+='<div class="weui-cell weui-cell_access weui-cell_link oder-opt-btnbox">';
							htmlContent+='<a href1="'+item.id+'" class="ords-btn-dele">删除订单</a><a href="'+webPath+'/order/getOneOrderByNo/'+item.no+'" class="ords-btn-com">'+ord_com+'</a>';
						}else if(item.state==2){
							htmlContent+='<div class="weui-cell weui-cell_access weui-cell_link oder-opt-btnbox">商品正在打包中，请您耐心等待....</div>';    
						}else if(item.state==3){
							htmlContent+='<div class="weui-cell weui-cell_access weui-cell_link oder-opt-btnbox"><a href1="'+item.id+'" class="ords-btn-com receipt">'+ord_com+'</a></div>';  
						}else if(item.state==4){
							htmlContent+='<div class="weui-cell weui-cell_access weui-cell_link oder-opt-btnbox weui-cell-comment"><a href="'+webPath+'/comment/dingdan?id='+item.id+'" class="ords-btn-com">'+ord_com+'</a></div>';  
						}
						htmlContent+='</div>';    
						htmlContent+='</div>';
						htmlContent+='</div>';
					});
					$(''+dom+'').html(htmlContent);
					}else{
						$(''+dom+'').html("您当前没有该状态订单信息");
					}
				}else{
					 $(''+dom+'').html(jsonData.msg);
				}
			}
		});
  }
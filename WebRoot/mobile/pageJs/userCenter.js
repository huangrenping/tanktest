$(function() {
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
	//当前用户待付款数量
	getOrderbyUid1();
	function  getOrderbyUid1(){
		$.ajax({
			url:webPath+"/order/ajax/getAllOrderByUid",
			type:'post',
			data:{"state":1},
			success:function(jsonData){
				if(jsonData.code==200){
					if(jsonData.data.orderNum!=0){
						$("#orderNum1").show();
						$("#orderNum1").html(jsonData.data.orderNum);	
					}	
				}
				
			}
		});
	}
	//当前用户侍发货数量
	getOrderbyUid2();
	function  getOrderbyUid2(){
		$.ajax({
			url:webPath+"/order/ajax/getAllOrderByUid",
			type:'post',
			data:{"state":2},
			success:function(jsonData){
				if(jsonData.code==200){
					if(jsonData.data.orderNum!=0){
						$("#orderNum2").show();
						$("#orderNum2").html(jsonData.data.orderNum);	
					}	
				}
				
			}
		});
	}
	//当前用户待收货数量
	getOrderbyUid3();
	function  getOrderbyUid3(){
		$.ajax({
			url:webPath+"/order/ajax/getAllOrderByUid",
			type:'post',
			data:{"state":3},
			success:function(jsonData){
				if(jsonData.code==200){
					if(jsonData.data.orderNum!=0){
						$("#orderNum3").show();
						$("#orderNum3").html(jsonData.data.orderNum);	
					}	
				}
				
			}
		});
	}
	//当前用户待评价车商品数量
	getOrderbyUid4();
	function  getOrderbyUid4(){
		$.ajax({
			url:webPath+"/order/ajax/getAllOrderByUid",
			type:'post',
			data:{"state":4},
			success:function(jsonData){
				if(jsonData.code==200){
					if(jsonData.data.orderNum!=0){
						$("#orderNum4").show();
						$("#orderNum4").html(jsonData.data.orderNum);	
					}	
				}
				
			}
		});
	}
	
	//当前用户待评价车商品数量
	getOrderbyUid5();
	function  getOrderbyUid5(){
		$.ajax({
			url:webPath+"/order/ajax/getAllOrderByUid",
			type:'post',
			data:{"state":5},
			success:function(jsonData){
				if(jsonData.code==200){
					if(jsonData.data.orderNum!=0){
						$("#orderNum5").show();
						$("#orderNum5").html(jsonData.data.orderNum);	
					}	
				}
				
			}
		});
	}
})
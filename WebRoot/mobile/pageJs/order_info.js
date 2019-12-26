$(function() {
	//获得收货默认地址
	getOneAddress()
	function getOneAddress() {
		$.ajax({
			type: "post",
			url: webPath+"/mobile/getOneAddress",
			success: function(jsondata) {
				if(jsondata.code == 200) {
					$("#myaddress").html(jsondata.data.address);
					$("#addressId").val(jsondata.data.id)
				}else{
					
				}
			}
			
		});
	}
	 FastClick.attach(document.body);
     $(".wy-header-icon-back").click(function(){
     	window.history.back();
     });
    
    $("#payBtn").click(function(){
    	var payno=$("#payno").val();
    	var addressId=$("#addressId").val();
    	if($(".pay:checked").length<=0){$.toast("请选择支付方式", "text");return;}
    	var val=$(".pay:checked").data("pay");
    	if(val==0){ 
    		$.ajax({
    			type: "post",
    			data:{"id":payno,"addressId":addressId},
    			url: webPath+"/order/pay",
    			success: function(jsondata) {
    				if(jsondata.code == 200) {
    				window.location.href=webPath+"/order/towxQr";	
    				}else{
    					
    				}
    			}
    			
    		});
    	}else{
    			
    	}
    });
    $(".Spinner").Spinner({value:1, len:3, max:999});
	
})
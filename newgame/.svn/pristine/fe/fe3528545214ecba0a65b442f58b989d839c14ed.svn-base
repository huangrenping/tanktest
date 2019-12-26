/***
 * 编辑地址
 */
$(function() {
    FastClick.attach(document.body);
    //返回监听
    $(".wy-header-icon-back").click(function(){
     	window.history.back();
     });
    //地址选择器监听
    $("#address").cityPicker({
        title: "选择出发地",
        onChange: function (picker, values, displayValues) {
          console.log(values, displayValues);
       /*   picker.updateValue();*/
        }
      });
    
    $("#isDefaultCheck").change(function(){
    	var state = this.checked ? '1' : '0';
    	$("#isDefault").val(state);
    });
    //保存地址
	 $("#showTooltips").click(function(){
		 	var mydata=$("#addressForm").serialize();
		 	$.ajax({
		 		type:"post",
		 		url:webPath +"/receiveAddress/saveAddress2",
		 		async:true,
		 		data:mydata,
		 		success:function(data){
		 			if(data.code==200){
		 				 $.toast("保存成功", function() {
		 			          console.log('close');
		 			         window.history.back();
		 			        });
		 			}else{
//		 				layer.msg("对不起,服务器连接不上,请刷新");
		 				 $.toast("对不起,服务器连接不上,请刷新", function() {
		 			        });
		 			}
		 		}
		 	});
	})
    deleteaddress();
	 //删除
	 function deleteaddress(){
			$("#delbtu").click(function(){
				var id=$("#id").val();
				 	$.ajax({
				 		type:"post",
				 		url:webPath +"/receiveAddress/deleteAddress?rid="+id,
				 		async:true,
				 		success:function(data){
				 			if(data.code==200){
				 				 $.toast("删除成功", function() {
				 			          console.log('close');
				 			         window.history.back();
				 			        },2000);
				 			}else{
				 				$.toast("对不起,服务器连接不上,请刷新", function() {
			 			        });
				 			}
				 		}
				 	});		 
			 }	
			)		 
		 }
		 
	
	
	


    
    
    
    
    
    
    
    
    
 });
/***
 * 地址列表
 */ 
$(function() {
    FastClick.attach(document.body);
    //监听返回按钮事件
   $(".wy-header-icon-back").click(function(){
     	window.history.back();
     });
  /* var id=$("#uid").val(); 
   alert(id);
   ReceiveAddressList(id);*/
   ReceiveAddressList();
   //显示所有地址列表
	function ReceiveAddressList(){
		$.ajax({
			url:webPath+"/ajax/ReceiveAddressList",
			type:'post',
			success:function(jsonData){
				var htmlContent = ""
				if(jsonData.code==200){
					$.each(jsonData.data,function(index,item){
						htmlContent+='<div class="weui-panel__bd">';
						htmlContent+='<div class="weui-media-box weui-media-box_text address-list-box">';
						htmlContent+='<a href= '+webPath+'/mobileAddress_edit?id='+item.id +' class="address-edit">';
						htmlContent+='</a>';
						htmlContent+='<h4 class="weui-media-box__title">';
						htmlContent+='<span>'+item.receivePersonName+'</span>';
						htmlContent+='<span>'+item.receivePersonPhone+'</span></h4>';	
						htmlContent+='<p class="weui-media-box__desc address-txt">'+item.province+item.city+item.area+item.address+'</p>';
						if (item.isDefault==1) {
							htmlContent+='<span class="default-add" style="background-color: #EA869A;margin-top: 10px;">默认地址</span>';				
						}
						htmlContent+=' </div>';
						htmlContent+=' </div>';						
					});
					$("#content").html(htmlContent);
				}
			}
	
		});
}

   
  });
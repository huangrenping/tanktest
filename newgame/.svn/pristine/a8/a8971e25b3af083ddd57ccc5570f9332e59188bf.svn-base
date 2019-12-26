/**
 * 
 */

$(function(){
	xingxing();
	submit();
})

	var num=5;
function xingxing(){
	
	
	$(".order-list-Below ul li").click(
		    function(){
		         num = $(this).index()+1;
		        var len = $(this).index();
		        var thats = $(this).parent(".order-list-Below ul").find("li");
		        if($(thats).eq(len).attr("class")=="on"){
		            if($(thats).eq(num).attr("class")=="on"){
		                $(thats).removeClass();
		                for (var i=0 ; i<num; i++) {
		                    $(thats).eq(i).addClass("on");
		                    
		                }
		            }else{
		                $(thats).removeClass();
		                for (var k=0 ; k<len; k++) {
		                    $(thats).eq(k).addClass("on");
		                   
		                }
		            }
		        }else{
		            $(thats).removeClass();
		            for (var j=0 ; j<num; j++) {
		                $(thats).eq(j).addClass("on");
		               
		            }
		        }
		        
		        
		        
		    }
		);
}

function submit(){
	$("#btn").on('click',function(){
		var arr=new Array();
		$(".mycomment").each(function(idx,item){
			var com={};
			com.level=$(this).find(".on").length;
			com.goodsId=$(this).find("p").attr("goodsId");
			debugger
			com.content=$(this).find("textarea").val();
			var imgs="";
			$(this).find(".upload-img").each(function() {
				imgs+=$(this).attr("xxx")+",";
			})
			com.showimgs=imgs;
			var checkbox = document.getElementById('s11');
			var is_show_name;
			if(checkbox.checked){
				is_show_name=1;
			}else{
				is_show_name=0;
			}
			com.isShowName=is_show_name;
			arr.push(com);
		})

		$.ajax({
			url:webPath+'/comment/pingjia',
			data:{"comlist":JSON.stringify(arr)},
			type:'POST',
			dataType:'json',
			data:{"comlist":JSON.stringify(arr),"orderInfoId":$("#orderInfoId").val()},
			success:function(json){
				if(json.code==200){
					layer.msg(json.msg);
					location.href=webPath+'/toLookOrders?state=5';
				}
			},
			error:function(){
				
			}
			
		});
		
	})
}


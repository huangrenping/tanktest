 /**
	  * 订单管理
* */
layui.define(['form','layer','laypage','laydate'], function(exports){
	var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;
	 exports('OderInfoList', {});
   //注意，这里是模块输出的核心，模块名必须和list时的模块名一致

	//一进入,页面进行全查询
	 getOrdeInfoAll();
	//分页查询功能,进入主页面,进行分页查询
	 function getOrdeInfoAll(pageNum){
	 	layer.load();
	 	var data = {};
	 	data.pageNum = pageNum||'1';
	 	$.ajax({
	 		url:webPath+'/order/OrderInfoList',
	 		dataType:'json',
	 		data:data,
	 		type:'post',
	 		error:function(){
	 			layer.msg('服务器连接失败,请刷新...', {tips: [1, '#c00']});
	 		},
	 		success:function(json){
	 		  layer.closeAll('loading');
	           if(json.code==200){
	         	  var pageObj = json.data;
	         	  var pageList = json.data.list;
	         	  var html = "";
	         	  //数据封装
	         	   $("#content").empty();
	         	   $.each(pageList,function(index,item){
	         		   var state = item.state;
	         		   var statec;
	         		   var payMethod = item.payMethod;
	         		   var pay;
	         		   if(state==1){
	 						statec="未付款";
	 					}else if(state==2){
	 						statec="待发货";
	 					}else if(state==3){
	 						statec="已发货";
	 					}else{
	 						statec="已签收";
	 					}
	         		   if(payMethod==1){
	         			   pay = "微信";
	         		   }else{
	         			   pay = "支付宝";
	         		   }  
	         			   html += "<tr>";
	     				   html += "<td>"+item.no+"</td>";
	     				   html += "<td>"+pay+"</td>";
	     				   html += "<td>"+item.freight+"</td>";
	     				   html += "<td>"+item.money+"</td>";
	     				   html += "<td>"+statec+"</td>";
	     				   if (item.payTime==null) {
	     					  html += "<td></td>";
						 }else {
							 html += "<td>"+item.payTime+"</td>";	
						}
	     				   if (item.deliveryTime==null) {
		     					  html += "<td></td>";
							 }else {
								 html += "<td>"+item.payTime+"</td>";	
							}
	     				   if (item.receivingTime==null) {
		     					  html += "<td></td>";
							 }else {
								 html += "<td>"+item.payTime+"</td>";	
							}	     				      				   
	     				   html += "<td>"+item.isComment+"</td>";
	     				   html += "<td>"+item.user.username+"</td>";
	     				   html += "<td>"+item.address.address+"</td>";
	     				   html += "<td>"+item.createtime+"</td>";
	     				   html += '<td>'+
	     				   					'<div class="tpl-table-black-operation">'+
	     				   						'<a href="javascript:;" class="updateId" state="'+item.state+'" updateid="'+item.id+'"><i class="am-icon-pencil"></i> 处理</a>'+
	     				   					'</div>'+
	     				   				'</td>';
	     				   html += "</tr>";
	         		
	     		   });
	         	   $("#content").append(html);
	         	   //显示分页功能
					var pagination = new Pagination({
	 			      	  wrap: $('.am-pagination'), // 存放分页内容的容器
	 			      	  count: pageObj.pages, // 总页数
	 			      	  current: pageObj.pageNum, // 当前的页数（默认为1）
	 			      	  prevText: '上一页', // prev 按钮的文本内容
	 			      	  nextText: '下一页', // next 按钮的文本内容
	 			      	  callback: function(page) { // 每一个页数按钮的回调事件
	 			      	    if(getaddall){
	 			      	    	getaddall(page);
	 			      	    }
	 			      	  }
	 			      	});
	           }else{
	         	  //没有数据的时候显示
	         	  $("#example-r").after(hp_noData);
	           }
	 		
	 		}
	 	});
	 }	 	 
	 getBtn(); 
	//管理员发货的的管理
	 function getBtn(){
	 	$(document).on('click','.updateId',function(){
	 		var id = $(this).attr("updateid");
//	 		var state = $(this).attr("state");
	 		//用户付款状态
	 		var statec = $(this).parent().parent().parent().find("td:eq(4)").text();
	 		if(statec=="待发货"){
	 			layer.confirm('确定发货吗？',{icon:1,title:['提示']},function(index){
	 				$.ajax({
	 					url:webPath+'/order/updateOrderState',
	 					dataType:'json',
	 					data:{'id':id,"state":3},
	 					type:'post',
	 					error:function(){
	 						layer.msg('服务器连接失败,请刷新...', {tips: [1, '#c00']});
	 					},
	 					success:function(json){
	 						if(json.state==500){
	 							layer.msg(json.msg,{icon: 2});
	 							return false;
	 						}else{
	 							layer.msg(json.msg, {tips: [1, '#c00']});
	 							// 刷新订单列表
	 							getOrdeInfoAll();
	 						}
	 					}
	 					
	 				});
	 				layer.close(index);
	 			});
	 		}else if(statec=="已发货"){
	 			layer.msg("该订单已发货",{icon:1,time:2000});
	 		}else if(statec=="未付款"){
	 			layer.msg("该订单还未付款",{icon:2,time:2000});
	 		}else{
	 			layer.msg("有事call物流",{icon:1,time:2000});
	 		}
	 	});
	 }
	 
	 
	 
	 
	 
	 
	 
	 
	 
 

	 
})
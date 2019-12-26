 /**
	  * 收货地址管理
* */
layui.define(['form','layer','laypage','laydate'], function(exports){
	var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;
	 exports('list', {});
   //注意，这里是模块输出的核心，模块名必须和list时的模块名一致
	//一进入,页面进行全查询
	 getaddall();
	 //增加弹窗
	 getreceiveadd();
	 //编辑弹窗
	 getreceedit();
	 //删除
	 deleteaddress();
	
	
	 //一进入,页面进行全查询
	 function getaddall(pageNum){
	 	layer.load();
	 	var data={};
	 	data.pageNum = pageNum||'1';
	 	$.ajax({
	 		url:webPath+"/receiveAddress/allAddress",
	 	    data:data,
	 	    type:'post',
	 	    cache:false,
	 	    dataType:'json',
	 	    error : function(XMLHttpRequest, textStatus, errorThrown) {
	 			layer.closeAll('loading');
	 			layer.msg("网络异常!请刷新。。。")
	 		}, 
	 	    success:function(json){
	 	    	layer.closeAll('loading');
	 			if(json.data && json.data.list.length>0){
	 				var pageObj=json.data;
	 				var pageList=json.data.list;
	 				//数据封装
	 				$("#addressbody").empty();
	 				$.each(pageList,function(index,item){
	 					if(item.id!=null&&item.id>=0){
	 						 var Default1=item.isDefault;
	 						 var flag="";
	 						 if(Default1==1){
	 							flag="是" 
	 						 }else{
	 							flag="否"
	 						 }
	 						$("#addressbody").append('<tr>'+
	 								'<td class="hp-td">'+item.id+'</td>' +
	                                 '<td class="hp-td">'+item.receivePersonName+'</td>' +
	                                 '<td class="hp-td">'+item.receivePersonPhone+'</td>' +
	                                 '<td class="hp-td">'+item.userId+'</td>' +
	                                 '<td class="hp-td">'+item.province+'</td>' +
	                                 '<td class="hp-td">'+item.provinceCode+'</td>' +
	                                 '<td class="hp-td">'+item.city+'</td>' +
	                                 '<td class="hp-td">'+item.cityCode+'</td>' +
	                                 '<td class="hp-td">'+item.area+'</td>' +
	                                 '<td class="hp-td">'+item.areaCode+'</td>' +
	                                 '<td class="hp-td">'+item.address+'</td>' +
	                                 '<td class="hp-td">'+flag+'</td>' +
	                                 '<td class="hp-td">'+item.createtime+'</td>' +
	                                 '<td class="hp-td">'+item.updatetime+'</td>' +
	                                 '<td class="hp-td">' +
	                                     '<div class="tpl-table-black-operation">' +
	                                         '<a id="receupd" class="updateBtn" href="javascript:;">' +
	                                             '<i class="am-icon-pencil"></i> 编辑' +
	                                         '</a>' +
	                                         '<a  id="'+item.id+'" class="delBtn" href="javascript:;" class="tpl-table-black-operation-del">' +
	                                             '<i class="am-icon-trash"></i> 删除' +
	                                         '</a>' +
	                                     '</div>' +
	                                 '</td>' +
	                             '</tr>');
	 					}
	 					
	 				});
	 				// 显示 开启 分页功能
	 				//common.showPage(pageObj.pages,pageObj.pageNum,getaddall);
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


	 //增加弹窗
	 function getreceiveadd(){
	 	$(document).on('click','#savebut',function(){
	 		layer.closeAll();
	 		layer.open({
	 			type:2,
	 			title:['增加收货地址'],
	 			area:['830px','510px'],
	 			shade:0.3,
	 			resize:false,
	 			closeBtn:1,
	 			anim:0,
	 			content:[webPath +"/receiveAddress/toaddAddress",'no'],
	 	    	end:function(){
	 	    		getaddall(1);
	 	    	}
	 		});
	 	});
	 }

	 //编辑弹窗
	 function getreceedit(){
	 	$(document).on('click','#receupd',function(){
	 		var id = $(this).parent().parent().parent().find("td:eq(0)").text();
	 		layer.closeAll();
	 		layer.open({
	 			type:2,
	 			title:['编辑收货地址'],
	 			area:['830px','510px'],
	 			shade:0.3,
	 			resize:false,
	 			closeBtn:1,
	 			anim:0,
	 			content:[webPath +'/receiveAddress/getOneAddress?rid='+id,'no'],
	 	    	end:function(){
	 	    		getaddall(1);
	 	    	}
	 		});
	 	});
	 }
	 //删除
	 function deleteaddress(){
	 	$(document).on('click','.delBtn',function(){
	 		var id = $(this).attr("id");
	 		$.ajax({
	 			type:"post",
	 			url:webPath +'/receiveAddress/deleteAddress?rid='+id,
	 			async:true,
	 			success:function(data){
	 				if(data.code==200){
	 					layer.msg("操作成功");
		 			}else{
		 				layer.msg("对不起,服务器连接不上,请刷新");
		 			}
	 				getaddall(1);
	 			}
	 		});
	 		
	 	});
	 }
	 
	 
	 
	 
	 
	 
})
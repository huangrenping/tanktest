 /**
	  * 轮播图管理
* */
layui.define(['form','layer','laypage','laydate'], function(exports){
	var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;
	 exports('NewsList', {});
   //注意，这里是模块输出的核心，模块名必须和list时的模块名一致
	//一进入,页面进行全查询
	 getaddall();
	 //增加弹窗
	 getreceiveadd();
	 //编辑弹窗
	 getreceedit();
	 //一进入,页面进行全查询
	 function getaddall(pageNum){
	  var index=layer.load();
	 	var data={};
	 	data.pageNum = pageNum||'1';
	 	$.ajax({
	 		url:webPath+"/news/showNewsList",
	 	    data:data,
	 	    type:'post',
	 	    cache:false,
	 	    addataType:'json',
	 	    error : function(XMLHttpRequest, textStatus, errorThrown) {
	 			layer.close(index);
	 			layer.msg("网络异常!请刷新。。。")
	 		}, 
	 	    success:function(json){
	 	    	layer.close(index);
	 			if(json.data && json.data.list.length>0){
	 				var pageObj=json.data;
	 				var pageList=json.data.list;
	 				//数据封装
	 				$("#news").empty();
	 				$.each(pageList,function(index,item){
	 					if(item.id!=null&&item.id>=0){
	 						$("#news").append('<tr>'+
	 								  '<td class="hp-td">'+(index+1)+'</td>' +
	                                 '<td class="hp-td" >'+item.title+'</td>' +                
	                                 '<td class="hp-td">'+item.createtime+'</td>' +	                          
	                                 '<td class="hp-td">' +
	                                     '<div class="tpl-table-black-operation">' +
	                                         '<a id="receupd" idname="'+item.id+'" class="updateBtn" href="javascript:;">' +
	                                             '<i class="am-icon-pencil"></i> 编辑' +
	                                         '</a>' +
	                                         '<a  id="delete"  idname="'+item.id+'" class="delBtn" href="javascript:;" class="tpl-table-black-operation-del">' +
	                                             '<i class="am-icon-trash"></i> 删除' +
	                                         '</a>' +
	                                     '</div>' +
	                                 '</td>' +
	                             '</tr>');
	 					}
	 					
	 				});
	 				// 显示 开启 分页功能
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
	 			title:['增加新闻'],
	 			area:['880px','790px'],
	 			shade:0.3,
	 			resize:false,
	 			closeBtn:1,
	 			anim:0,
	 			content:[webPath +"/news/toaddNews"],
	 	    	end:function(){
	 	    		getaddall(1);
	 	    	}
	 		});
	 	});
	 }	 
	 //编辑弹窗
	 function getreceedit(){
	 	$(document).on('click','.updateBtn',function(){
	 		//var id = $(this).parent().parent().parent().find("td:eq(0)").text();
	 		var id=$(this).attr("idname");
	 		layer.closeAll();
	 		layer.open({
	 			type:2,
	 			title:['编辑新闻'],
	 			area:['880px','790px'],
	 			shade:0.3,
	 			resize:false,
	 			closeBtn:1,
	 			anim:0,
	 			content:[webPath +"/news/toupNews?id="+id,'no'],
	 	    	end:function(){
	 	    		getaddall(1);
	 	    	}
	 		});
	 	});
	 }
	 deleteNews();
	 //删除
	 function deleteNews(){
			 	$(document).on('click','.delBtn',function(){
			 		var id=$(this).attr("idname");
					layer.confirm('确定删除？',{icon:3, title:'提示信息'},function(index){
						$.ajax({
							type:"get",
							url:webPath +"/news/ajax/deleteNews?id="+id,
							async:true,
							success:function(data){
								if(data.code==200){
									$(this).parents("tr").remove();
									getaddall(1);
									layer.msg(data.msg);
								}else{
									layer.msg(data.msg);
								}
							}						
						});
					});
					return false;
			 	});
			 }
	 
})
 /**
	  * 商品类型大类型管理
* */
layui.define(['form','layer','laypage','laydate'], function(exports){
	var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;
	 exports('specificationslist', {});
   //注意，这里是模块输出的核心，模块名必须和goodstypebiglist时的模块名一致
	//一进入,页面进行全查询
	 getaddall();
	 
	
	
	 //一进入,页面进行全查询
	 function getaddall(pageNum){
	 	layer.load();
	 	var data={};
	 	data.name=$("#typebigname").val();
	 	data.pageNum = pageNum||'1';
	 	$.ajax({
	 		url:webPath+"/specifications/ajax/specificationslist",
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
	 	    	$("#CarouselImg").html("");
	 			if(json.data && json.data.list.length>0){
	 				var pageObj=json.data;
	 				var pageList=json.data.list;
	 				//数据封装
	 				$("#CarouselImg").empty();
	 				$.each(pageList,function(index,item){
	 					if(item.id!=null&&item.id>=0){
	 						$("#CarouselImg").append('<tr>'+
	 								'<td class="hp-td">'+(index+1)+'</td>' +
	 								'<td class="hp-td">'+item.name+'</td>' +
	                                 '<td class="hp-td">'+item.mark+'</td>' +
	                                 '<td class="hp-td">'+item.createtime+'</td>' +	
	                                 '<td class="hp-td">'+item.updatetime+'</td>' +
	                                 '<td class="hp-td">' +
	                                     '<div class="tpl-table-black-operation">' +
	                                         '<a href="'+item.id+'" id="upd-btn" class="updateBtn" href="javascript:;">' +
	                                             '<i class="am-icon-pencil"></i> 编辑' +
	                                         '</a>' +
	                                         '<a  href="'+item.id+'" class="delBtn" id="del-btn" class="tpl-table-black-operation-del">' +
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
	 				//$("#example-r").after(hp_noData);
	 			}
	 	    }
	 	});
	 }
	 
	 //点击进行模糊查询
	 $("#find-btn").click(function(){
		 getaddall(1);
		 return false;
	 });
	 
	//删除
	 $("tbody").on("click","#del-btn",function(){
		 var _this = $(this);
		 $('#my-confirm').modal({
		        relatedTarget: this,
		        onConfirm: function(options) {
		          var $link = $(this.relatedTarget).prev('a');
		          $.ajax({
						type:"get",
						url:webPath+"/specifications/ajax/deleteitem",
						data:{"id":_this.attr("href")},
						async:true,
						success:function(json){
							if(json.code==200){
								_this.parents("tr").remove();
								getaddall(1);
								layer.msg(json.msg);
							}else{
								layer.msg(json.msg);
							}
						}
		          });	
		          
		          
		        },
		        onCancel: function() {
		        }
		      });
		 	
			return false;
	 });
	
	//增加
	 $("#save-btn").click(function(){
		 //alert("goto");
		 layer.closeAll();
		 layer.open({
	 			type:2,
	 			title:['增加'],
	 			area:['680px','680px'],
	 			shade:0.3,
	 			resize:false,
	 			closeBtn:1,
	 			anim:0,
	 			content:[webPath +"/specifications/toAdd",'no'],
	 	    	end:function(){
	 	    		getaddall(1);
	 	    	}
	 		});
	 });
	 
	//修改
	 $("tbody").on("click","#upd-btn",function(){
		 var _this = $(this);
		 layer.closeAll();
		 layer.open({
	 			type:2,
	 			title:['编辑'],
	 			area:['680px','680px'],
	 			shade:0.3,
	 			resize:false,
	 			closeBtn:1,
	 			anim:0,
	 			content:[webPath +"/specifications/toAdd?id="+_this.attr("href"),'no'],
	 	    	end:function(){
	 	    		getaddall(1);
	 	    	}
	 		});
		 return false;
	 });
	 
})
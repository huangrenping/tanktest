 /**
	  * 收货地址管理
* */
layui.define(['form','layer','laypage','laydate'], function(exports){
	var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;
	 exports('list', {});
   //注意，这里是模块输出的核心，模块名必须和list时的模块名一致
	//一进入,页面进行全查询
	 getaddall();
	 $("#search-goods-btn").click(function(){
		 getaddall();
		 return false;
	 });
	 //一进入,页面进行全查询
	 function getaddall(pageNum){
	 	var index = layer.load();
	 	var data={};
	 	data.name=$("#titleName").val();
	 	data.pageNum = pageNum||'1';
	 	$.ajax({
	 		url:webPath+"/goods/ajax/getRenqiGoodList",
	 	    data:data,
	 	    type:'post',
	 	    cache:false,
	 	    dataType:'json',
	 	    error : function(XMLHttpRequest, textStatus, errorThrown) {
	 			layer.close(index);
	 			layer.msg("网络异常!请刷新。。。")
	 		}, 
	 	    success:function(json){
	 	    	var html_content="";
	 	    	layer.close(index);
	 	    	$("#goodstbody").html("");
	 			if(json.data && json.data.list.length>0){
	 				var pageObj=json.data;
	 				var pageList=json.data.list;
	 				//数据封装
	 				$.each(pageList,function(index,item){
	 					html_content+='<tr class="even gradeC">';
	 					html_content+='<td><img src="'+webPath+'/'+item.coverimg+'" class="tpl-table-line-img" alt=""></td>';
	 					html_content+='<td class="am-text-middle">'+(index+1)+'</td>';
	 					html_content+='<td class="am-text-middle">'+item.name+'</td>';
	 					html_content+='<td class="am-text-middle">'+item.title+'</td>';
	 					html_content+='<td class="am-text-middle">'+item.subtitle+'</td>';
	 					html_content+='<td class="am-text-middle">'+item.price+'</td>';
	 					html_content+='<td class="am-text-middle">'+item.freight+'</td>';
	 					html_content+='<td class="am-text-middle">'+item.num+'</td>';
	 					html_content+='<td class="am-text-middle">'+item.collectionnum+'</td>';
	 					html_content+='<td class="am-text-middle">'+item.salenum+'</td>';
//	 					html_content+='<td class="am-text-middle">'+item.goodsTypeSmall.name+'</td>';
	 					html_content+='<td class="am-text-middle">'+item.createtime+'</td>';
//	 					html_content+='<td class="am-text-middle"><div class="tpl-switch"><input type="checkbox" class="ios-switch bigswitch tpl-switch-btn" id="check-switch-btn" goodsid="'+item.id+'" '+isChecked+'><div class="tpl-switch-btn-view"><div></div></div></div></td>';
//	 					html_content+='<td class="am-text-middle"><div class="tpl-switch"><form class="layui-form"><input type="checkbox" name="yyy" lay-skin="switch" lay-text="是|否" checked></form></div></td>';
//	 					html_content+='<td class="am-text-middle">';
//	 					html_content+='<div class="tpl-table-black-operation ">';
//	 					html_content+='<a goodsid="'+item.id+'" class="btn_updategoods" href="javascript:;"><i class="am-icon-pencil"></i> 编辑</a>';
//	 					html_content+='<a goodsid="'+item.id+'" href="javascript:;" class="tpl-table-black-operation-del btn_delgoods"><i class="am-icon-trash"></i> 删除</a>';
	 					html_content+='</td></tr>';
	 				});
	 				$("#goodstbody").html(html_content);
	 				form.render();
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
	 				$("#goodstbody").html("没有查询到商品信息");
	 			}
	 	    }
	 	});
	 }
})
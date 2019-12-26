 /**
	  * 订单管理
* */
layui.define(['form','layer','laypage','laydate'], function(exports){
	var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;
	 exports('orderInfoDetail', {});
   //注意，这里是模块输出的核心，模块名必须和list时的模块名一致

	//一进入,页面进行全查询
	 getOrdeInfoAll();
	//分页查询功能,进入主页面,进行分页查询
	 function getOrdeInfoAll(pageNum){
	 	layer.load();
	 	var data = {};
	 	data.pageNum = pageNum||'1';
	 	$.ajax({
	 		url:webPath+'/order/orderInfoDetail',
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
	         			   html += "<tr>";
	     				   html += "<td>"+(index+1)+"</td>";
	     				   html += "<td>"+"<img src='"+webPath+'/'+item.goodsImg+"' width='100px' >"+"</td>";
	     				   html += "<td>"+item.title+"</td>";
	     				   html += "<td>"+item.num+"</td>";
	     				   html += "<td>"+item.price+"</td>";
	     				   html += "<td>"+item.countMoney+"</td>";     				      				   
	     				   html += "<td>"+item.specificationsInfo+"</td>";
	     				   html += "<td>"+item.createtime+"</td>";
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
})
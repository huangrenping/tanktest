 /**
	汪雄威
	用户管理分页查询
	2019-9-5
* */
layui.define(['form','layer','laypage','laydate'], function(exports){
	var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;
	 exports('userlisttype', {});
   //注意，这里是模块输出的核心，模块名必须和list时的模块名一致
	//一进入,页面进行全查询
	 getaddall();
	 //增加弹窗
	 getreceiveadd();
	 //编辑弹窗
	 getreceedit();
	 //删除用户
	 deleteoneuser();
	 //下拉框显示
	 //select();
	 //根据用户等级与用户ID查询
	 queryidandlevel();
	
		
	 //一进入,页面进行全查询
	 function getaddall(pageNum,url){
		 queryAll(pageNum,"/usertype/selectallusertypepage");
	 }
	 function queryAll(pageNum,url){
	 	layer.load();
	 	var data={};
	 	data.pageNum = pageNum||'1';
	 	$.ajax({
	 		url:webPath+url,
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
	 					if(item.rolename=='超级管理员'){
	 						$("#addressbody").append('<tr class="gradeX">'+
	 								'<td class="am-text-middle">'+(index+1)+'</td>' +
	 								'<td class="am-text-middle" style="display: none">'+(item.roleid)+'</td>' +
	                                 '<td class="am-text-middle">'+item.rolename+'</td>' +
	                                 '<td class="am-text-middle">'+item.description+'</td>'+ '<td class="am-text-middle">' +
                                     '<div class="tpl-table-black-operation">' +
                               
                                 '</div>' +
                             '</td>' +
                         '</tr>');
	 					}else{
	 						$("#addressbody").append('<tr class="gradeX">'+
	 								'<td class="am-text-middle">'+(index+1)+'</td>' +
	 								'<td class="am-text-middle" style="display: none">'+(item.roleid)+'</td>' +
	                                 '<td class="am-text-middle">'+item.rolename+'</td>' +
	                                 '<td class="am-text-middle">'+item.description+'</td>'+
	                                 '<td class="am-text-middle">' +
	                                     '<div class="tpl-table-black-operation">' +
	                                         '<a id="selectoneuser" class="updateBtn" href="javascript:;">' +
	                                             '<i class="am-icon-pencil"></i> 编辑' +
	                                         '</a>' +
	                                         '<a  id="deleteoneuser" class="delBtn" href="javascript:;" class="tpl-table-black-operation-del">' +
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
	 	$(document).on('click','#myadd',function(){
	 		layer.closeAll();
	 		layer.open({
	 			type:2,
	 			title:['增加用户'],
	 			area:['80%','90%'],
	 			shade:0.3,
	 			resize:false,
	 			closeBtn:1,
	 			anim:0,
	 			content:[webPath +"/usertype/addusertype",'no'],
	 	    	end:function(){
	 	    		getaddall(1);
	 	    	}
	 		});
	 		
	 	});
	 }

	 //编辑弹窗
	 function getreceedit(){
		 
	 	$(document).on('click','#selectoneuser',function(){
	 		var id = $(this).parent().parent().parent().find("td:eq(1)").text();
	 		layer.closeAll();
	 		layer.open({
	 			type:2,
	 			title:['编辑用户'],
	 			area:['80%','90%'],
	 			shade:0.3,
	 			resize:false,
	 			closeBtn:1,
	 			anim:0,
	 			content:[webPath+'/usertype/selectoneusertype?id='+id],
	 	    	end:function(){
	 	    		getaddall(1);
	 	    	}
	 		});
	 	});
	 }
	 //逻辑删除
	 function deleteoneuser(){
	 	$(document).on('click','#deleteoneuser',function(){
	 		var id = $(this).parent().parent().parent().find("td:eq(1)").text();
	 		layer.closeAll();
	 		//
	 		layer.open({
	 			  content: '确定要删除吗？'
	 			  ,btn: ['确定', '取消']
	 			  ,yes: function(index, layero){
	 			 		layer.closeAll();
	 			 		$.ajax({
	 				 		url:webPath+"/user/deleteoneuser?id="+id,
	 				 	    type:'post',
	 				 	    cache:false,
	 				 	    error : function(XMLHttpRequest, textStatus, errorThrown) {
	 				 			layer.closeAll('loading');
	 				 			layer.msg("网络异常!请刷新。。。")
	 				 		}, 
	 				 	    success:function(json){
	 				 	    	layer.msg(json.msg,{time:1000})
	 				 	    	getaddall(1);
	 				 	    }
	 			 		})
	 			  }
	 			  ,btn2: function(index, layero){
	 			    //按钮【按钮二】的回调
	 			    
	 			    //return false 开启该代码可禁止点击该按钮关闭
	 			  }
	 			  ,cancel: function(){ 
	 			    //右上角关闭回调
	 			    
	 			    //return false 开启该代码可禁止点击该按钮关闭
	 			  }
	 			});

	 	});
	 }
	 /**
	  * 下拉框显示
	  * 
	  */
/*	 function select(){
	 		$.ajax({
			 		url:webPath+"/user/selectAllUserLevel",
			 	    type:'post',
			 	    cache:false,
			 	    error : function(XMLHttpRequest, textStatus, errorThrown) {
			 			layer.closeAll('loading');
			 			layer.msg("网络异常!请刷新。。。")
			 		}, 
			 	    success:function(json){
			 	    	var counhtml="";
			 	    	counhtml+='<option value="-1">请选择</option>';
			 	    	$.each(json.data, function(index,item) {
			 	    		counhtml+='<option value="'+item.id+'">'+item.name+'</option>'
						})
						$("#myselect").append(counhtml);
			 	    }
		 		})
	}*/
	 /*
	  * 根据用户等级跟用户ID查询
	  */
	 function queryidandlevel(pageNum,url){
		 $("#queryidandlevel").click(function(){
			 var userLevelId=$("#myselect").val();
			 var loginName=$("#loginName").val();
			 queryAll(pageNum,"/user/queryLevelandid?userLevelId="+userLevelId+"&loginName="+loginName);
		 })
	 }
	  	function jsonDateFormat(jsonDate) {//json日期格式转换为正常格式
	  	    try {//出自http://www.cnblogs.com/ahjesus 尊重作者辛苦劳动成果,转载请注明出处,谢谢!
	  	        var date = new Date(jsonDate);
	  	        var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
	  	        var day = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
	  	        var hours = date.getHours();
	  	        if(hours<10){
	  	        	hours="0"+hours;
	  	        }
	  	        var minutes = date.getMinutes();
		  	      if(minutes<10){
		  	    	minutes="0"+minutes;
		  	        }
	  	        var seconds = date.getSeconds();
		  	      if(seconds<10){
		  	    	seconds="0"+seconds;
		  	        }
	  	        var milliseconds = date.getMilliseconds();
	  	        return date.getFullYear() + "-" + month + "-" + day + " " + hours + ":" + minutes + ":" + seconds;
	  	    } catch (ex) {//出自http://www.cnblogs.com/ahjesus 尊重作者辛苦劳动成果,转载请注明出处,谢谢!
	  	        return "";
	  	    }
	  	}
	/**
	 * 正则表达his验证邮箱
	 */
	  	 function isEmail(str){
	         var reg = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
	         return reg.test(str);
	     }
	 
})
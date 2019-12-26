 /**
	  * 商品类型大类型管理
* */
layui.define(['form','layer','laypage','laydate'], function(exports){
	var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;
	 exports('goodstypesmalllist', {});
   //注意，这里是模块输出的核心，模块名必须和goodstypebiglist时的模块名一致
	//一进入,页面进行全查询
	 getaddall();
	 //增加弹窗
	// getreceiveadd();
	 //编辑弹窗
	 //getreceedit();
	
	
	 //一进入,页面进行全查询
	 function getaddall(pageNum){
	 	layer.load();
	 	var data={};
	 	data.name=$("#typebigname").val();
	 	data.goodsTypeId=$("#goodsTypeId").val();
	 	data.pageNum = pageNum||'1';
	 	$.ajax({
	 		url:webPath+"/goodstypesamll/ajax/goodstypesmalllist",
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
	 								'<td class="hp-td"><img style="width:100px;height:100px;" src="'+webPath+item.img+'"/></td>' +
	 								'<td class="hp-td">'+item.name+'</td>' +
	 								'<td class="hp-td">'+item.goodsTypeBig.name+'</td>' +
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
	
	 //加载大类类别
	 loadGoodsTypeBiglist();
	 function  loadGoodsTypeBiglist(){
		 $.ajax({
				url:webPath+'/goodstypebig/ajax/goodstypebiglistname',
				type:"post",
				success:function(json){
					$("#goodsTypeIds").val("");
					if(json.data && json.data.length>0){
		 				//var pageObj=json.data;
		 				var pageList=json.data;
		 				//数据封装
		 				$("#CarouselImg").empty();
		 				$.each(pageList,function(index,item){
		 					if(item.id!=null&&item.id>=0){
		 						$("#goodsTypeId").append(' <option value="'+item.id+'">'+item.name+'</option>');
		 						$("#goodsTypeIds").append(' <option value="'+item.id+'">'+item.name+'</option>');
		 					}
		 					
		 				});		
		 			}
					form.render("select");
				}
			});
	 }
	 
	 
	//删除
	 $("tbody").on("click","#del-btn",function(){
		 var _this = $(this);
			//layer.confirm('确定删除此信息？',{icon:3, title:'提示信息'},function(index){
				/*$.ajax({
					type:"get",
					url:"${webPath}/user/ajax/deleteUser",
					data:{"id":_this.attr("href")},
					async:true,
					success:function(data){
						if(data.statue){
							_this.parents("tr").remove();
							showUsersForPage(1);
							layer.msg(data.message);
						}else{
							layer.msg(data.message);
						}
					}
				});
				//layer.close(index);
			//});
		 */
		 $('#my-confirm').modal({
		        relatedTarget: this,
		        onConfirm: function(options) {
		          var $link = $(this.relatedTarget).prev('a');
		          $.ajax({
						type:"get",
						url:webPath+"/goodstypesamll/ajax/deleteitem",
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
		         // alert('算求，不弄了');
		        }
		      });
		 	
			return false;
	 });
	 
	 //添加
	 $("#save-btn").click(function(){
			// alert("goto");
			 window.location.href=webPath+"/goodstypesamll/toAdd";
		});
	
	 getreceedit();
	 //编辑弹窗
	 function getreceedit(){
	 	$(document).on('click','#upd-btn',function(){
	 		var _this = $(this);
	 		layer.closeAll();
	 		layer.open({
	 			type:1,
	 			title:['编辑'],
	 			area:['680px','680px'],
	 			shade:0.3,
	 			shadeClose : true,
	 			resize:false,
	 			closeBtn:1,
	 			anim:0,
	 			content:$("#upd-from"),
	 			success:function(layero, index){
	 				var body = layer.getChildFrame('body', index);
	 				$("#goodsTypeIds").html("");
	 				$.getJSON(webPath+"/goodstypesamll/ajax/loadEntity",{"id":_this.attr("href")},function(data){
	 					$("input[name='id']").prop("value",data.entity.id);
	 					$("input[name='name']").prop("value",data.entity.name);
	 				
	 					$("#goodsTypeIds").prepend("<option value='"+data.entity.goodsTypeBig.id+"' selected='selected'>"+data.entity.goodsTypeBig.name+"</option>");
	 					
	 					
	 					$("#imgUrl").attr("src",webPath+data.entity.img);
	 					$("#fImg").val(data.entity.img);
	 					
	 					form.render("select");
	 				});
	 				 $.ajax({
	 					url:webPath+'/goodstypebig/ajax/goodstypebiglistname',
	 					type:"post",
	 					success:function(json){
	 						$("#goodsTypeIds").val("");
	 						if(json.data && json.data.length>0){
	 			 				//var pageObj=json.data;
	 			 				var pageList=json.data;
	 			 				//数据封装
	 			 				$("#CarouselImg").empty();
	 			 				$.each(pageList,function(index,item){
	 			 					if(item.id!=null&&item.id>=0){
	 			 						$("#goodsTypeIds").append(' <option value="'+item.id+'">'+item.name+'</option>');
	 			 					}
	 			 					
	 			 				});		
	 			 			}
	 						form.render("select");
	 					}
	 				});
	 				
	 			},
	 			end:function(){
	 	    		getaddall(1);
	 	    	}
	 		});
	 		 return false;
	 	});
	 	
	 }
	 
	 
	 // 处理请求
		function processAajxSubmit(url,submitdata){
			$.ajax({
					type:"post",
					url:url,
					async:true,
					data:submitdata,
					success:function(json){
						if(json.code==200){
							$("#message").html(json.msg);
							var $modal = $('#my-alert');
							//$modal.modal(); 
							layer.msg(json.msg);
						}else{
							layer.msg(json.msg);
						}
						layer.closeAll('page');
					}
				});	
		}
		//监听保存
		$("body").on("click","#btn-save",function(data){
			var submitdata = $("#save-form").serialize();
					processAajxSubmit(webPath+"/goodstypesamll/ajax/additem",submitdata);
					return false;
		});
	 
	 
})



//上传图片，显示
layui.config({
	base : "js/"
}).use(['form','layer','jquery','upload','laydate'],function(){
	form = layui.form();
	var layer = parent.layer === undefined ? layui.layer : parent.layer;
		$ = layui.jquery;
		$form = $('form');
		laydate = layui.laydate;

  
	//  按钮绑定
		  $.hpUpload(webPath+"/goodstypesamll/ajax/upload",{"path":webPath},function(res){
			  
			  if(res.code==200){
			   		$("#imgUrl")[0].src=webPath+"/"+res.imgPath;
			   		$("#fImg").val(res.imgPath);
			   }
		  }); 
})
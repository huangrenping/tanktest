<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="<%=path %>/assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="<%=path %>/assets/i/app-icon72x72@2x.png">
    <link rel="stylesheet" href="<%=path %>/assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="<%=path %>/assets/css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="<%=path %>/assets/css/app.css">
    <script src="<%=path %>/assets/js/jquery.min.js"></script>
    <script src="<%=path %>/assets/js/amazeui.min.js"></script>
    <script src="<%=path %>/assets/js/app.js"></script>
    <script src="<%=path %>/assets/js/theme.js"></script>
    <script src="<%=path %>/assets/js/amazeui-pagination.js"></script>
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
    <script type="text/javascript">
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
	 			content:[webPath +"/adm/usertype/saveusertype.jsp",'no'],
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
</script>
</head>
<body class="theme-black">
        <!-- 内容区域 -->
    
            <div class="theme-black">
                <div class="row">
                    <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                        <div class="widget am-cf">
                            <div class="widget-head am-cf">
                                <div class="widget-title  am-cf">用户类型列表</div>


                            </div>
                            <div class="widget-body  am-fr">

                                <div class="am-u-sm-12 am-u-md-6 am-u-lg-6">
                                    <div class="am-form-group">
                                        <div class="am-btn-toolbar">
                                            <div class="am-btn-group am-btn-group-xs">
                                                <button type="button" class="am-btn am-btn-default am-btn-success" id="myadd"><span class="am-icon-plus"></span> 新增</button>
<!--                                                 <button type="button" class="am-btn am-btn-default am-btn-secondary"><span class="am-icon-save"></span> 保存</button>
                                                <button type="button" class="am-btn am-btn-default am-btn-warning"><span class="am-icon-archive"></span> 审核</button>
                                                <button type="button" class="am-btn am-btn-default am-btn-danger"><span class="am-icon-trash-o"></span> 删除</button> -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- <div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
                                    <div class="am-form-group tpl-table-list-select">
                                        <select data-am-selected="{btnSize: 'sm'}" id="myselect">
							            </select>
                                    </div>
                                </div>
                                <div class="am-u-sm-12 am-u-md-12 am-u-lg-3">
                                    <div class="am-input-group am-input-group-sm tpl-form-border-form cl-p">
                                        <input type="text" class="am-form-field " placeholder="请输入账号" id="loginName">
                                        <span class="am-input-group-btn">
								            <button class="am-btn  am-btn-default am-btn-success tpl-table-list-field am-icon-search" id="queryidandlevel" type="button"></button>
								        </span>
                                    </div>
                                </div> -->

                                <div class="am-u-sm-12">
                                    <table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black ">
                                        <thead>
                                            <tr>
                                                <th>编号</th>
                                                <th>账号类型</th>
                                                <th>账号功能</th>
                                            </tr>
                                        </thead>
                                        <tbody id="addressbody">
                                        </tbody>
                                    </table>
                                </div>
                   				 <div class="am-u-lg-12 am-cf">
                                    <div class="am-fr">
                                        <ul class="am-pagination tpl-pagination"></ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
     
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="web.webSocket.login.LoginManager,
		    web.webSocket.player.PlayerManager,
		    java.util.*,
		    java.util.Date,
		    net.sf.json.JSONArray,
		    net.sf.json.JsonConfig,
		    java.text.SimpleDateFormat,
		    web.webSocket.pojo.WgPlayerserver,
		    web.webSocket.pojo.WgFeedback"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		 /**
	汪雄威
	用户管理分页查询
	2019-9-5
* */
layui.define(['form','layer','laypage','laydate'], function(exports){
	var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;
	 exports('feedbacklist', {});
   //注意，这里是模块输出的核心，模块名必须和list时的模块名一致
	//一进入,页面进行全查询
	 getaddall();
	 //增加弹窗
	 //getreceiveadd();
	 //编辑弹窗
	 //getreceedit();
	 //删除用户
	 //deleteoneuser();
	 //下拉框显示
	 //select();
	 //根据用户等级与用户ID查询
	 //queryidandlevel();
	 getreceedit();
 	 answeredit();
		
	 //一进入,页面进行全查询
	 function getaddall(pageNum,url){
		 queryAll(pageNum,"/selectfeedbackpageno");
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
	 	    shadeClose:true,
	 	    resize:false,
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
	 				var num = pageNum||'1';
	 				$.each(pageList,function(index,item){
	 						var newanswer="";
	 						var newstatus="";
	 						if(item.answer!=null){
	 							if(item.answer.length>=20){
	 								newanswer=item.answer.substring(0,20)+"...";
	 							}else{
	 								newanswer=item.answer;
	 							}
	 						}
	 						if(item.status!=0){
	 							newstatus="是";
	 						}
	 						var newcontent="";
	 						if(item.content.length>=20){
	 							newcontent=item.content.substring(0,20)+"...";
	 						}else{
	 							newcontent=item.content;
	 						}
	 						var replypeople="";
	 						if(item.replypeople!=null){
	 							replypeople=item.replypeople;
	 						}
	 						$("#addressbody").append('<tr class="gradeX">'+
	 								'<td class="am-text-middle">'+(index+1+(num-1)*16)+'</td>' +
	 								'<td class="am-text-middle">'+item.id+'</td>' +
	                                '<td class="am-text-middle">'+item.serverid+'</td>' +
	                                '<td class="am-text-middle">'+item.uid+'</td>' +
	                                '<td class="am-text-middle">'+item.playername+'</td>' +
	                                '<td class="am-text-middle">'+newcontent+'</td>' +
	                                '<td class="am-text-middle">'+newanswer+'</td>' +
	                                '<td class="am-text-middle">'+item.contact+'</td>' +
	                                '<td class="am-text-middle">'+item.datestr+'</td>' +
	                                '<td class="am-text-middle">'+newstatus+'</td>' +
	                                '<td class="am-text-middle">'+replypeople+'</td>' +
	                                '<td class="am-text-middle">'+item.answertime2+'</td>' +
	                                '<td class="am-text-middle">'+
	                                     '<div class="tpl-table-black-operation">'+
	                                         '<a id="selectoneuser" class="updateBtn" href="javascript:;">'+
	                                             '<i class="am-icon-pencil"></i>查看'+
	                                         '</a>'+
	                                         '<a  id="answer" class="updateBtn" href="javascript:;">'+
	                                             '<i class="am-icon-pencil"></i>回复'+
	                                         '</a>'+
	                                     '</div>'+
	                                 '</td>'+
	                             '</tr>');                 
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
	 	//
	 }

	//编辑弹窗
	 function getreceedit(){
	 	$(document).on('click','#selectoneuser',function(){
	 		var id = $(this).parent().parent().parent().find("td:eq(1)").text();
	 		var sid = $(this).parent().parent().parent().find("td:eq(2)").text();
	 		var serveruid = $(this).parent().parent().parent().find("td:eq(3)").text();
	 		debugger;
	 		layer.closeAll();
	 		layer.open({
	 			type:2,
	 			title:['反馈内容'],
	 			area:['80%','90%'],
	 			shade:0.3,
	 			resize:false,
	 			shadeClose:true,
	 			closeBtn:1,
	 			anim:0,
	 			content:[webPath+'/adm/feedback/feedbackinfo.jsp?id='+id+'&sid='+sid+'&serveruid='+serveruid],
	 	    	end:function(){
	 	    		//window.location.reload();
	 	    	}
	 		});
	 	});
	 };
	 
	  //回复弹窗
	 function answeredit(){
	 	$(document).on('click','#answer',function(){
	 		var id = $(this).parent().parent().parent().find("td:eq(1)").text();
	 		var sid = $(this).parent().parent().parent().find("td:eq(2)").text();
	 		var serveruid = $(this).parent().parent().parent().find("td:eq(3)").text();
	 		layer.closeAll();
	 		layer.open({
	 			type:2,
	 			title:['反馈内容'],
	 			area:['80%','90%'],
	 			shade:0.3,
	 			resize:false,
	 			shadeClose:true,
	 			closeBtn:1,
	 			anim:0,
	 			content:[webPath+'/adm/feedback/answerfeedback.jsp?id='+id+'&sid='+sid+'&serveruid='+serveruid],
	 	    	end:function(){
	 	    		window.location.reload();
	 	    	}
	 		});
	 	});
	 };
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
                                <div class="widget-title  am-cf">反馈列表</div>


                            </div>
                            <div class="widget-body  am-fr">

                                <div class="am-u-sm-12 am-u-md-6 am-u-lg-6">
                                    <div class="am-form-group">
                                        <div class="am-btn-toolbar">
                                            <div class="am-btn-group am-btn-group-xs">
                                                <%-- <button type="button" class="am-btn am-btn-default am-btn-success" id="myadd"><span class="am-icon-plus"></span> 新增</button> --%>
<!--                                                 <button type="button" class="am-btn am-btn-default am-btn-secondary"><span class="am-icon-save"></span> 保存</button>
                                                <button type="button" class="am-btn am-btn-default am-btn-warning"><span class="am-icon-archive"></span> 审核</button>
                                                <button type="button" class="am-btn am-btn-default am-btn-danger"><span class="am-icon-trash-o"></span> 删除</button> -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                	<!-- 内容区域 -->
							<form action="allwglist.jsp" method="post" id="hp_form" name="hp_form" data-am-validator
							class="am-form tpl-form-line-form">
                               
                                <div class="am-u-sm-12 am-u-md-12 am-u-lg-3">
                                    <div class="am-input-group am-input-group-sm tpl-form-border-form cl-p" style="display: inline;">
                                        <!--  <input type="text" class="am-form-field " placeholder="" readonly="readonly" id="userName" name="userName" style="display: inline;"> -->
	                                        <span class="am-input-group-btn" style="display: inline;">
									           <!--  <button class="am-btn  am-btn-default am-btn-success tpl-table-list-field am-icon-search" id="queryuser" name="queryuser" type="button" onclick="selectwg();"></button> -->
									        </span>
                                    </div>
                                </div>
								</form>
                                <div class="am-u-sm-12">
                                    <table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black " id="example-r">
                                        <thead>
                                            <tr>
                                                <th>编号</th>
                                                <th>id</th>
                                                <th>服务器</th>
                                                <th>uid</th>
                                                <th>玩家昵称</th>
                                                <th>提问内容</th>
                                                <th>回复内容</th>
                                                <th>联系方式</th>
                                                <th>时间</th>
                                                <th>是否回复</th>
                                                <th>回复人</th>
                                                <th>回复时间</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody id="addressbody">
												<%--  <s:forEach var="newFeedback" items="${listfeed}" varStatus="status">
												 	<s:if test="${status.count<=16 }">
													<tr>
	                                                       	<td>${status.count }</td>
	                                                        <td class="am-text-middle" style="display: none">${newFeedback.id}</td> 
	                                                        <td class="am-text-middle" style="display: none">${newFeedback.uid}</td>
	                                                      	<td>${newFeedback.serverid }</td>
	                                                      	<td>${newFeedback.uid }</td>
	                                                        <td>${newFeedback.playname }</td>
	                                                        <td>${newFeedback.content }</td>
	                                                        <td>${newFeedback.answer }</td>
	                                                        <td>${newFeedback.contact }</td>
	                                                        <td>${newFeedback.date }</td>
	                                                        <td>${newFeedback.status }</td>
	                                                        <td class="am-text-middle">
							                                     <div class="tpl-table-black-operation">
							                                         <a id="selectoneuser" class="updateBtn" href="javascript:;">
							                                             <i class="am-icon-pencil"></i> 查看
							                                         </a>
							                                         <a  id="answer" class="updateBtn" href="javascript:;">
							                                             <i class="am-icon-pencil"></i> 回复
							                                         </a>
							                                         <!-- <a  id="deleteoneuser" class="delBtn" href="javascript:;" class="tpl-table-black-operation-del">
							                                             <i class="am-icon-trash"></i> 删除
							                                         </a> -->
							                                     </div>
							                                 </td>
	                                                 </tr>
	                                                 </s:if>
                                                 </s:forEach> --%>
                                        </tbody>
                                    </table>
                                </div>
                                <%-- <form action="allwglist.jsp" method="post" id="pagenofrom">
                                		    当前页:<input readonly="readonly" size="1px" style="color: red;" type="text" name="pageNo" id="pageNo" value="${pageNo }" >
                                		  跳转到:<input size="1px" style="color: red;" type="text" name="jumptext" id="jumptext" value="${jump }" >
                                		  <input type="hidden" name="lastpage" id="lastpage" value="${pageCount }" >
                                		  <input type="hidden" name="max" id="max" value="${max }" >
                                		  <input type="hidden" name="size" id="size" value="${size }" >
                                		      总页数:${pageCount }&nbsp&nbsp
                                		  <button type="button" id="jumpbut" class="am-btn am-btn-default am-btn-success"><span class="am-icon-save"></span>跳转</button>
                                		  <button type="button" id="homepage" class="am-btn am-btn-default am-btn-success"><span class="am-icon-save"></span>首页</button>
                                          <button type="button" id="previouspage" class="am-btn am-btn-default am-btn-secondary"><span class="am-icon-save"></span>上一页</button>
                                          <button type="button" id="nextpage" class="am-btn am-btn-default am-btn-warning"><span class="am-icon-archive"></span>下一页</button>
                                          <button type="button" id="lastpage" class="am-btn am-btn-default am-btn-warning"><span class="am-icon-archive"></span>末页</button>
                                </form> --%>
<!--                                 <a href="allwglist.jsp">上一页</a><a href="allwglist.jsp">下一页</a>
                                <input type="text" value="0"> -->
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="web.webSocket.player.PlayerManager,
    java.util.*,
    net.sf.json.JSONArray,
    net.sf.json.JsonConfig,
    web.webSocket.open.OpenManager,
    web.webSocket.vip.VipManager,
    web.webSocket.open.Open,
    web.webSocket.message.Messagepush,
    web.webSocket.pojo.WgPlayerserver,
    web.webSocket.plot.PlotManager,
    java.sql.DriverManager,
	java.sql.ResultSet,
	java.sql.SQLException,
	java.sql.Statement,
	java.sql.Connection,
	web.webSocket.pojo.WgStatistical,
	web.webSocket.util.GameServerManager,
    web.webSocket.pojo.WgPlayerserver5,
    web.webSocket.pojo.WgPlayerserver2"%>
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
	 //getreceedit();
 	 //answeredit();
		
	 //一进入,页面进行全查询
	 function getaddall(pageNum,url){
		 queryAll(pageNum,"/selectstatisticalpageno");
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
	 						$("#addressbody").append('<tr class="gradeX">'+
	 								'<td class="am-text-middle">'+(index+1+(num-1)*16)+'</td>' +
	 								'<td class="am-text-middle">'+item.time+'</td>' +
	                                '<td class="am-text-middle">'+item.login+'</td>' +
	                                '<td class="am-text-middle">'+item.level+'</td>' +
	                                '<td class="am-text-middle">'+item.suit+'</td>' +
	                                '<td class="am-text-middle">'+item.sign+'</td>' +
	                                '<td class="am-text-middle">'+item.physical+'</td>' +
	                                '<td class="am-text-middle">'+item.arena+'</td>' +
	                                '<td class="am-text-middle">'+item.everydayactivity+'</td>' +
	                                '<td class="am-text-middle">'+item.sendphysical+'</td>' +
	                                '<td class="am-text-middle">'+item.bless+'</td>' +
	                                '<td class="am-text-middle">'+item.makeclothes+'</td>' +
	                                '<td class="am-text-middle">'+item.engagement+'</td>' +
	 								'<td class="am-text-middle">'+item.shopclothes+'</td>' +
	                                '<td class="am-text-middle">'+item.tree+'</td>' +
	                                '<td class="am-text-middle">'+item.summer+'</td>' +
	                                '<td class="am-text-middle">'+item.achievement+'</td>' +
	                                '<td class="am-text-middle">'+item.oneyuan+'</td>' +
	                                '<td class="am-text-middle">'+item.bank+'</td>' +
	                                '<td class="am-text-middle">'+item.sevenday+'</td>' +
	                                '<td class="am-text-middle">'+item.monthcard+'</td>' +
	                                '<td class="am-text-middle">'+item.typebug+'</td>' +
	                                '<td class="am-text-middle">'+item.superbag+'</td>' +
	                                '<td class="am-text-middle">'+item.diamondluckdraw+'</td>' +
	                                '<td class="am-text-middle">'+item.catluckdraw+'</td>' +
	                                '<td class="am-text-middle">'+item.hangup+'</td>' +
	                                '<td class="am-text-middle">'+item.dream+'</td>' +
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
                                <div class="widget-title  am-cf">每日操作统计列表</div>


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
		                                        <th>时间</th>
												<th>登录奖励</th>
												<th>等级奖励</th>
												<th>套装兑换</th>
												<th>签到</th>
												<th>领取每日体力</th>
												<th>百花盛宴</th>
												<th>每日必做</th>
												<th>送体力</th>
												<th>祈福</th>
												<th>制衣坊</th>
												<th>续情缘</th>
												<th>服装店</th>
												<th>爱情树</th>
												<th>夏日缘卡</th>
												<th>成就图鉴</th>
												
												<th>一元夺宝</th>
												<!-- <th>聚宝钱庄(不准)</th>
												<th>限时7日(不准)</th>
												<th>月卡福利(不准)</th>
												<th>限购礼包(不准)</th>
												<th>超值礼包(不准)</th> -->
												<!-- 以上不准字段针对1-3区 -->
												
												<th>聚宝钱庄</th>
												<th>限时7日</th>
												<th>月卡福利</th>
												<th>限购礼包</th>
												<th>超值礼包</th>
												
												<th>钻石抽奖</th>
												<th>招财猫</th>
												<th>游历</th>
												<th>两生梦</th>
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
<%@page import="web.webSocket.message.MessageManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="web.webSocket.article.ArticleManager,
    java.util.*,
    web.webSocket.util.Util,
    web.webSocket.rightdress.Part,
    web.webSocket.util.GameServerManager,
    net.sf.json.JSONArray,
    web.webSocket.activity.ActivityManager,
    net.sf.json.JsonConfig,
    web.webSocket.article.ArticleManager,
    web.webSocket.pojo.WgMain,
    web.webSocket.rightdress.RightdressManager,
    web.webSocket.article.Article,
   web.webSocket.message.MessageManager"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jstl/core_rt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
			ActivityManager activityManager=ActivityManager.getInstance();
			WgMain wgMain=activityManager.getWgMain();
			if(wgMain.getOpen()==0){
				request.setAttribute("rechargeopen", "关闭");
			}else{
				request.setAttribute("rechargeopen", "开启");
			}
			String change=request.getParameter("change");
			if(change!=null&&change.equals("true")){
				String newdaytime=request.getParameter("daytime");
				
				String newnighttime=request.getParameter("nighttime");
				wgMain.setDaytime(newdaytime);
				wgMain.setNighttime(newnighttime);
				String[] daytimeSplit = newdaytime.split(":");
				String[] nighttimeSplit = newnighttime.split(":");
				long currentTimeMillis = System.currentTimeMillis();
				Map<String, Object> map2 = new HashMap<String, Object>();
				map2.put("date", currentTimeMillis);
				map2.put("daytimehour", daytimeSplit[0]);
				map2.put("daytimeminute", daytimeSplit[1]);
				map2.put("nighttimehour", nighttimeSplit[0]);
				map2.put("nighttimeminute", nighttimeSplit[1]);
				activityManager.updatewgmain(wgMain);
				MessageManager.getInstance().broadcast(map2, 10026, "");
			}
			String daytime =wgMain.getDaytime();
			String nighttime =wgMain.getNighttime();
			request.setAttribute("daytime", daytime);
			request.setAttribute("nighttime", nighttime);
			//需要更改昼夜时间
			String serverTime=Util.getDate(wgMain.getDay()*1000l, 1);
			request.setAttribute("serverTime", serverTime);
			String limitlibaostr ="";
			
			request.setAttribute("limitlibaosuperbagid", ActivityManager.limitlibaosuperbagid);
			request.setAttribute("weeklibaosuperbagid", ActivityManager.weeklibaosuperbagid);
			request.setAttribute("lifelibaosuperbagid", ActivityManager.lifelibaosuperbagid);
			request.setAttribute("limitTimeGiftPackDay", ActivityManager.limitTimeGiftPackDay);
			request.setAttribute("lifeTimeGiftPackDay", ActivityManager.lifeTimeGiftPackDay);
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
    <link rel="stylesheet" href="<%=path %>/assets/css/amazeui.datetimepicker.css" />
    <link rel="stylesheet" href="<%=path %>/assets/css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="<%=path %>/assets/css/app.css">
    <script src="<%=path %>/assets/js/jquery.min.js"></script>
    <script src="<%=path %>/assets/js/amazeui.min.js"></script>
    <script src="<%=path %>/assets/js/moment-with-locales.min.js"></script>
    
    <script src="<%=path %>/assets/js/app.js"></script>
    <script src="<%=path %>/assets/js/theme.js"></script>
    <script src="<%=path %>/assets/js/amazeui-pagination.js"></script>
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
    <script type="text/javascript">
<%-- 	layui.config({
		  base: '<%=path %>/admin/article/' //你存放新模块的目录，注意，不是layui的模块目录
		}).use('articlelist'); //加载入口 --%>
		
		layui.define(['form','layer','laypage','laydate'], function(exports){
			var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;
			$('#daytime').datetimepicker({
				format: 'hh:ii',
				startView:'0',
				maxView:'1',
				minView:'0',
				autoclose:'true',
				minuteStep:1
				});
			$('#nighttime').datetimepicker({
				format: 'hh:ii',
				startView:'0',
				maxView:'1',
				minView:'0',
				autoclose:'true',
				minuteStep:1
				});
			form.on('submit(demo1)', function(data){
				layer.confirm('注意:是否确定修改昼夜时间！', {icon: 2, title:'修改昼夜时间！'}, function(index){
					  var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
					  var daytimedom = document.getElementById('daytime');
					  var daytime =daytimedom.value;
					  var nighttimedom = document.getElementById('nighttime');
					  var nighttime =nighttimedom.value;
					  window.location.replace('open.jsp?change=true&daytime='+daytime+'&nighttime='+nighttime);
					});
			    return false;
			  });
			
			getoperation();
			resetallpay();
			send();
			changeLibaoId();
		});
		function resetallpay(){
			$(document).on('click','#resetallpay',function(){
			layer.confirm('注意:是否确定重置所有玩家首充双倍！', {icon: 2, title:'重置所有玩家首充双倍！'}, function(index){
				  var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
					layer.closeAll();
			 		layer.open({
			 			type:2,
			 			title:['编辑'],
			 			area:['90%','90%'],
			 			shade:0.3,
			 			resize:false,
			 			closeBtn:1,
			 			shadeClose:true,
			 			anim:0,
			 			content:[webPath+'/adm/activity/doresetallpay.jsp?change=true'],
			 	    	end:function(){
			 	    		window.location.reload();
			 	    	}
			 		});
				});
			});
		};
		//操作
	 function getoperation(){
	 	$(document).on('click','#operation',function(){
	 		layer.closeAll();
	 		layer.open({
	 			type:2,
	 			title:['编辑'],
	 			area:['90%','90%'],
	 			shade:0.3,
	 			resize:false,
	 			closeBtn:1,
	 			shadeClose:true,
	 			anim:0,
	 			content:[webPath+'/adm/activity/upopen.jsp'],
	 	    	end:function(){
	 	    		window.location.reload();
	 	    	}
	 		});
	 	});
	 };
	 function send(){
			$(document).on('click','#saveBtn',function(){
				var datetimepicker1=document.getElementById("datetimepicker1").value;
				if(datetimepicker1.length<=0){
					layer.msg("服务器时间不允许为空!");
					return false;
				}
			layer.confirm('注意:是否确定修改服务器开服时间，这将影响到服务器部分功能！', {icon: 2, title:'修改服务器开服时间！'}, function(index){
				  var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
					layer.closeAll();
			 		layer.open({
			 			type:2,
			 			title:['编辑'],
			 			area:['90%','90%'],
			 			shade:0.3,
			 			resize:false,
			 			closeBtn:1,
			 			shadeClose:true,
			 			anim:0,
			 			content:[webPath+'/changServerTime?servertime='+datetimepicker1],
			 	    	end:function(){
			 	    		window.location.reload();
			 	    	}
			 		});
				});
			});
		};
		function changeLibaoId(){
		 	$(document).on('click','#changeLibaoId',function(){
		 		layer.closeAll();
		 		layer.open({
		 			type:2,
		 			title:['编辑'],
		 			area:['90%','90%'],
		 			shade:0.3,
		 			resize:false,
		 			closeBtn:1,
		 			shadeClose:true,
		 			anim:0,
		 			content:[webPath+'/adm/activity/changeActivityLibaoId.jsp'],
		 	    	end:function(){
		 	    		window.location.reload();
		 	    	}
		 		});
		 	});
		 };
			
</script>
</head>
<body class="theme-black">
        <!-- 内容区域 -->
    <script src="<%=path %>/assets/js/amazeui.datetimepicker.min.js"></script>
            <div class="theme-black">
                <div class="row">
                    <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                        <div class="widget am-cf">
                            <div class="widget-head am-cf">
                                <div class="widget-title  am-cf"></div>
                            </div>
                            <div class="widget-body  am-fr">

                                <div class="am-u-sm-12 am-u-md-6 am-u-lg-6">
                                    <div class="am-form-group">
                                        <div class="am-btn-toolbar">
                                            <div class="am-btn-group am-btn-group-xs">
                                                <%-- <button type="button" class="am-btn am-btn-default am-btn-success" id="myadd"><span class="am-icon-plus"></span> 新增</button> --%>
<!--                                            <button type="button" class="am-btn am-btn-default am-btn-secondary"><span class="am-icon-save"></span> 保存</button>
                                                <button type="button" class="am-btn am-btn-default am-btn-warning"><span class="am-icon-archive"></span> 审核</button>
                                                <button type="button" class="am-btn am-btn-default am-btn-danger"><span class="am-icon-trash-o"></span> 删除</button> -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div  id="hp_form" name="hp_form" data-am-validator class="am-form tpl-form-line-form">
	                                <div class="am-u-sm-12 am-u-md-12 am-u-lg-3">
	                                    <div class="am-input-group am-input-group-sm tpl-form-border-form cl-p">
	                                        <%-- <input type="text" class="am-form-field " placeholder="请输入道具id" id="articleid" name="articleid">
	                                        <input type="text" class="am-form-field" placeholder="请输入道具名称" align="left" id="articlename" name="articlename" />
	                                        <span class="am-input-group-btn">
								            	<button class="am-btn  am-btn-default am-btn-success tpl-table-list-field am-icon-search" id="queryuser" name="queryuser" type="button" onclick="selectwg();"></button>
								        	</span> --%>
								        	<table>
		                                    	<tr>
		                                       </tr>
                                 			</table>
	                                    </div>
	                                </div>
								</div>

                                <div class="am-u-sm-12">
                                    <table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black ">
                                        <thead>
                                            <tr>
                                                <th>服务器状态</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody id="addressbody">
	                                         <tr>
	                                         		<td>${rechargeopen}</td>
	                                         		<td class="am-text-middle">
												<div class="tpl-table-black-operation">
													<a id="operation" class="updateBtn" href="javascript:;">
														<i class="am-icon-pencil"></i>编辑</a>
												</div>
										    </td>
	                                         </tr>
                                        </tbody>
                                    </table>
                                    <div class="am-fr">
                                        <ul class="am-pagination tpl-pagination"></ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <form class="layui-form" action="" lay-filter="example">
				<div class="layui-form-item">
					<div class="layui-input-block">
				<label class="layui-form-label" style="color: white;">----->白天开始时间</label>
				<input type="text" name="daytime" id="daytime" value="${daytime}" id="datetimepicker" class="am-form-field" >
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block">
				<label class="layui-form-label" style="color: white;">----->晚上开始时间</label>
				<input type="text" name="nighttime" id="nighttime" value="${nighttime}" id="datetimepicker" class="am-form-field" >
					</div>
				</div>
				<button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                    </form>
                </div>
            </div>
            <br>
     <button id="resetallpay" type="button" value="重置所有玩家首充双倍" class="am-btn am-btn-warning" >重置所有玩家首充双倍</button>
	<form id="send" action="sss" method="post" data-am-validator
							class="am-form tpl-form-line-form">
	<div class="am-form-group">
		<label for="user-name" class="am-u-sm-3 am-form-label" style="color: white;">服务器开服时间 <span
			class="tpl-form-line-small-"></span> </label>
		<div class="am-u-sm-0">
			<input type="text" value="${serverTime}" id="datetimepicker1"
				name="datetimepicker1" class="am-form-field" placeholder="服务器开服时间"
				data-am-datepicker readonly required />
		</div>
		<button id="saveBtn" type="button" onclick="send();"
						class="am-btn am-btn-default am-btn-secondary">
						<span class="am-icon-save"></span> 修改
					</button>
	</div>
	</form>
	<table>
	<div class="am-form-group">
		<label for="user-name" class="am-u-sm-3 am-form-label" style="color: white;">超值特惠礼包ID <span
			class="tpl-form-line-small-"></span> </label>
		<div class="am-u-sm-0" style="color: white;">
		轮循礼包----><s:forEach var="limitstr" items="${limitlibaosuperbagid }">${limitstr }&nbsp;&nbsp;&nbsp;</s:forEach>
		
			</div>
			<div class="am-u-sm-0" style="color: white;">
		周末礼包---->${weeklibaosuperbagid }
			</div>
			<div class="am-u-sm-0" style="color: white;">
		终生礼包---->${lifelibaosuperbagid }
			</div>
				<div class="am-u-sm-0" style="color: white;">
		轮循礼包开启间隔时间（天）---->${limitTimeGiftPackDay }
			</div>
				<div class="am-u-sm-0" style="color: white;">
		终生礼包开启间隔时间（天）---->${lifeTimeGiftPackDay }
			</div>
		</div>
	</table>
	<div class="tpl-table-black-operation">
		<a id="changeLibaoId" class="updateBtn" href="javascript:;"> <i
			class="am-icon-pencil"></i>编辑</a>
	</div>
</body>
</html>
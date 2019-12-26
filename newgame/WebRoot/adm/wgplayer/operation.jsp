<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>  
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" type="image/png" href="<%=path %>/assets/i/favicon.png">
<link rel="apple-touch-icon-precomposed" href="<%=path %>/assets/i/app-icon72x72@2x.png">
<link rel="stylesheet" href="<%=path %>/assets/css/amazeui.min.css" />
<link rel="stylesheet" href="<%=path %>/assets/css/amazeui.datatables.min.css" />
<link rel="stylesheet" href="<%=path %>/assets/css/app.css">
<link rel="stylesheet" href="<%=path %>/assets/js/amazeui.datetimepicker-se.min.css">

<script type="text/javascript" src="<%=path %>/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/echarts.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/moment-with-locales.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/amazeui.datetimepicker-se.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/moment.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/amazeui-pagination.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/common.js"></script> 


<style>
* {
    margin: 0;
    border: 0;
    padding: 0;
    font-size: 13pt;
}
 
/* #nav {
    height: 40px;
    border-top: #060 2px solid;
    border-bottom: #060 2px solid;
    background-color: #690;
} */
 
#nav ul {
    list-style: none;
    margin-left: 50px;
}
 
#nav li {
    display: inline;
    line-height: 40px;
    float:left
}
 
#nav a {
    color: #fff;
    text-decoration: none;
    padding: 10px 20px;
}
 
#nav a:hover {
    background-color: #0e90d2;
}
</style>

<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
    <script type="text/javascript">
		layui.define(['form','layer','laypage','laydate'], function(exports){
		var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;
			getreceedit();
			resetdate();
		});
	 //逻辑删除
	 function deleteoneuser(){
	 	$(document).on('click','#deleteoneuser',function(){
	 		var id = $("#serveruid").val();
	 		var playname = $("#playername").val();
	 		var ranking = $("#ranking").val();
	 		layer.closeAll();
	 		//百花排行-1的，可以直接删除，否者修改熊猫玩id
	 		if(ranking!=-1){
	 			layer.confirm('注意:百花盛宴有排名无法删除,是否强制删除！', {icon: 2, title:'删除:'+playname}, function(index){
				  var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
            	  location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20108';
				});
	 		}else{
			 	layer.confirm('注意:删除后无法找回！', {icon: 2, title:'删除:'+playname}, function(index){
				  var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
            	  location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20108';
				});
	 		}
	 	});
	 }
	 
	 //一键开启
	 function allopen(){
	 	$(document).on('click','#allopen',function(){
	 		var id = $("#serveruid").val();
	 		var playname = $("#playername").val();
	 		 layer.closeAll();
 			 layer.confirm('注意:是否一键开启所有功能！', {icon: 0, title:'一键开启:'+playname}, function(index){
			  	var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
           	  	location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20104';
			});
	 	});
	 }
	 //跳过引导
	 function skip(){
	 	$(document).on('click','#skip',function(){
	 		var id = $("#serveruid").val();
	 		var playname = $("#playername").val();
 	    	layer.closeAll();
	 		layer.confirm('注意:是否跳过引导！', {icon: 0, title:'跳过引导:'+playname}, function(index){
			  	var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
           	  	location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20105';
			});
	 	});
	 }
	
	 //下线
	 function offline(){
	 	$(document).on('click','#offline',function(){
	 		var id = $("#serveruid").val();
	 		var playname = $("#playername").val();
	 		layer.confirm('注意:是否踢玩家下线！', {icon: 0, title:'下线:'+playname}, function(index){
			  	var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
           	  	location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20103';
			});
	 	});
	 }

	 //允许聊天
	 function yesspeak(){
	 	$(document).on('click','#yesspeak',function(){
	 		var id = $("#serveruid").val();
	 		var playname = $("#playername").val();
	 		layer.closeAll();
	 		layer.confirm('注意:允许玩家聊天！', {icon: 0, title:'玩家:'+playname}, function(index){
			  	var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
           	  	location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20119';
			});
	 	});
	 }
	 //允许聊天
	 function nosspeak(){
	 	$(document).on('click','#nosspeak',function(){
	 		var id = $("#serveruid").val();
	 		var playname = $("#playername").val();

	 		layer.closeAll();
	 		layer.confirm('注意:禁止玩家聊天！', {icon: 0, title:'玩家:'+playname}, function(index){
			  	var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
           	  	location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20120';
			});
	 	});
	 }
	 //允许登录
	 function yeslogin(){
	 	$(document).on('click','#yeslogin',function(){
	 		var id = $("#serveruid").val();
	 		var playname = $("#playername").val();
	 		layer.closeAll();
	 		layer.confirm('注意:允许玩家登录！', {icon: 0, title:'玩家:'+playname}, function(index){
			  	var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
           	  	location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20121';
			});
	 	});
	 }
	 //禁止登录
	 function nologin(){
	 	$(document).on('click','#nologin',function(){
	 		var id = $("#serveruid").val();
	 		var playname = $("#playername").val();
	 		layer.closeAll();
	 		layer.confirm('注意:允许玩家登录！', {icon: 0, title:'玩家:'+playname}, function(index){
			  	var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
           	  	location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20122';
			});
	 	});
	 }
	 
	 //编辑弹窗
	 function getreceedit(){
	 	$(document).on('click','#selectoneuser',function(){
	 		var id = $("#serveruid").val();
	 		layer.closeAll();
	 		layer.open({
	 			type:2,
	 			title:['编辑用户'],
	 			area:['80%','90%'],
	 			shade:0.3,
	 			resize:false,
	 			closeBtn:1,
	 			anim:0,
	 			content:[webPath+'/admin/userone?serveruid='+id+'&type=1'],
	 	    	end:function(){
	 	    		window.location.reload();
	 	    	}
	 		});
	 	});
	 };
	 
		//重置；
	 function resetdate(){
	 	$(document).on('click','#resetdate',function(){
	 		var id = $("#serveruid").val();
	 		var playname = $("#playername").val();
 	 		//layer.closeAll();
	 		layer.confirm('注意:是否重置当日数据！', {icon: 0, title:'重置当日数据:'+playname}, function(index){
			  	var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
           	  	location.href = webPath+'/admin/userone?serveruid='+id+'&type=2';
			}); 
	 	});
	 	
	 	
	 };
	 
	 
	 //查看玩家背包
	 function getknapsack(){
	 	$(document).on('click','#info',function(){
	 		var id = $("#serveruid").val();
	 		layer.closeAll();
	 		layer.open({
	 			type:2,
	 			title:['编辑背包'],
	 			area:['80%','90%'],
	 			shade:0.3,
	 			resize:false,
	 			closeBtn:1,
	 			anim:0,
	 			content:[webPath+'/adm/wgplayer/knapsack.jsp?serveruid='+id],
	 	    	end:function(){
	 	    		/* getaddall(1); */
	 	    	}
	 		});
	 	});
	 };
	 

		function heartbeatfault(){
		 	$(document).on('click','#heartbeatfault',function(){
		 		var id = $("#serveruid").val();
		 		var playname = $("#playername").val();
		 		/* layer.msg("玩家当日数据已经重置")
		 		//延迟0.8S关闭
	 	    	setTimeout(timeout,800)
	 	    	function timeout(){
			 		layer.closeAll();
			 		location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20109';
		 		} */
		 		layer.closeAll();
		 		layer.confirm('注意:确定执行吗!！', {icon: 0, title:'玩家:'+playname}, function(index){
				  	var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
	           	  	//location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20134';
	           	  	location.href =webPath +'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20134';
				});
		 	});
		 }
</script>
</head>
<body class="theme-black">

	<!-- 内容区域 -->
	<form action="wgupdate.jsp" method="post" id="hp_form" name="hp_form" data-am-validator
							class="am-form tpl-form-line-form">
		<div class="theme-black">
				<div class="am-btn-group am-btn-group-xs" style="margin-top: 10px">
					<!--<button id="saveBtn" type="button" onclick="return save();"
						class="am-btn am-btn-default am-btn-secondary">
						<span class="am-icon-save"></span> 保存
					</button>  -->
					<%-- <button id="saveBtn" type="submit" onclick="return;"
						class="am-btn am-btn-default am-btn-secondary">
						<span class="am-icon-save"></span> 保存
					</button> --%>
<%-- 					<button onclick="window.history.go(-1)" type="button"
						class="am-btn am-btn-default am-btn-warning">
						<span class="am-icon-reply"></span> 返回
					</button> --%>
				</div>
			</div>
			<div class="row">
				<div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
					<div class="widget am-cf">
						<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">玩家昵称:
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${wg.rolename}（${wg.playername}${wg.username}）" name="playername" id="playername" type="text" readonly="readonly"
										class="tpl-form-input" placeholder="" />
								</div>
						</div>
<!-- <div>基本操作：</div> -->
						<div id="nav">
						<ul>
							<s:forEach items="${listthree }" var="three">
							<fmt:formatNumber var="threetype" type="number" value="${three.type/10000}" maxFractionDigits="0"></fmt:formatNumber>
								<s:if test="${threetype==2 }">
									<!-- <div class="am-form-group"> -->
										<li>
										 <a id=${three.url } 
										 	class="updateBtn" href="javascript:;">
											<i class=""></i> ${three.content } </a>
										</li>
									
								</s:if>
							</s:forEach>
							</ul>
						</div>
							<%-- <div class="am-form-group">
								 <a id="selectoneuser" 
								 	class="updateBtn" href="javascript:;">
									<i class="am-icon-pencil"></i> 编辑 </a>
							</div>
							
							<div class="am-form-group">
								<a id="info"
									class="updateBtn" href="javascript:;"> <i
									class="am-icon-pencil"></i> 背包 </a>
							</div>
							<s:if test="${type=='online'}">
								<div class="am-form-group">
									<a id="offline"
										class="updateBtn" href="javascript:;"> <i
										class="am-icon-pencil"></i> 下线 </a> 
								</div>
							</s:if>
							

							<div class="am-form-group">
								<a id="allopen"
									class="updateBtn" href="javascript:;"> <i
									class="am-icon-pencil"></i> 开启功能 </a>
							</div>
							
							<div class="am-form-group">
								<a id="skip"
									class="updateBtn" href="javascript:;"> <i
									class="am-icon-pencil"></i> 跳过引导 </a>
							</div>
							
							<div class="am-form-group">
								<a id="openplot"
									class="updateBtn" href="javascript:;"> <i
									class="am-icon-pencil"></i> 开启剧情 </a> 
							</div>
							
							<div class="am-form-group">
								<a id="lovetree"
									class="updateBtn" href="javascript:;"> <i
									class="am-icon-pencil"></i> 爱情树 </a> 
							</div>
							
							<div class="am-form-group">
								<a id="deleteoneuser"
									class="delBtn" href="javascript:;"
									class="tpl-table-black-operation-del"> <i
									class="am-icon-trash"></i> 删除 </a>
							</div> --%>
							
							<!-- 隐藏域-->
 									<input id="serveruid" name="serveruid" style="color: red" type="hidden"
										value="${wg.serveruid}" />
									 <input id="playername" name="playername" style="color: red" type="hidden"
										value="${wg.rolename}（${wg.playername}${wg.username}）" />
									<input id="ranking" name="ranking" style="color: red" type="hidden"
									value="" />
						<!-- 表单体  end-->
					</div>
					
				</div>
				
		</div>

</body>
</html>
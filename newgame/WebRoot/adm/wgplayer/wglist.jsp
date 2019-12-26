<%@page import="web.webSocket.util.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jstl/core_rt"%>
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
<link rel="apple-touch-icon-precomposed"
	href="<%=path %>/assets/i/app-icon72x72@2x.png">
<link rel="stylesheet" href="<%=path %>/assets/css/amazeui.min.css" />
<link rel="stylesheet"
	href="<%=path %>/assets/css/amazeui.datatables.min.css" />
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
			getreceedit();
			getknapsack();
			selectwg();
			deleteoneuser();
			allopen();
			skip();
			offline();
			openplot();
			getoperation();
			homepage();
			previouspage();
			nextpage();
			lastpage();
			jump();
			controlServer();
		});
		//
		 function controlServer(){
			 	$(document).on('click','#closeserver',function(){
			 		
			 		layer.closeAll();
			 		
			 		layer.confirm('注意:禁止后玩家将无法登陆！', {icon: 2, title:'禁止玩家登陆！'}, function(index){
						  var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
						  window.location.replace('wglist.jsp?isopenserver=0');
						});
			 	});
			 }
	 //逻辑删除
	 function deleteoneuser(){
	 	$(document).on('click','#deleteoneuser',function(){
	 		var id = $(this).parent().parent().parent().find("td:eq(1)").text();
	 		var playname = $(this).parent().parent().parent().find("td:eq(3)").text();
	 		layer.closeAll();
	 		layer.confirm('注意:删除后无法找回！', {icon: 2, title:'删除:'+playname}, function(index){
				  var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
            	  location.href = webPath+'/adm/wgplayer/wglist.jsp?serveruid='+id+'&parameter=1';
				});
	 	});
	 }
	 
	 //一键开启
	 function allopen(){
	 	$(document).on('click','#allopen',function(){
	 		var id = $(this).parent().parent().parent().find("td:eq(1)").text();
	 		layer.closeAll();
	 		location.href = webPath+'/adm/wgplayer/wglist.jsp?serveruid='+id+'&parameter=2';
	 	});
	 }
	 //跳过引导
	 function skip(){
	 	$(document).on('click','#skip',function(){
	 		var id = $(this).parent().parent().parent().find("td:eq(1)").text();
	 		layer.closeAll();
	 		location.href = webPath+'/adm/wgplayer/wglist.jsp?serveruid='+id+'&parameter=3';
	 	});
	 }
	 //下线
	 function offline(){
	 	$(document).on('click','#offline',function(){
	 		var id = $(this).parent().parent().parent().find("td:eq(1)").text();
	 		layer.closeAll();
	 		location.href = webPath+'/adm/wgplayer/wglist.jsp?serveruid='+id+'&parameter=4';
	 	});
	 }
	 //开启剧情
	 function openplot(){
	 	$(document).on('click','#openplot',function(){
	 		var id = $(this).parent().parent().parent().find("td:eq(1)").text();
	 		var playname = $(this).parent().parent().parent().find("td:eq(3)").text();
	 		layer.closeAll();
	 		layer.confirm('注意:确定后请稍等10秒进入游戏！', {icon: 0, title:'开启剧情:'+playname}, function(index){
				  var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
            	  location.href = webPath+'/adm/wgplayer/wglist.jsp?serveruid='+id+'&parameter=5';
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
	 			shadeClose:true,
	 			anim:0,
	 			content:[webPath+'/adm/wgplayer/wgupdate.jsp?serveruid='+id],
	 	    	end:function(){
	 	    		window.location.reload();
	 	    	}
	 		});
	 	});
	 };
	 //查询玩家
	 function selectwg(){
	 	$(document).on('click','#queryuser',function(){
	 		var userName=document.getElementById("userName").value;
	 		userName=$.trim(userName);
	 		document.getElementById("userName").value=userName; 
	 		var playName=document.getElementById("playName").value;
	 		playName=$.trim(playName);
	 		document.getElementById("playName").value=playName; 
			$("#addressbody").empty();
	 		var content="";
	 		//1.只查账号
	 		if(userName!="" && playName==""){
	 			 		$.each(${listArray},function(index,wg){
	 					if(wg.username==userName){
	 						content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
 								 '<td class="am-text-middle" >'+wg.serveruid+'</td>' +
                                 '<td>'+wg.username+'</td>' +
                                 '<td>'+wg.playername+'</td>' +
                                 '<td>'+wg.level+'</td>' +
                                 '<td>'+wg.gold+'</td>' +
                                 '<td>'+wg.physical+'</td>' +
                                 '<td>'+wg.diamond+'</td>' +
                                 '<td>'+wg.arenagold+'</td>' +
                                 '<td>'+wg.lovecurrency+'</td>'+
                                 '<td>'+wg.bean+'</td>' +
                                 '<td>'+wg.hangupnum+'</td>' +
                                 '<td>'+wg.lovesection+'</td>' +
                                 '<td>'+wg.redthread+'</td>'+
                                 '<td>'+wg.onlinetime+'</td>'+
                                 '<td>'+wg.lastlogintime+'</td>' +		
                                 '<td>'+wg.viplevel+'</td>' +
                                 '<td>'+wg.channel+'</td>' +
                                 '<td>'+wg.totalrmbdiamond+'</td>' +
								 '<td class="am-text-middle">'+
								 	'<div class="tpl-table-black-operation">'+
								 			'<a id="operation" class="updateBtn" href="javascript:;">'+
												'<i class="am-icon-pencil"></i> 操作'+ 
										'</a>'+
                                    	'</div>'+
                                    '</td>'+
				             '</tr>';
	 				}			                                        				                                         
	 			});
	 		}else if(playName!="" &&userName==""){
	 		//2.只查昵称
	 			 		$.each(${listArray},function(index,wg){
	 					if(wg.playername.indexOf(playName) != -1){
	 						content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
 								 '<td class="am-text-middle" >'+wg.serveruid+'</td>' +
                                 '<td>'+wg.username+'</td>' +
                                 '<td>'+wg.playername+'</td>' +
                                 '<td>'+wg.level+'</td>' +
                                 '<td>'+wg.gold+'</td>' +
                                 '<td>'+wg.physical+'</td>' +
                                 '<td>'+wg.diamond+'</td>' +
                                 '<td>'+wg.arenagold+'</td>' +
                                 '<td>'+wg.lovecurrency+'</td>'+
                                 '<td>'+wg.bean+'</td>' +
                                 '<td>'+wg.hangupnum+'</td>' +
                                 '<td>'+wg.lovesection+'</td>' +
                                 '<td>'+wg.redthread+'</td>'+
                                 '<td>'+wg.onlinetime+'</td>'+
                                 '<td>'+wg.lastlogintime+'</td>' +	
                                 '<td>'+wg.viplevel+'</td>' +
                                 '<td>'+wg.channel+'</td>' +
                                 '<td>'+wg.totalrmbdiamond+'</td>' +
								 '<td class="am-text-middle">'+
								 	'<div class="tpl-table-black-operation">'+
								 			'<a id="operation" class="updateBtn" href="javascript:;">'+
												'<i class="am-icon-pencil"></i> 操作'+ 
										'</a>'+
                                    	'</div>'+
                                    '</td>'+
				             '</tr>';
	 				}			                                        				                                         
	 			});
	 		}else if(playName!="" && userName!=""){
	 		//3.账号、昵称都查
	 			 		$.each(${listArray},function(index,wg){
	 					if(wg.playername==playName && wg.username==userName){
	 						content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
 								 '<td class="am-text-middle" >'+wg.serveruid+'</td>' +
                                 '<td>'+wg.username+'</td>' +
                                 '<td>'+wg.playername+'</td>' +
                                 '<td>'+wg.level+'</td>' +
                                 '<td>'+wg.gold+'</td>' +
                                 '<td>'+wg.physical+'</td>' +
                                 '<td>'+wg.diamond+'</td>' +
                                 '<td>'+wg.arenagold+'</td>' +
                                 '<td>'+wg.lovecurrency+'</td>'+
                                 '<td>'+wg.bean+'</td>' +
                                 '<td>'+wg.hangupnum+'</td>' +
                                 '<td>'+wg.lovesection+'</td>' +
                                 '<td>'+wg.redthread+'</td>'+
                                 '<td>'+wg.onlinetime+'</td>'+
                                 '<td>'+wg.lastlogintime+'</td>' +	
                                 '<td>'+wg.viplevel+'</td>' +
                                 '<td>'+wg.channel+'</td>' +
                                 '<td>'+wg.totalrmbdiamond+'</td>' +
								 '<td class="am-text-middle">'+
								 	'<div class="tpl-table-black-operation">'+
								 			'<a id="operation" class="updateBtn" href="javascript:;">'+
												'<i class="am-icon-pencil"></i> 操作'+ 
										'</a>'+
                                    	'</div>'+
                                    '</td>'+
				             '</tr>';
	 				}			                                        				                                         
	 			});
	 		}else{
	 		//都不查
	 			$.each(${listArray},function(index,wg){
	 			if(index>=0){
	 			if(index<${size}){
	 				content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
 								 '<td class="am-text-middle" >'+wg.serveruid+'</td>' +
                                 '<td>'+wg.username+'</td>' +
                                 '<td>'+wg.playername+'</td>' +
                                 '<td>'+wg.level+'</td>' +
                                 '<td>'+wg.gold+'</td>' +
                                 '<td>'+wg.physical+'</td>' +
                                 '<td>'+wg.diamond+'</td>' +
                                 '<td>'+wg.arenagold+'</td>' +
                                 '<td>'+wg.lovecurrency+'</td>'+
                                 '<td>'+wg.bean+'</td>' +
                                 '<td>'+wg.hangupnum+'</td>' +
                                 '<td>'+wg.lovesection+'</td>' +
                                 '<td>'+wg.redthread+'</td>'+
                                 '<td>'+wg.onlinetime+'</td>'+
                                 '<td>'+wg.lastlogintime+'</td>' +	
                                 '<td>'+wg.viplevel+'</td>' +
                                 '<td>'+wg.channel+'</td>' +
                                 '<td>'+wg.totalrmbdiamond+'</td>' +
								 '<td class="am-text-middle">'+
								 	'<div class="tpl-table-black-operation">'+
                                        	'<a id="operation" class="updateBtn" href="javascript:;">'+
												'<i class="am-icon-pencil"></i> 操作'+ 
										'</a>'+
                                    	'</div>'+
                                    '</td>'+
				             '</tr>';
	 			}
	 			}
	 		});
	 		}
	 		$("#addressbody").append(content); 
	 	});
	 };
	 
	 //查看玩家背包
	 function getknapsack(){
	 	$(document).on('click','#info',function(){
	 		var id = $(this).parent().parent().parent().find("td:eq(1)").text();
	 		layer.closeAll();
	 		layer.open({
	 			type:2,
	 			title:['编辑背包'],
	 			area:['80%','90%'],
	 			shade:0.3,
	 			resize:false,
	 			closeBtn:1,
	 			shadeClose:true,
	 			anim:0,
	 			content:[webPath+'/adm/wgplayer/knapsack.jsp?serveruid='+id],
	 	    	end:function(){
	 	    		/* getaddall(1); */
	 	    	}
	 		});
	 	});
	 };
	 
	 //操作
	 function getoperation(){
	 	$(document).on('click','#operation',function(){
	 		var id = $(this).parent().parent().parent().find("td:eq(1)").text();
	 		layer.closeAll();
	 		layer.open({
	 			type:2,
	 			title:['操作'],
	 			area:['90%','90%'],
	 			shade:0.3,
	 			resize:false,
	 			closeBtn:1,
	 			shadeClose:true,
	 			anim:0,
	 			content:[webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&type=online'],
	 	    	end:function(){
	 	    		window.location.reload();
	 	    	}
	 		});
	 	});
	 };
	  //首页
	 function homepage(){
	 	$(document).on('click','#homepage',function(){
	 		var pageno=document.getElementById("pageNo").value;
	 		if(pageno==1){
	 			layer.msg("已是首页！");
	 			return;
	 		}
	 		document.getElementById("pageNo").value="1";
			$("#addressbody").empty();
	 		var content="";
	 		$.each(${listArray},function(index,wg){
	 			if(index>=0){
	 			if(index<${size}){
	 				content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
 								 '<td class="am-text-middle" >'+wg.serveruid+'</td>' +
                                 '<td>'+wg.username+'</td>' +
                                 '<td>'+wg.playername+'</td>' +
                                 '<td>'+wg.level+'</td>' +
                                 '<td>'+wg.gold+'</td>' +
                                 '<td>'+wg.physical+'</td>' +
                                 '<td>'+wg.diamond+'</td>' +
                                 '<td>'+wg.arenagold+'</td>'+
                                 '<td>'+wg.lovecurrency+'</td>'+
                                 '<td>'+wg.bean+'</td>' +
                                 '<td>'+wg.hangupnum+'</td>' +
                                 '<td>'+wg.lovesection+'</td>' +
                                 '<td>'+wg.redthread+'</td>'+
                                 '<td>'+wg.onlinetime+'</td>'+
                                 '<td>'+wg.lastlogintime+'</td>' +	
                                 '<td>'+wg.viplevel+'</td>' +
                                 '<td>'+wg.channel+'</td>' +
                                 '<td>'+wg.totalrmbdiamond+'</td>' +
								 '<td class="am-text-middle">'+
								 	'<div class="tpl-table-black-operation">'+
                                        	'<a id="operation" class="updateBtn" href="javascript:;">'+
												'<i class="am-icon-pencil"></i> 操作'+ 
										 	 '</a>'+
                                    '</td>'+
				             '</tr>';
	 			}
	 			}
	 		});
	 		$("#addressbody").append(content); 
	 	});
	 };
	 
	 //跳转
	 function jump(){
	 	$(document).on('click','#jumpbut',function(){
	 		var jump=document.getElementById("jumptext").value;
	 		var pageno=document.getElementById("pageNo").value;
	 		if(jump==pageno){
	 			layer.msg("已是当前页！");
	 			return;
	 		}
	 		if(jump.length==0){
	 			layer.msg("请输入页码！");
	 			return false;
	 		}
	 		if(isNaN(jump)){
				layer.msg("页码只能输入数字！");
			}else{
	 		document.getElementById("pageNo").value=jump;
	 		$("#addressbody").empty();
	 		var content="";
	 		if(jump>=1 && jump<=${pageCount}){
	 		$.each(${listArray},function(index,wg){
	 			if(index>=${size}*(jump-1)){
	 			if(index<${size}*jump){
	 				content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
 								 '<td class="am-text-middle" >'+wg.serveruid+'</td>' +
                                 '<td>'+wg.username+'</td>' +
                                 '<td>'+wg.playername+'</td>' +
                                 '<td>'+wg.level+'</td>' +
                                 '<td>'+wg.gold+'</td>' +
                                 '<td>'+wg.physical+'</td>' +
                                 '<td>'+wg.diamond+'</td>' +
                                 '<td>'+wg.arenagold+'</td>'+
                                 '<td>'+wg.lovecurrency+'</td>'+
                                 '<td>'+wg.bean+'</td>' +
                                 '<td>'+wg.hangupnum+'</td>' +
                                 '<td>'+wg.lovesection+'</td>' +
                                 '<td>'+wg.redthread+'</td>'+
                                 '<td>'+wg.onlinetime+'</td>'+
                                 '<td>'+wg.lastlogintime+'</td>' +	
                                 '<td>'+wg.viplevel+'</td>' +
                                 '<td>'+wg.channel+'</td>' +
                                 '<td>'+wg.totalrmbdiamond+'</td>' +
								 '<td class="am-text-middle">'+
								 	'<div class="tpl-table-black-operation">'+
                                        	'<a id="operation" class="updateBtn" href="javascript:;">'+
												'<i class="am-icon-pencil"></i> 操作'+ 
										 	 '</a>'+
                                    	'</div>'+
                                    '</td>'+
				             '</tr>';
	 			}
	 			}
	 		});
	 		}
	 		$("#addressbody").append(content);     
	 		}
	 	});
	 };
	 
	 
	 //上一页
	 function previouspage(){
	 	$(document).on('click','#previouspage',function(){
	 		var pageno=document.getElementById("pageNo").value;
	 		var page=1;
	 		if(pageno==1){
		 		layer.msg("已是首页！");
	 			return;
	 		}else{
	 			page=parseInt(pageno)-1;
		 		document.getElementById("pageNo").value=page;
	 		}
			document.getElementById("pageNo").value=page;
	 		$("#addressbody").empty();
	 		var content="";
	 		$.each(${listArray},function(index,wg){
	 			if(index>=${size}*(page-1)){
	 			if(index<${size}*page){
	 				content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
 								 '<td class="am-text-middle" >'+wg.serveruid+'</td>' +
                                 '<td>'+wg.username+'</td>' +
                                 '<td>'+wg.playername+'</td>' +
                                 '<td>'+wg.level+'</td>' +
                                 '<td>'+wg.gold+'</td>' +
                                 '<td>'+wg.physical+'</td>' +
                                 '<td>'+wg.diamond+'</td>' +
                                 '<td>'+wg.arenagold+'</td>'+
                                 '<td>'+wg.lovecurrency+'</td>'+
                                 '<td>'+wg.bean+'</td>' +
                                 '<td>'+wg.hangupnum+'</td>' +
                                 '<td>'+wg.lovesection+'</td>' +
                                 '<td>'+wg.redthread+'</td>'+
                                 '<td>'+wg.onlinetime+'</td>'+
                                 '<td>'+wg.lastlogintime+'</td>' +	
                                 '<td>'+wg.viplevel+'</td>' +
                                 '<td>'+wg.channel+'</td>' +
                                 '<td>'+wg.totalrmbdiamond+'</td>' +
								 '<td class="am-text-middle">'+
								 	'<div class="tpl-table-black-operation">'+
                                        	'<a id="operation" class="updateBtn" href="javascript:;">'+
												'<i class="am-icon-pencil"></i> 操作'+ 
										 	 '</a>'+
                                    	'</div>'+
                                    '</td>'+
				             '</tr>';
	 			}
	 			}
	 		});
	 		$("#addressbody").append(content);     
	 	});
	 };
	 
	 //下一页
	 function nextpage(){
	 	$(document).on('click','#nextpage',function(){
	 		var pageno=document.getElementById("pageNo").value;
	 		var lastpage=document.getElementById("lastpage").value;
	 		var page;
	 		if(parseInt(pageno)>=parseInt(lastpage)){
	 			layer.msg("已是末页！");
	 			return;
	 		}else{
	 			 page=parseInt(pageno)+1;	
	 		}
	 		document.getElementById("pageNo").value=page;
	 		$("#addressbody").empty();
	 		var content="";
	 		$.each(${listArray},function(index,wg){
	 			if(index>=${size}*(page-1)){
		 			if(index<${size}*page){
		 				content+='<tr>'+
									 '<td>'+(index+1)+'</td>' +
	 								 '<td class="am-text-middle" >'+wg.serveruid+'</td>' +
	                                 '<td>'+wg.username+'</td>' +
	                                 '<td>'+wg.playername+'</td>' +
	                                 '<td>'+wg.level+'</td>' +
	                                 '<td>'+wg.gold+'</td>' +
	                                 '<td>'+wg.physical+'</td>' +
	                                 '<td>'+wg.diamond+'</td>' +
	                                 '<td>'+wg.arenagold+'</td>'+
	                                 '<td>'+wg.lovecurrency+'</td>'+
	                                 '<td>'+wg.bean+'</td>' +
	                                 '<td>'+wg.hangupnum+'</td>' +
	                                 '<td>'+wg.lovesection+'</td>' +
                                 	 '<td>'+wg.redthread+'</td>'+
	                                 '<td>'+wg.onlinetime+'</td>'+
	                                 '<td>'+wg.lastlogintime+'</td>' +	
	                                 '<td>'+wg.viplevel+'</td>' +
	                                 '<td>'+wg.channel+'</td>' +
	                                 '<td>'+wg.totalrmbdiamond+'</td>' +
									 '<td class="am-text-middle">'+
									 	'<div class="tpl-table-black-operation">'+
									 			'<a id="operation" class="updateBtn" href="javascript:;">'+
													'<i class="am-icon-pencil"></i> 操作'+ 
											 	 '</a>'+
	                                    	'</div>'+
	                                    '</td>'+
					             '</tr>';
		 			}
	 			}
	 		});
	 		$("#addressbody").append(content);             
	 	});
	 };
	 //末页
	 function lastpage(){
	 	$(document).on('click','#lastpage',function(){
	 		var pageno=document.getElementById("pageNo").value;
	 		var lastpage=document.getElementById("lastpage").value;
	 		if(pageno==lastpage){
	 			layer.msg("已是末页！");
	 			return;
	 		}
	 		document.getElementById("pageNo").value=lastpage;
			$("#addressbody").empty();
	 		var content="";
	 		$.each(${listArray},function(index,wg){
	 			if(index>=(lastpage-1)*${size}){
	 				content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
 								 '<td class="am-text-middle" >'+wg.serveruid+'</td>' +
                                 '<td>'+wg.username+'</td>' +
                                 '<td>'+wg.playername+'</td>' +
                                 '<td>'+wg.level+'</td>' +
                                 '<td>'+wg.gold+'</td>' +
                                 '<td>'+wg.physical+'</td>' +
                                 '<td>'+wg.diamond+'</td>' +
                                 '<td>'+wg.arenagold+'</td>'+
                                 '<td>'+wg.lovecurrency+'</td>'+
                                 '<td>'+wg.bean+'</td>' +
                                 '<td>'+wg.hangupnum+'</td>' +
                                 '<td>'+wg.lovesection+'</td>' +
                                 '<td>'+wg.redthread+'</td>'+
                                 '<td>'+wg.onlinetime+'</td>'+
                                 '<td>'+wg.lastlogintime+'</td>' +	
                                 '<td>'+wg.viplevel+'</td>' +
                                 '<td>'+wg.channel+'</td>' +
                                 '<td>'+wg.totalrmbdiamond+'</td>' +
								 '<td class="am-text-middle">'+
								 	'<div class="tpl-table-black-operation">'+
                                       	'<a id="operation" class="updateBtn" href="javascript:;">'+
												'<i class="am-icon-pencil"></i> 操作'+ 
										'</a>'+
                                    '</div>'+
                                    '</td>'+
				             '</tr>';
	 			
	 			}
	 		});
	 		$("#addressbody").append(content); 
	 	});
	 };
</script>
</head>
<body class="theme-black">
	<!-- 内容区域 -->

	<div class="theme-black">
		<div class="row">
			<div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
				<div class="widget am-cf">
					<div class="widget-head am-cf">
						<div class="widget-title  am-cf" >在线玩家列表</div>
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
						<%--  <div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
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
                                </div>
							 --%>
						<!-- 内容区域 -->
						<form action="wglist.jsp" method="post" id="hp_form"
							name="hp_form" data-am-validator
							class="am-form tpl-form-line-form">

							<div class="am-u-sm-12 am-u-md-12 am-u-lg-3">
								 <div
									class="am-input-group am-input-group-sm tpl-form-border-form cl-p">
									<table>
                                    	<tr>
                                    		<td>
												<input type="text" class="am-form-field" placeholder="请输入熊猫id" align="right"
												id="userName" name="userName" />
											</td>	
											<td>
											<input type="text" class="am-form-field" placeholder="请输入昵称" align="left"
											id="playName" name="playName" />
											</td>
									    	<td>
										    	<span class="am-input-group-btn">
												    <button class="am-btn  am-btn-default am-btn-success tpl-table-list-field am-icon-search"
													id="queryuser" name="queryuser" type="button"
													onclick="selectwg();"></button> 
												</span>
											</td>
                                       </tr>
                                  </table>
								</div>
							</div>
						</form>
						<div class="am-u-sm-12">
							<table width="100%"
								class="am-table am-table-compact am-table-striped tpl-table-black "
								id="example-r">
								<thead>
									<tr>
										<th>编号</th>
										<th>serveruid</th>
										<th>熊猫id</th>
										<th>昵称</th>
										<th>等级</th>
										<th>金币</th>
										<th>体力</th>
										<th>钻石</th>
										<th>百花勋章</th>
										<th>情缘线索</th>
										<th>相思豆</th>
										<th>游历值</th>
										<th>姻缘结</th>
										<th>红线</th>
										<th>在线时长(分钟)</th>
										<th>最后登录时间</th>
										<th>vip等级</th>
										<th>渠道</th>
										<th>充值总数</th>
										<th></th>
									</tr>
								</thead>
								<tbody id="addressbody">
									<s:forEach var="wg" items="${list}" varStatus="status">
										<s:if test="${status.count<=16 }">
										<tr>
											<td>${status.count }</td>
											<td class="am-text-middle">${wg.serveruid}</td>
											<td>${wg.username }</td>
											<td>${wg.playername }</td>
											<td>${wg.level }</td>
											<td>${wg.gold }</td>
											<td>${wg.physical }</td>
											<td>${wg.diamond }</td>
											<td>${wg.arenagold }</td>
											<td>${wg.lovecurrency }</td>
											<td>${wg.bean }</td>
											<td>${wg.hangupnum }</td>
											<td>${wg.lovesection }</td>
											<td>${wg.redthread }</td>
											<td>${wg.onlinetime }</td>
											<td>${wg.lastlogintime }</td>
											
											<td>${wg.viplevel }</td>
											<td>${wg.channel }</td>
											<td>${wg.totalrmbdiamond }</td>
											<td class="am-text-middle">
												<div class="tpl-table-black-operation">
													<a id="operation" class="updateBtn" href="javascript:;">
														<i class="am-icon-pencil"></i> 操作 </a>
												</div>
										    </td>
										</tr>
										</s:if>
									</s:forEach>
								</tbody>
							</table>
						</div>
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
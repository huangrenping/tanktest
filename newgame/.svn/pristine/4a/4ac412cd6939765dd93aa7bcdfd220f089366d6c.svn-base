<%@page import="web.webSocket.card.CardManager"%>
<%@page import="web.webSocket.lovetree.LovetreeManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"    
    import="web.webSocket.player.PlayerManager,
    java.util.*,
    web.webSocket.lovetree.Lovetree,
    web.webSocket.message.Messagepush,
    web.webSocket.pojo.WgPlayerserver,
    web.webSocket.pojo.WgLovetree,
    web.webSocket.pojo.WgHost,
    web.webSocket.plotone.PlotoneManager,
    web.webSocket.plotone.Chapterone,
    web.webSocket.pojo.WgPlotchapterapt,
    web.webSocket.card.Host"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<%
 	String playerid=request.getParameter("serveruid");
 	
  	if(playerid==null || playerid.equals("")){
 		return ;
 	}
 	String serverid=request.getParameter("serverid");
	long seruid=Long.parseLong(playerid);
	WgPlayerserver wg=PlayerManager.getInstance().getplayer(seruid);
	if(wg==null){
 		return ;
 	}
 	List<Messagepush> listthree=(List<Messagepush>)session.getAttribute("listthree");
 	int num=0;
 	//检查账号是否有该权限
	for(Messagepush messagepush:listthree){
		if(messagepush.getType()==20107){
			num++;
			break;
		}
	}
	if(num<1){
		response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
		return ;
	}
	String parameter=request.getParameter("parameter");
	String cardidStr=request.getParameter("cardid");
	String serveridStr=request.getParameter("serverid");
	String idStr=request.getParameter("id");
	if(cardidStr!=null&&serveridStr!=null&&idStr!=null){
	//男主解锁
		//得到四个男主列表
		List<WgHost>listhost=wg.getHost().getList();
		int cardid=Integer.parseInt(cardidStr);
		if(Integer.valueOf(parameter)==1){
			for(WgHost wghost:listhost){
				if(wghost.getCardid()==cardid){					
					wghost.setIsopen(1);
					wghost.setDirty(true);
				}
			}			
 		}
 	//男主上锁
 		if(Integer.valueOf(parameter)==2){
			for(WgHost wghost:listhost){
				if(wghost.getCardid()==cardid){					
					wghost.setIsopen(0);
					wghost.setDirty(true);
				}
			}			
 		}
 	//男主约会剧情同步
	 	if(Integer.valueOf(parameter)==3){
	 		int count=0;
	 		Map<Integer,WgPlotchapterapt> returmap=wg.getPlotone().getmap();
			for(WgHost wghost:listhost){
				if(wghost.getCardid()==cardid){
					List<Chapterone> list=PlotoneManager.getInstance().getlistchapterone(cardid);
						for (Chapterone chapterone:list) {
							WgPlotchapterapt wgplot=returmap.get(chapterone.getId());
							if(wgplot!=null){//统计tosection也就是wgplot的maxschedule的总和即为wghost的progress
								//cc.setTosection(wgplot.getMaxschedule());
								count+=wgplot.getMaxschedule();
							}
						}
				wghost.setProgress(count);
				wghost.setDirty(true);
				}
			}			
	 	}
		
	}	
 	
	if(wg!=null){
		//查询男主列表
		List<WgHost>listhost=wg.getHost().getList();
		request.setAttribute("list", listhost);
		request.setAttribute("wg", wg);
	}
	
 %>
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
    <script type="text/javascript">
	layui.define(['form','layer','laypage','laydate'], function(exports){
		var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;
		openplotone();//男主解锁
		detailplotone();//约会剧情解锁
		lockplotone();//男主加锁
		syncplotone();//约会剧情同步
		});
		//约会剧情同步
		function syncplotone(){
		 	$(document).on('click','#syncplotone',function(syncplotone){
			var serverid=$(this).parent().parent().find("td input:eq(0)").val();
		 	var id=$(this).parent().parent().find("td input:eq(1)").val();
		 	var cardid=$(this).parent().parent().find("td input:eq(2)").val();
		 	var uid=$("#serveruid").val();	
		 	 	
			location.href =webPath+'/adm/wgplayer/plotone.jsp?serverid='+serverid+'&cardid='+cardid+
			'&parameter=3'+'&serveruid='+uid+'&id='+id;
			 
			 });
		  }; 
		 //男主解锁
		 function openplotone(){
		 	$(document).on('click','#openplotone',function(openplotone){
			var serverid=$(this).parent().parent().find("td input:eq(0)").val();
		 	var id=$(this).parent().parent().find("td input:eq(1)").val();
		 	var cardid=$(this).parent().parent().find("td input:eq(2)").val();
		 	var uid=$("#serveruid").val();	
		 	 	
			location.href =webPath+'/adm/wgplayer/plotone.jsp?serverid='+serverid+'&cardid='+cardid+
			'&parameter=1'+'&serveruid='+uid+'&id='+id;
			 
			 });
		  }; 
		  //男主加锁
		 function lockplotone(){
		 	$(document).on('click','#lockplotone',function(lockplotone){
			var serverid=$(this).parent().parent().find("td input:eq(0)").val();
		 	var id=$(this).parent().parent().find("td input:eq(1)").val();
		 	var cardid=$(this).parent().parent().find("td input:eq(2)").val();
		 	var uid=$("#serveruid").val();	
		 	 	
			location.href =webPath+'/adm/wgplayer/plotone.jsp?serverid='+serverid+'&cardid='+cardid+
			'&parameter=2'+'&serveruid='+uid+'&id='+id;
			 
			 });
		  };
			 //约会详情
		 function detailplotone(){
			 $(document).on('click','#detailplotone',function(){
				var serverid=$(this).parent().parent().find("td input:eq(0)").val();
			 	var id=$(this).parent().parent().find("td input:eq(1)").val();
			 	var cardid=$(this).parent().parent().find("td input:eq(2)").val();
			 	var uid=$("#serveruid").val();
			 		layer.closeAll();
			 		layer.open({
			 			type:2,
			 			title:['剧情信息'],
			 			area:['80%','90%'],
			 			shade:0.3,
			 			resize:false,
			 			closeBtn:1,
			 			anim:0,
			 			content:[webPath+'/adm/wgplayer/detatilplotone.jsp?serverid='+serverid+'&cardid='+cardid+
						'&serveruid='+uid+'&id='+id],
			 	    	end:function(){
			 	    		/* getaddall(1); */
			 	    	}
			 		});
			 	});
			};
	
</script>

</head>
<form action="adlove.jsp" method="post" id="hp_form" data-am-vaserveridator
							class="am-form tpl-form-line-form">
<body class="theme-black">

	<!-- 内容区域 -->
		<div class="theme-black">
				<div class="am-btn-group am-btn-group-xs" style="margin-top: 10px">
					<%-- <button id="saveBtn" type="submit" onclick="return vaserveridate_form(this);"
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
								<label for="user-name" class="am-u-sm-3 am-form-label">玩家昵称
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									 <input value="${wg.playername}" id="rolename" readonly="readonly" name="rolename" type="text"
										class="tpl-form-input" >
								</div>
							</div>
 							
 						  	<div class="am-u-sm-12">
 						  	
 						  	
                                 
                                 
 						  		<table>
	                                 <tr>
	                                 	<td></td>
	                                 	<td></td>
	                                 	<td>男主id</td>
	                                 	<td>男主名字</td>
	                                 	<td>是否解锁</td>
	                                 	<td>操作</td>
	                                 </tr>
	                                 <s:forEach var="list" items="${list}">
		                                 
			                                 <tr>
				                                 <%-- <td><img style="width: 50px;height: 50px;" src="http://hougong.xmwan.com/bin/h5/icon/${wgkna.iconName }" /></td> --%>
				                                 <%-- <td class="am-text-middle" style="display: none" >${list.serverid}</td> --%>
				                                 <td><input type="hidden" value="${list.serverid}" name="serverid" id="serverid" /></td>
				                                 <td><input type="hidden" value="${list.id}" name="id"/></td>
				                                 <td><input type="text" value="${list.cardid}"  readonly="readonly"/></td>
				                                 <%-- <td><input type="text" value="${list.hostname}"  readonly="readonly"/></td> --%>
				                                 <s:if test="${list.cardid==1}">
				                                 		<td><input type="text" value="夜空铭"  readonly="readonly"/></td>
				                                 </s:if>
				                                 <s:if test="${list.cardid==2}">
				                                 		<td><input type="text" value="齐钰"  readonly="readonly"/></td>
				                                 </s:if>
				                                 <s:if test="${list.cardid==3}">
				                                 		<td><input type="text" value="贺云铮"  readonly="readonly"/></td>
				                                 </s:if>
				                                 <s:if test="${list.cardid==4}">
				                                 		<td><input type="text" value="宫宸旭"  readonly="readonly"/></td>
				                                 </s:if>
				                                 <s:if test="${list.isopen==0}">
				                                 		<td><input type="text" value="否"  readonly="readonly"/></td>
				                                 </s:if>
				                                 <s:if test="${list.isopen==1}">
				                                 		<td><input type="text" value="是"  readonly="readonly"/></td>
				                                 </s:if>
				                                 <td>
												 <a id="openplotone" href="javascript:;" >
												<i class="am-icon-pencil"></i>男主解锁 </a>
												 <a id="lockplotone" href="javascript:;" >
												<i class="am-icon-pencil"></i>男主加锁 </a>
												<a id="detailplotone"  href="javascript:;" >
												<i class="am-icon-pencil"></i>约会解锁 </a>
												<a id="syncplotone"  href="javascript:;" >
												<i class="am-icon-pencil"></i>同步剧情 </a>
												</td>
			                                 </tr>
		                                 
                                 	 </s:forEach>
                                 </table>       
 							</div>
 
							<!-- 隐藏域-->
 									 <input id="serveruid" name="serveruid" type="hidden"
										value="${wg.serveruid}" />
						</form>
						<!-- 表单体  end-->
					</div>
				</div>
		</div>

</body>
</html>
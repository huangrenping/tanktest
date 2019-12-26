<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"    
    import="web.webSocket.player.PlayerManager,
    java.util.*,
    web.webSocket.util.GameServerManager,
    web.webSocket.pojo.WgPlayerserverClient,
    web.webSocket.pojo.WgPlayerserver,
    web.webSocket.message.Messagepush,
    web.webSocket.article.Knapsack,
    web.webSocket.article.ArticleManager,
    web.webSocket.article.ArticleClient,
    web.webSocket.pojo.WgKnapsack,
    web.webSocket.article.logic.impl.ArticleLogicImpl"%>
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
 	
 	List<Messagepush> listthree=(List<Messagepush>)session.getAttribute("listthree");
 	int num=0;
 	//检查账号是否有该权限
 	if(listthree!=null && listthree.size()>0){
	 	for(Messagepush messagepush:listthree){
			if(messagepush.getType()==20102){
				num++;
				break;
			}
		}
 	}
	if(num<1){
		response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
		return ;
	}
 	
	long seruid=Long.parseLong(playerid);
	WgPlayerserver wg=PlayerManager.getInstance().getplayer(seruid);
	ArticleLogicImpl articleLogicImpl=new ArticleLogicImpl();
	articleLogicImpl.setArticleManager(ArticleManager.getInstance()); 
	if(wg!=null){
		request.setAttribute("wg", wg);
		Map<String, Object> map=(Map<String, Object>)articleLogicImpl.getarticlemap(seruid);
		Map<String, Object> map2=(Map<String, Object>)map.get("map");
		List<ArticleClient> listarticleclient=(List<ArticleClient>)map2.get("articlelist");
		request.setAttribute("list", listarticleclient);
		
		//aidnummap逻辑
		Map<Integer,Integer> aidnummap=wg.getKnapsack().getAidnummap();
		List<ArticleClient> list2=new ArrayList<ArticleClient>();
		for(Integer in:aidnummap.keySet()){
			ArticleClient article2=new ArticleClient();
			article2.setAid(in);
			article2.setNum(aidnummap.get(in));
			list2.add(article2);
		}
		request.setAttribute("list2", list2);
		request.setAttribute("weburl2", GameServerManager.getInstance().getWeburl2());
	}
 %>
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
    <script type="text/javascript">
		layui.define(['form','layer','laypage','laydate'], function(exports){
		var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;
		getreceedit();
	      	
		});
		
			 //编辑弹窗
	 function getreceedit(){
	 	$(document).on('click','#selectoneuser',function(){
	 		var kid = $(this).parent().parent().find("td:eq(2)").text();
	 		var serveruid=document.getElementById("serveruid").value;
	 		layer.closeAll();
	 		layer.open({
	 			type:2,
	 			title:['编辑背包'],
	 			area:['80%','90%'],
	 			shade:0.3,
	 			resize:false,
	 			closeBtn:1,
	 			anim:0,
	 			offset: '100px',
	 			content:[webPath+'/adm/wgplayer/updateknapsack.jsp?serveruid='+serveruid+'&kid='+kid],
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
		<div class="theme-black">
				<div class="am-btn-group am-btn-group-xs" style="margin-top: 10px">
					<button id="saveBtn" type="button"
						class="am-btn am-btn-default am-btn-secondary">
						<span class="am-icon-save"></span> 保存
					</button>
<%-- 					<button onclick="window.history.go(-1)" type="button"
						class="am-btn am-btn-default am-btn-warning">
						<span class="am-icon-reply"></span> 返回
					</button> --%>
				</div>
			</div>

			<div class="row">

				<div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
					<div class="widget am-cf">

						<form id="hp_form" data-am-validator
							class="am-form tpl-form-line-form">
							
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
                                 
	                             <s:forEach var="a2" items="${list2}">
										<tr>
		                                 	<td>${a2.aid }:</td>
		                                 	<td>${a2.num }</td>
	                                 	</tr>
                                 </s:forEach>
                                 	 
                              </table>   
                                 
                                 
 						  		<table>
	                                 <tr>
	                                 	<td>道具id</td>
	                                 	<td>图标</td>
	                                 	<td>名字</td>
	                                 	<td>数量</td>
	                                 	<td></td>
	                                 </tr>
	                                 <s:forEach var="wgkna" items="${list}">
		                                 <s:if test="${wgkna.num>0}">
			                                 <tr>
			                                 	 <td>${wgkna.aid}</td>
				                                 <td><img style="width: 50px;height: 50px;" src="${weburl2 }/bin/h5/icon/${wgkna.iconName }" /></td>
				                                 <td class="am-text-middle" style="display: none">${wgkna.kid}</td>
				                                 <td><input type="text" value="${wgkna.name}"  readonly="readonly"/></td>
				                                 <td><input type="text" value="${wgkna.num}" readonly="readonly"/></td>
				                                 <td><a id="selectoneuser" value="${wgkna.kid}" class="updateBtn" href="javascript:;">
									                     <i class="am-icon-pencil"></i> 编辑
									                 </a>
									             </td>
			                                 </tr>
		                                 </s:if>
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
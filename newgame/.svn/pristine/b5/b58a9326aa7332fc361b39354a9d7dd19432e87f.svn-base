<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"    
    import="web.webSocket.player.PlayerManager,
    java.util.*,
    web.webSocket.pojo.WgPlayerserver,
    web.webSocket.message.Messagepush"%>
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
 	String message=request.getParameter("message");
 	if(playerid==null || playerid.equals("")){
 		return ;
 	}
 	
 	List<Messagepush> listthree=(List<Messagepush>)session.getAttribute("listthree");
 	int num=0;
 	//检查账号是否有该权限
 	if(listthree!=null && listthree.size()>0){
 		for(Messagepush messagepush:listthree){
			if(messagepush.getType()==20117){
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
	if(wg!=null){
		request.setAttribute("wg", wg);
		if(message!=null){
			wg.getWgPlayerserver3().setDailymessage(message);
			wg.getWgPlayerserver3().setDirty(true);
		}
		String dailymessage=wg.getWgPlayerserver3().getDailymessage();
		request.setAttribute("dailymessage", dailymessage);
	}
 %>
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
    <script type="text/javascript">
		layui.define(['form','layer','laypage','laydate'], function(exports){
		var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;
	      	
		});
		}
	 
</script>
</head>
<body class="theme-black">
<form action="growup.jsp" method="post" id="hp_form" data-am-validator
							class="am-form tpl-form-line-form">
	<!-- 内容区域 -->
		<div class="theme-black">
				<div class="am-btn-group am-btn-group-xs" style="margin-top: 10px">
					<button id="saveBtn" type="submit"
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
 							
 						  	<div class="am-form-group">
						      <label for="doc-ta-1">成长任务信息:</label>
						      <textarea class="" id="doc-ta-1" name="message" rows="10">${dailymessage}</textarea>
						    </div>
 
							<!-- 隐藏域-->
 									 <input id="serveruid" name="serveruid" type="hidden"
										value="${wg.serveruid}" />
						</form>
						<!-- 表单体  end-->
					</div>
				</div>
		</div>
</form>
</body>
</html>
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
    web.webSocket.player.PlayerManager,
    web.webSocket.rightdress.RightdressManager,
    web.webSocket.pojo.WgMain,
    web.webSocket.activity.Huodong,
    web.webSocket.article.Article"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
	
<%
String [] strs=request.getParameterValues("limitlibaostr");
if(strs!=null){
	ActivityManager.limitlibaosuperbagid=strs;
	ActivityManager.weeklibaosuperbagid=request.getParameter("weeklibaosuperbagid");
	ActivityManager.lifelibaosuperbagid=request.getParameter("lifelibaosuperbagid");
	ActivityManager.limitTimeGiftPackDay=Integer.valueOf(request.getParameter("limitTimeGiftPackDay"));
	ActivityManager.lifeTimeGiftPackDay=Integer.valueOf(request.getParameter("lifeTimeGiftPackDay"));
	out.print("<div style='color: white;'>修改完毕</div>");
}



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
    <link rel="stylesheet" href="<%=path %>/assets/css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="<%=path %>/assets/css/app.css">
    <script src="<%=path %>/assets/js/jquery.min.js"></script>
    <script src="<%=path %>/assets/js/amazeui.min.js"></script>
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
			
		});
		function send(){
			document.getElementById("send").submit();
		}
		
</script>
</head>
<body class="theme-black">
	<form id="send" action="changeActivityLibaoId.jsp" method="post" data-am-validator
							class="am-form tpl-form-line-form">
	<!-- 内容区域 -->
		<div class="theme-black">
				<div class="am-btn-group am-btn-group-xs" style="margin-top: 10px">
					<button id="saveBtn" type="button" onclick="send();"
						class="am-btn am-btn-default am-btn-secondary">
						<span class="am-icon-save"></span> 保存
					</button>
				</div>
			</div>

			<div class="row">

				<div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
					<div class="widget am-cf">
							 <small>请输入礼包id，用英文的“,”分割</small>
							<c:forEach var="limitlibaostr" items="${limitlibaosuperbagid }">
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">轮循礼包:
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${limitlibaostr}" class="limitlibaostr" name="limitlibaostr" type="text"
										class="tpl-form-input"placeholder="请输入礼包id，用英文的“,”分割">
								</div>
							</div>
							</c:forEach>
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">周末礼包:
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${weeklibaosuperbagid}" id="weeklibaosuperbagid" name="weeklibaosuperbagid" type="text"
										class="tpl-form-input"placeholder="请输入礼包id，用英文的“,”分割">
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">终生礼包:
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${lifelibaosuperbagid}" id="lifelibaosuperbagid" name="lifelibaosuperbagid" type="text"
										class="tpl-form-input"placeholder="请输入礼包id，用英文的“,”分割"> 
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">轮循礼包开启间隔时间（天）:
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${limitTimeGiftPackDay}" id="limitTimeGiftPackDay" name="limitTimeGiftPackDay" type="text"
										class="tpl-form-input"placeholder="请输入数字"> 
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">终生礼包开启间隔时间（天）:
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${lifeTimeGiftPackDay}" id="lifeTimeGiftPackDay" name="lifeTimeGiftPackDay" type="text"
										class="tpl-form-input"placeholder="请输入数字"> 
								</div>
							</div>
					</div>
				</div>
		</div>
	</form>
</body>
</html>
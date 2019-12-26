<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="web.webSocket.plot.PlotManager,
    java.util.*,
    web.webSocket.article.Article,
    java.util.regex.Pattern,
    java.util.regex.Matcher,
    web.webSocket.article.ArticleManager,
    web.webSocket.plot.Section,
    web.webSocket.plot.Content"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jstl/core_rt" %>
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
			String sectionid=request.getParameter("sectionid");
			int sid=Integer.valueOf(sectionid);
			List<Section> list=PlotManager.getInstance().getSectionlist();
			String diaoluoid="";
			for(Section section:list){
				if(section.getId()==Integer.valueOf(sectionid)){
					request.setAttribute("section", section);
					diaoluoid=section.getDiaoluoid();
					break;
				}
			}
			List<Content> contentlist=PlotManager.getInstance().getContentlist(Integer.valueOf(sectionid));
			request.setAttribute("contentlist", contentlist);
			String[] diaoluo=diaoluoid.split(",");
			//List<Article> articlelist=new ArrayList<Article>();
			String nameandid="";
			for(int i=0;i<diaoluo.length;i++){
				String diaoluos[]=diaoluo[i].split(":");
				Article article=ArticleManager.getInstance().getarticle(Integer.valueOf(diaoluos[0]));
				//articlelist.add(article);
				nameandid+=diaoluo[i]+"("+article.getName()+"),";
			}
			if(nameandid.substring(nameandid.length()-1,nameandid.length()).equals(",")){
				nameandid=nameandid.substring(0, nameandid.length()-1);
			}
			request.setAttribute("nameandid", nameandid);
		%>

<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
    <script type="text/javascript">
		layui.define(['form','layer','laypage','laydate'], function(exports){
		var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;
		//updiaoluo();
		}); 
	
	 //编辑弹窗
	/*  function updiaoluo(){
	 	$(document).on('click','#updiaoluo',function(){
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
	 			content:[webPath+'/adm/wgplayer/wgupdate.jsp?serveruid='+id],
	 	    	end:function(){
	 	    		window.location.reload();
	 	    	}
	 		});
	 	});
	 }; */
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
<%-- 					<button id="saveBtn" type="submit" onclick="return;"
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
								<label for="user-name" class="am-u-sm-3 am-form-label">章id：
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${section.chapterid}" readonly="readonly" id="playername" name="playername" type="text"
										class="tpl-form-input">
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">节id：
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${section.id}" readonly="readonly" name="sectionid" id="sectionid" type="text"
										class="tpl-form-input">
								</div>
							</div>

							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">节名称：
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${section.sectionname}" readonly="readonly" name="diamond" type="text"
										class="tpl-form-input" id="diamond">
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">掉落道具：
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${nameandid}" readonly="readonly" name="physical" type="text"
										class="tpl-form-input" id="physical" />
										<!-- <a id="updiaoluo" class="updateBtn" href="javascript:;">
							                <i class="am-icon-pencil"></i> 编辑掉落
							            </a> -->
								</div>
							</div>
							
							<div class="am-form-group">
								<s:forEach var="content" items="${contentlist }">
									<label for="user-name" class="am-u-sm-3 am-form-label">内容<%-- ${content.id } --%>：
										<span class="tpl-form-line-small-"></span>
									</label>
									<div class="am-u-sm-9">
										<input value="${content.content}" readonly="readonly" name="physical" type="text"
											class="tpl-form-input" id="physical" />
									</div>
								</s:forEach>
							</div>
							
			<%-- 				<!-- 隐藏域-->
 									<input id="serveruid" name="serveruid" type="hidden"
										value="${section.serveruid}" />  --%>
						</form>
						<!-- 表单体  end-->
					</div>
				</div>
		</div>
</body>
</html>
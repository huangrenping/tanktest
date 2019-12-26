<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="web.webSocket.login.LoginManager,
		    web.webSocket.player.PlayerManager,
		    java.util.*,
		    java.util.Date,
		    net.sf.json.JSONArray,
		    net.sf.json.JsonConfig,
		    web.webSocket.article.Article,
   			web.webSocket.article.ArticleManager,
		    java.text.SimpleDateFormat,
		    web.webSocket.pojo.WgPlayerserver,
		    web.webSocket.pojo.WgFeedback"%>
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
         	Collection<Article> collection=ArticleManager.getInstance().getArticlemap().values();
			List<Article> list=new ArrayList<Article>();
			list.addAll(collection);
			request.setAttribute("list", list);
			
         	String id=request.getParameter("id");
         	String sid=request.getParameter("sid");
         	String serveruid=request.getParameter("serveruid");
         	if(id!=null && sid!=null && serveruid!=null){
         		WgFeedback wgFeedback=new WgFeedback();
         		wgFeedback.setId(Integer.valueOf(id));
         		wgFeedback.setUid(Long.valueOf(serveruid));
         		wgFeedback.setServerid(Integer.valueOf(sid));
         		WgFeedback wgFeedback2=LoginManager.getInstance().selectOne(wgFeedback);
         		request.setAttribute("wgFeedback", wgFeedback2);
         		String attachment=wgFeedback2.getAttachment();
         		int statu=0;
         		String jieguo="";
         		if(attachment!=null && !attachment.equals("")){
         			String[] attachment2=attachment.split(",");
         			if(attachment2.length>=2){
         				statu=1;
         			}
         			jieguo=attachment;
         			request.setAttribute("statu", statu);
         			request.setAttribute("jieguo", jieguo);
         			request.setAttribute("articleid", attachment2[0].split(":")[0]);
         			request.setAttribute("num", attachment2[0].split(":")[1]);
         		}else{
         			request.setAttribute("articleid", -1);
         			request.setAttribute("num", -1);
         		}
         	}
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
	 
	//返回
	function validate_form(){
		//$("#hp_form").submit();
		//parent.layer.msg("保存成功!");
		var index = parent.layer.getFrameIndex(window.name); //获取当前窗体索引
		parent.layer.close(index); //执行关闭  这两句的意思是关闭当前窗口
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
<%-- 					<button id="saveBtn" type="submit" onclick="return;"
						class="am-btn am-btn-default am-btn-secondary">
						<span class="am-icon-save"></span> 保存
					</button> --%>
 					<button onclick="validate_form();" type="button"
						class="am-btn am-btn-default am-btn-warning">
						<span class="am-icon-reply"></span> 返回
					</button>
				</div>
			</div>
			<div class="row">
				<div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
					<div class="widget am-cf">
							
								
						<div class="am-form-group">
						      <label for="doc-ta-1">玩家反馈:</label>
						      <textarea class="" rows="5" id="doc-ta-1" disabled="disabled">${wgFeedback.content }</textarea>
						</div>
						
						<s:if test="${articleid!=-1 }">
							<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">物品列表:
								</label>
								<div class="am-u-sm-9">
									<select id="myarticle" name="myarticle" data-am-selected="{searchBox: 1,maxHeight: 400}" disabled="disabled">
											  
											  <s:forEach items="${list}" var="article">
											  	  <s:if test="${article.id==articleid }">
											  	  	  <option value="${article.id }" selected="selected">${article.name }</option>
												  </s:if>
												  <s:if test="${article.id!=articleid }">
												  	  <option value="${article.id }">${article.name }</option>
												  </s:if>
											  </s:forEach>
											</select>
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">数量：
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${num}" id="num" name="num" type="text"
										class="tpl-form-input"placeholder="" disabled="disabled"> <small></small>
								</div>
						</div>
					</s:if>
						
					<s:if test="${articleid==-1 }">
							<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">物品列表:
								</label>
								<div class="am-u-sm-9">
									<select id="myarticle" name="myarticle" data-am-selected="{searchBox: 1,maxHeight: 400}" disabled="disabled">
									  
									</select>
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">数量：
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="" id="num" name="num" type="text"
										class="tpl-form-input"placeholder="" disabled="disabled"> <small></small>
								</div>
						</div>
					</s:if>
						
						<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">状态:
								</label>
								<div class="am-u-sm-9">
									<s:if test="${wgFeedback.status==0 }">
										未发送
									</s:if>
									<s:if test="${wgFeedback.status!=0 }">
										已发送
									</s:if>
								</div>
							</div>
							
						<div class="am-form-group">
						      <label for="doc-ta-1">回复:</label>
						      <textarea class="" rows="5" id="doc-ta-1" disabled="disabled">${wgFeedback.answer }</textarea>
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
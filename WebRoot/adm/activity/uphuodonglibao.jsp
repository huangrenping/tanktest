<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="web.webSocket.article.ArticleManager,
    java.util.*,
    web.webSocket.util.GameServerManager,
    net.sf.json.JSONArray,
    web.webSocket.activity.ActivityManager,
    net.sf.json.JsonConfig,
    web.webSocket.util.Util,
    web.webSocket.article.ArticleManager,
    web.webSocket.rightdress.Part,
    web.webSocket.pojo.WgMain2,
    web.webSocket.message.Messagepush,
    web.webSocket.article.Article"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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

<link rel="stylesheet" href="path/to/css/amazeui.min.css"/>
<!-- <script src="http://code.jquery.com/jquery-2.1.3.min.js"></script> -->
<!-- <script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script> -->
<script src="<%=path %>/assets/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/echarts.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/moment-with-locales.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/amazeui.datetimepicker-se.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/moment.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/amazeui-pagination.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/common.js"></script> 
<%
	List<Messagepush> listthree=(List<Messagepush>)session.getAttribute("listthree");
 	int second=0;
 	//检查账号是否有该权限
 	if(listthree!=null && listthree.size()>0){
 		for(Messagepush messagepush:listthree){
			if(messagepush.getType()==100701){
				second++;
				break;
			}
		}
 	}
	if(second<1){
		response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
		return ;
	}
	ActivityManager activityManager=ActivityManager.getInstance();
	WgMain2 wgMain2=activityManager.getWgMain2();
	
	String datetimepicker1=request.getParameter("datetimepicker1");
	String datetimepicker2=request.getParameter("datetimepicker2");
	String newaid=request.getParameter("newaid");
	String activityname=request.getParameter("activityname");
	String explain=request.getParameter("explain");
	if(datetimepicker1!=null && !datetimepicker1.equals("") &&
	   datetimepicker2!=null && !datetimepicker2.equals("") &&
	   newaid!=null && !newaid.equals("") &&
	   activityname!=null && !activityname.equals("") &&
	   explain!=null && !explain.equals("")){
	   long time1=Util.dateTimeStamp2(datetimepicker1, "yyyy-MM-dd");
	   long time2=Util.dateTimeStamp2(datetimepicker2, "yyyy-MM-dd");
	   wgMain2.setActivityinfo(activityname+"@"+time1+"@"+time2+"@"+newaid+"@"+explain);
	   activityManager.updatewgmain2(wgMain2);
	}
	
			
	
	request.setAttribute("state", "关闭");
	request.setAttribute("articleid", "");
	request.setAttribute("startime", "");
	request.setAttribute("endtime", "");
	request.setAttribute("activityname", "");
	request.setAttribute("explain", "");
	String activityinfo=wgMain2.getActivityinfo();
	if(activityinfo!=null && !activityinfo.equals("")){
		String[] activityinfoarray=activityinfo.split("@");
		long startime=Long.valueOf(activityinfoarray[1]);
		long endtime=Long.valueOf(activityinfoarray[2]);
		int articleid=Integer.valueOf(activityinfoarray[3]);
		long nowtime=System.currentTimeMillis();
		request.setAttribute("activityname", activityinfoarray[0]);
		request.setAttribute("explain", activityinfoarray[4]);
		request.setAttribute("startime", Util.getDate(startime, 1));
		request.setAttribute("endtime", Util.getDate(endtime, 1));
		if(startime<nowtime && nowtime<endtime){
			request.setAttribute("state", "开启");
		}
		Article article=ArticleManager.getInstance().getarticle(articleid);
		if(article!=null){
			request.setAttribute("articleid", article.getId());
		}
	}
	
    ArticleManager articleManager=ArticleManager.getInstance();
    Collection<Article> articlecollection=articleManager.getArticlemap().values();
    List<Article> articlelist=new ArrayList<Article>();
	articlelist.addAll(articlecollection);
    request.setAttribute("articlelist", articlelist);
    
    %>
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
    <script type="text/javascript">
		layui.define(['form','layer','laypage','laydate'], function(exports){
		var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;
			//send();
		});
		function send(){
			var datetimepicker1=document.getElementById("datetimepicker1").value;
			var datetimepicker2=document.getElementById("datetimepicker2").value;
			var activityname=document.getElementById("activityname").value;
			var explain=document.getElementById("explain").value;
			
			if(datetimepicker1.length<=0){
				layer.msg("开始时间不允许为空!");
				return false;
			}else if(datetimepicker2.length<=0){
				layer.msg("结束时间不允许为空!");
				return false;
			}else if(activityname.length<=0){
				layer.msg("活动名称不允许空!");
				return false;
			}else if(explain.length<=0){
				layer.msg("活动文案不允许空!");
				return false;
			}else{
				document.getElementById("send").submit();
			}
		}
</script>
</head>
<body class="theme-black">
	<form id="send" action="uphuodonglibao.jsp" method="post" data-am-validator
							class="am-form tpl-form-line-form">
	<!-- 内容区域 -->
		<div class="theme-black">
				<div class="am-btn-group am-btn-group-xs" style="margin-top: 10px">
					<button id="saveBtn" type="button" onclick="send();"
						class="am-btn am-btn-default am-btn-secondary">
						<span class="am-icon-save"></span> 保存
					</button>
					<button onclick="window.history.go(-1)" type="button"
						class="am-btn am-btn-default am-btn-warning">
						<span class="am-icon-reply"></span> 返回
					</button>
				</div>
			</div>

			<div class="row">

				<div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
					<div class="widget am-cf">
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">活动名称:
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${activityname }" id="activityname" name="activityname" type="text"
										class="tpl-form-input">
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">开始时间
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<%-- <input value="${startime}" class="am-form-field" id='datetimepicker1' name='datetimepicker1'> --%>
									<input type="text" value="${startime}" id="datetimepicker1" name="datetimepicker1" class="am-form-field" placeholder="日历组件" data-am-datepicker readonly required />
								</div>
							</div>

							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">结束时间
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<%-- <input value="${endtime}" class="am-form-field" id='datetimepicker2' name='datetimepicker2'> --%>
									<input type="text" value="${endtime}" id="datetimepicker2" name="datetimepicker2" class="am-form-field" placeholder="日历组件" data-am-datepicker readonly required />
								</div>
							</div>
						
							<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">道具:
								</label>
								<div class="am-u-sm-9">
									<select id="newaid" name="newaid" data-am-selected="{searchBox: 1,maxHeight: 400}">
									  <c:if test="${articleid==-1 }">
										  <option value="-1" selected="selected"></option>
									  </c:if>
									  <c:if test="${articleid!=-1 }">
									  	  <option value="-1"></option>
									  </c:if>
									  <c:forEach items="${articlelist }" var="article">
									  			<c:if test="${article.id==articleid }">
									  				<option value="${article.id }" selected="selected">${article.name }</option>
									  			</c:if>
												<c:if test="${article.id!=articleid }">
									  				<option value="${article.id }">${article.name }</option>
									  			</c:if>
									  </c:forEach>
									</select>
								</div>
							</div>
							
							<div class="am-form-group">
						      <label for="doc-ta-1">活动文案:</label>
						      <textarea class="" id="explain" name="explain" rows="10">${explain}</textarea>
						    </div>
						    
						
					
						</div>

						<!-- 表单体  end-->
						<!-- <input type="text" id="usernametext" name="usernametext"  type="hidden"></input> -->
					</div>
				</div>
		</div>
	</form>
</body>
</html>
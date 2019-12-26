<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="web.webSocket.article.ArticleManager,
    java.util.*,
    web.webSocket.util.GameServerManager,
    net.sf.json.JSONArray,
    web.webSocket.activity.ActivityManager,
    net.sf.json.JsonConfig,
    web.webSocket.util.Util,
    web.webSocket.card.Card,
    web.webSocket.card.CardManager,
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
			if(messagepush.getType()==101901){
				second++;
				break;
			}
		}
 	}
	if(second<1){
		response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
		return ;
	}
	Collection<Card> collection=CardManager.getInstance().getCardmap().values();
	List<Card> list=new ArrayList<Card>();
	list.addAll(collection);
	request.setAttribute("list", list);
	ActivityManager activityManager=ActivityManager.getInstance();
	WgMain2 wgMain2=activityManager.getWgMain2();
	String myarticle=request.getParameter("myarticle");
	String myarticle2=request.getParameter("myarticle2");
	String myarticle3=request.getParameter("myarticle3");
	String num=request.getParameter("num");
	String num2=request.getParameter("num2");
	String num3=request.getParameter("num3");
	String num4=request.getParameter("num4");
	String time=request.getParameter("time");
	String time2=request.getParameter("time2");
	if(myarticle!=null && !myarticle.equals("") &&
	   myarticle2!=null && !myarticle2.equals("") &&
	   myarticle3!=null && !myarticle3.equals("") &&
	   num!=null && !num.equals("") &&
	   num2!=null && !num2.equals("") &&
	   num3!=null && !num3.equals("") &&
	   num4!=null && !num4.equals("") &&
	   time!=null && !time.equals("") &&
	   time2!=null && !time2.equals("")){
		wgMain2.setHangupcardid(Integer.valueOf(myarticle)+","+Integer.valueOf(myarticle2)+","+Integer.valueOf(myarticle3));
		wgMain2.setHanguptime(num+","+num2+","+num3);
		wgMain2.setHangupprobability(Integer.valueOf(num4));
		int time2new=Integer.valueOf(time2);
		int timenew=Integer.valueOf(time);
		wgMain2.setUptime(timenew+","+time2new);
		activityManager.updatewgmain2(wgMain2);
	}
	
	String hanguptime=wgMain2.getHanguptime();
	if(hanguptime!=null){
		List<String> list2=Arrays.asList(hanguptime.split(","));
		request.setAttribute("listnum", list2);
	}
	int cardid=0;
	int cardid2=0;
	int cardid3=0;
	request.setAttribute("jilv", wgMain2.getHangupprobability());
	CardManager cardManager=CardManager.getInstance();
	
	String hangupcardid=wgMain2.getHangupcardid();
	if(hangupcardid!=null && !hangupcardid.equals("")){
		String[] hangupcardid2=hangupcardid.split(",");
		for(int i=0;i<hangupcardid2.length;i++){
			if(i==0){
				Card card=cardManager.getcardone(Integer.valueOf(hangupcardid2[0]));
				if(card!=null){
					cardid=card.getId();
				}
			}
			if(i==1){
				Card card=cardManager.getcardone(Integer.valueOf(hangupcardid2[1]));
				if(card!=null){
					cardid2=card.getId();
				}
			}
			if(i==2){
				Card card=cardManager.getcardone(Integer.valueOf(hangupcardid2[2]));
				if(card!=null){
					cardid3=card.getId();
				}
			}
		}
	}
	request.setAttribute("cardid", cardid);	
    request.setAttribute("cardid2", cardid2);	
    request.setAttribute("cardid3", cardid3);	
    String newtime=wgMain2.getUptime();
    int uptime=0;
    int uptime2=0;
    if(newtime!=null && !newtime.equals("")){
    	String[] newtime2=newtime.split(",");
    	uptime=Integer.valueOf(newtime2[0]);
    	uptime2=Integer.valueOf(newtime2[1]);
    }
    request.setAttribute("uptime", uptime);
	request.setAttribute("uptime2", uptime2);
    %>
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
    <script type="text/javascript">
		layui.define(['form','layer','laypage','laydate'], function(exports){
		var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;
			//send();
		});
		function send(){
			/* var datetimepicker1=document.getElementById("datetimepicker1").value;
			var datetimepicker2=document.getElementById("datetimepicker2").value;
			var activityname=document.getElementById("activityname").value;
			var explain=document.getElementById("explain").value; */
			
			var num=document.getElementById("num").value;
			var num2=document.getElementById("num2").value;
			var num3=document.getElementById("num3").value;
			var num4=document.getElementById("num4").value;
			var time=document.getElementById("time").value;
			var time2=document.getElementById("time2").value;
			if(isNaN(num)|| parseInt(num)<=0){
				layer.msg("初级分钟输入有误!");
				return false;
			}else if(isNaN(num2)|| parseInt(num2)<0){
				layer.msg("中级分钟输入有误!");
				return false;
			}else if(isNaN(num3)|| parseInt(num3)<0){
				layer.msg("高级分钟输入有误!");
				return false;
			}else if(isNaN(num4)|| parseInt(num4)<0 || parseInt(num4)>100){
				layer.msg("几率输入有误!");
				return false;
			}else if(isNaN(time)|| parseInt(time)<0){
				layer.msg("刷新卡牌间隔天数输入有误!");
				return false;
			}else if(isNaN(time2)|| parseInt(time2)<0){
				layer.msg("当前天数输入有误!");
				return false;
			}else{
				document.getElementById("send").submit();
			}
			
			//document.getElementById("send").submit();
		}
</script>
</head>
<body class="theme-black">
	<form id="send" action="uphangupcardid.jsp" method="post" data-am-validator
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
									<input value="游历挂机卡牌" id="activityname" name="activityname" type="text" readonly="readonly"
										class="tpl-form-input">
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">初级卡牌:
								</label>
								<div class="am-u-sm-9">
									<select id="myarticle" name="myarticle" data-am-selected="{searchBox: 1,maxHeight: 400}">
									  <c:if test="${cardid==0 }">
											<option value="0" selected="selected"></option>
									  </c:if>
									  <c:if test="${cardid!=0 }">
											<option value="0"></option>
									  </c:if>
									  <c:forEach items="${list }" var="card">
									  		<c:if test="${card.id==cardid }">
											    <option value="${card.id }" selected="selected">${card.name }</option>
											</c:if>
											<c:if test="${card.id!=cardid }">
												<option value="${card.id }">${card.name }</option>
											</c:if>
									  </c:forEach>
									</select>
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">中级卡牌:
								</label>
								<div class="am-u-sm-9">
									<select id="myarticle2" name="myarticle2" data-am-selected="{searchBox: 1,maxHeight: 400}">
									  <c:if test="${cardid2==0 }">
											<option value="0" selected="selected"></option>
									  </c:if>
									  <c:if test="${cardid2!=0 }">
											<option value="0"></option>
									  </c:if>
									  <c:forEach items="${list }" var="card">
									  		<c:if test="${card.id==cardid2 }">
											    <option value="${card.id }" selected="selected">${card.name }</option>
											</c:if>
											<c:if test="${card.id!=cardid2 }">
												<option value="${card.id }">${card.name }</option>
											</c:if>
									  </c:forEach>
									</select>
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">高级卡牌:
								</label>
								<div class="am-u-sm-9">
									<select id="myarticle3" name="myarticle3" data-am-selected="{searchBox: 1,maxHeight: 400}">
									  <c:if test="${cardid3==0 }">
											<option value="0" selected="selected"></option>
									  </c:if>
									  <c:if test="${cardid3!=0 }">
											<option value="0"></option>
									  </c:if>
									  <c:forEach items="${list }" var="card">
									  		<c:if test="${card.id==cardid3 }">
											    <option value="${card.id }" selected="selected">${card.name }</option>
											</c:if>
											<c:if test="${card.id!=cardid3 }">
												<option value="${card.id }">${card.name }</option>
											</c:if>
									  </c:forEach>
									</select>
								</div>
							</div>
							
							<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">卡牌刷新间隔天数：
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${uptime}" name="time" type="text"
														class="tpl-form-input" id="time"><small>友情提示:输入天数</small>
												</div>
							</div>
							
							<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">当前天数：
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${uptime2}" name="time2" type="text"
														class="tpl-form-input" id="time2"><small>友情提示:可以不输入,系统每日自动增长</small>
												</div>
							</div>
							
							<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">初级：
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${listnum.get(0)}" name="num" type="text"
														class="tpl-form-input" id="num"><small>友情提示:输入分钟</small>
												</div>
							</div>
							
							<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">中级：
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${listnum.get(1)}" name="num2" type="text"
														class="tpl-form-input" id="num2"><small>友情提示:输入分钟</small>
												</div>
							</div>
							
							<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">高级：
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${listnum.get(2)}" name="num3" type="text"
														class="tpl-form-input" id="num3"><small>友情提示:输入分钟</small>
												</div>
							</div>
							
							<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">每分钟事件几率：
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${jilv}" name="num4" type="text"
														class="tpl-form-input" id="num4"><small>友情提示:大于等于0并且小于等于100</small>
												</div>
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
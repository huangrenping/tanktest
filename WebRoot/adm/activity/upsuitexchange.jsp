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
    web.webSocket.rightdress.RightdressManager,
    web.webSocket.rightdress.Part,
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
			if(messagepush.getType()==100301){
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
	String newaid=request.getParameter("newaid");
	String myarticle=request.getParameter("myarticle");
	String myarticle2=request.getParameter("myarticle2");
	String myarticle3=request.getParameter("myarticle3");
	String myarticle4=request.getParameter("myarticle4");
	String myarticle5=request.getParameter("myarticle5");
	String myarticle6=request.getParameter("myarticle6");
	String myarticle7=request.getParameter("myarticle7");
	
	String num1=request.getParameter("num");
	String num2=request.getParameter("num2");
	String num3=request.getParameter("num3");
	String num4=request.getParameter("num4");
	String num5=request.getParameter("num5");
	String num6=request.getParameter("num6");
	String num7=request.getParameter("num7");
	
	
	String opportunitynew=request.getParameter("opportunity");
	String explain=request.getParameter("explain");
	String suiname=request.getParameter("suiname");
	
	String radio1=request.getParameter("radio1");
	String datetimepicker1=request.getParameter("datetimepicker1");
	String datetimepicker2=request.getParameter("datetimepicker2");
	if(newaid!=null && !newaid.equals("") &&
		myarticle!=null && !myarticle.equals("") &&
		myarticle2!=null && !myarticle2.equals("") &&
		myarticle3!=null && !myarticle3.equals("") &&
		myarticle4!=null && !myarticle4.equals("") &&
		myarticle5!=null && !myarticle5.equals("") &&
		myarticle6!=null && !myarticle6.equals("") &&
		myarticle7!=null && !myarticle7.equals("") &&
		num1!=null && !num1.equals("") &&
		num2!=null && !num2.equals("") &&
		num3!=null && !num3.equals("") &&
		num4!=null && !num4.equals("") &&
		num5!=null && !num5.equals("") &&
		num6!=null && !num6.equals("") &&
		num7!=null && !num7.equals("") &&
		explain!=null && !explain.equals("") &&
		suiname!=null && !suiname.equals("") &&
		opportunitynew!=null && !opportunitynew.equals("") &&
		datetimepicker1!=null && !datetimepicker1.equals("") &&
		datetimepicker2!=null && !datetimepicker2.equals("") &&
		radio1!=null && !radio1.equals("")){
		int[] newsuitpart=new int[7];
		newsuitpart[0]=Integer.valueOf(myarticle);
		newsuitpart[1]=Integer.valueOf(myarticle2);
		newsuitpart[2]=Integer.valueOf(myarticle3);
		newsuitpart[3]=Integer.valueOf(myarticle4);
		newsuitpart[4]=Integer.valueOf(myarticle5);
		newsuitpart[5]=Integer.valueOf(myarticle6);
		newsuitpart[6]=Integer.valueOf(myarticle7);
		int[] newsuitnum=new int[7];
		newsuitnum[0]=Integer.valueOf(num1);
		newsuitnum[1]=Integer.valueOf(num2);
		newsuitnum[2]=Integer.valueOf(num3);
		newsuitnum[3]=Integer.valueOf(num4);
		newsuitnum[4]=Integer.valueOf(num5);
		newsuitnum[5]=Integer.valueOf(num6);
		newsuitnum[6]=Integer.valueOf(num7);
		activityManager.upWgmain(Util.Join(newsuitpart, ","), Util.Join(newsuitnum, ","), Integer.valueOf(newaid),suiname+":"+explain,Integer.valueOf(opportunitynew));
		//修改活动
		String[] huodong2new=activityManager.getHuodong().split(",");
		for(int i=0; i<huodong2new.length; i++){
			String [] huodong3new=huodong2new[i].split("@");
			if(huodong3new[0].equals("4")){
				long time1=Util.dateTimeStamp2(datetimepicker1, "yyyy-MM-dd");
				long time2=Util.dateTimeStamp2(datetimepicker2, "yyyy-MM-dd");
				huodong2new[i]="4@"+radio1+"@"+time1+"@"+time2+"@0";
				activityManager.upWgmainhuodong(Util.Join(huodong2new, ","));
			}
		}
	}
	int[] suitpart=activityManager.getSuitpart();
	int[] num=activityManager.getSuitnum();
	String suitexplain=activityManager.getSuitexplain();
	int opportunity=activityManager.getOpportunity();
	request.setAttribute("opportunity", opportunity);
	if(suitexplain!=null && !suitexplain.equals("")){
		String[] suitexplain2=suitexplain.split(":");
		request.setAttribute("suiname", suitexplain2[0]);
    	request.setAttribute("explain", suitexplain2[1]);
	}
	int aid=activityManager.getSuitaid();
	
	request.setAttribute("aid", aid);

	request.setAttribute("suitpart", suitpart[0]);
    request.setAttribute("num", num[0]);
    
    request.setAttribute("suitpart2", suitpart[1]);
    request.setAttribute("num2", num[1]);
    
    request.setAttribute("suitpart3", suitpart[2]);
    request.setAttribute("num3", num[2]);
    
    request.setAttribute("suitpart4", suitpart[3]);
    request.setAttribute("num4", num[3]);
    
    request.setAttribute("suitpart5", suitpart[4]);
    request.setAttribute("num5", num[4]);
    
    request.setAttribute("suitpart6", suitpart[5]);
    request.setAttribute("num6", num[5]);
    
    request.setAttribute("suitpart7", suitpart[6]);
    request.setAttribute("num7", num[6]);
    
    String[] huodong2=activityManager.getHuodong().split(",");
	for(int i=0; i<huodong2.length; i++){
		String [] huodong3=huodong2[i].split("@");
		if(Integer.valueOf(huodong3[0])==4){
			
			request.setAttribute("state",huodong3[1]);
			
			if(huodong3[2].equals("0")){
				request.setAttribute("startime", "");
			}else{
				request.setAttribute("startime", Util.getDate(Long.valueOf(huodong3[2]), 1));
			}
			if(huodong3[3].equals("0")){
				request.setAttribute("endtime", "");
			}else{
				request.setAttribute("endtime", Util.getDate(Long.valueOf(huodong3[3]), 1));
			}
			break;
		}
	}
    RightdressManager rightdressManager=RightdressManager.getInstance();
    List<Part> partlist=rightdressManager.getPartlist();
    request.setAttribute("partlist", partlist);
    
    ArticleManager articleManager=ArticleManager.getInstance();
    Collection<Article> articlelist=articleManager.getArticlemap().values();
    List<Article> articlelist2=new ArrayList<Article>();
    articlelist2.addAll(articlelist);
    request.setAttribute("articlelist", articlelist2);
    
    %>
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
    <script type="text/javascript">
		layui.define(['form','layer','laypage','laydate'], function(exports){
		var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;
			//send();
		});
		function send(){
			var suiname=document.getElementById("suiname").value;
			var datetimepicker1=document.getElementById("datetimepicker1").value;
			var datetimepicker2=document.getElementById("datetimepicker2").value;
			var num=document.getElementById("num").value;
			var num2=document.getElementById("num2").value;
			var num3=document.getElementById("num3").value;
			var num4=document.getElementById("num4").value;
			var num5=document.getElementById("num5").value;
			var num6=document.getElementById("num6").value;
			var num7=document.getElementById("num7").value;
			var opportunity=document.getElementById("opportunity").value;
			var explain=document.getElementById("explain").value;
			if(suiname.length<=0){
				layer.msg("套装名字不允许为空!");
				return false;
			}else if(datetimepicker1.length<=0){
				layer.msg("开始时间不允许为空!");
				return false;
			}else if(datetimepicker2.length<=0){
				layer.msg("结束时间不允许为空!");
				return false;
			}else if(isNaN(num)){
				layer.msg("请输入数量!");
				return false;
			}else if(isNaN(num2)){
				layer.msg("请输入数量!");
				return false;
			}else if(isNaN(num3)){
				layer.msg("请输入数量!");
				return false;
			}else if(isNaN(num4)){
				layer.msg("请输入数量!");
				return false;
			}else if(isNaN(num5)){
				layer.msg("请输入数量!");
				return false;
			}else if(isNaN(num6)){
				layer.msg("请输入数量!");
				return false;
			}else if(isNaN(num7)){
				layer.msg("请输入数量!");
				return false;
			}else if(isNaN(opportunity)){
				layer.msg("兑换道具掉落几率请输入0-100!");
				return false;
			}else if(parseInt(opportunity)<0){
				layer.msg("兑换道具掉落几率请输入0-100!");
				return false;
			}else if(parseInt(opportunity)>100){
				layer.msg("兑换道具掉落几率请输入0-100!");
				return false;
			}else if(explain.length<=0){
				layer.msg("套装说明不允许为空!");
				return false;
			}else{
				document.getElementById("send").submit();
			}
		}
</script>
</head>
<body class="theme-black">
	<form id="send" action="upsuitexchange.jsp" method="post" data-am-validator
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
								<label for="user-name" class="am-u-sm-3 am-form-label">套装名称:
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${suiname}" id="suiname" name="suiname" type="text"
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
								<label for="user-name" class="am-u-sm-3 am-form-label">状态
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<c:if test="${state==0 }">
										<label class="am-radio">
							     	 <input type="radio" name="radio1" id="radio1" value="1" data-am-ucheck>
							      		开启
							    	</label>
							    	<label class="am-radio">
							     	 <input type="radio" name="radio1" id="radio1" value="0" data-am-ucheck checked="checked">
							      		关闭
							    	</label>
									</c:if>
									
									<c:if test="${state!=0 }">
									<label class="am-radio">
							     	 <input type="radio" name="radio1" id="radio1" value="1" data-am-ucheck checked="checked">
							      		开启
							    	</label>
							    	<label class="am-radio">
							     	 <input type="radio" name="radio1" id="radio1" value="0" data-am-ucheck >
							      		关闭
							    	</label>
									</c:if>
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">兑换道具掉落几率:
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${opportunity}" id="opportunity" name="opportunity" type="text"
										class="tpl-form-input"placeholder="请输入0-100"> <small>请输入0-100</small>
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">兑换道具:
								</label>
								<div class="am-u-sm-9">
									<select id="newaid" name="newaid" data-am-selected="{searchBox: 1,maxHeight: 400}">
									  <c:if test="${aid==0 }">
										  <option value="0" selected="selected"></option>
									  </c:if>
									  <c:if test="${aid!=0 }">
									  	  <option value="0"></option>
									  </c:if>
									  <c:forEach items="${articlelist }" var="article">
									  			<c:if test="${article.id==aid }">
									  				<option value="${article.id }" selected="selected">${article.name }</option>
									  			</c:if>
												<c:if test="${article.id!=aid }">
									  				<option value="${article.id }">${article.name }</option>
									  			</c:if>
									  </c:forEach>
									</select>
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">兑换套装:
								</label>
								<div class="am-u-sm-9">
								<table>
									<tr>
										<td>
											<select id="myarticle" name="myarticle" data-am-selected="{searchBox: 1,maxHeight: 400}">
											  <c:if test="${suitpart==-1 }">
											  	  <option value="-1" selected="selected"></option>
											  </c:if>
											  <c:if test="${suitpart!=-1 }">
											  	  <option value="-1"></option>
											  </c:if>
											  <c:forEach items="${partlist}" var="part">
											  <c:if test="${part.id==suitpart }">
											  	  <option value="${part.id }" selected="selected">${part.name }</option>
											  </c:if>
											  	
											  <c:if test="${part.id!=suitpart }">
											  	  <option value="${part.id }">${part.name }</option>
											  </c:if>
											  </c:forEach>
											</select>
										</td>
									
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">数量：
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${num}" name="num" type="text"
														class="tpl-form-input" id="num">
												</div>
											</div>
										</td>
								</tr>
							</table>
							</div>
						</div>
						
						<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">
								</label>
								<div class="am-u-sm-9">
								<table>
									<tr>
										<td>
											<select id="myarticle2" name="myarticle2" data-am-selected="{searchBox: 1,maxHeight: 400}">
											  <c:if test="${suitpart2==-1 }">
											  	  <option value="-1" selected="selected"></option>
											  </c:if>
											  <c:if test="${suitpart2!=-1 }">
											  	  <option value="-1"></option>
											  </c:if>
											  <c:forEach items="${partlist}" var="part">
											  <c:if test="${part.id==suitpart2 }">
											  	  <option value="${part.id }" selected="selected">${part.name }</option>
											  </c:if>
											  	
											  <c:if test="${part.id!=suitpart2 }">
											  	  <option value="${part.id }">${part.name }</option>
											  </c:if>
											  </c:forEach>
											</select>
										</td>
									
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">数量：
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${num2}" name="num2" type="text"
														class="tpl-form-input" id="num2">
												</div>
											</div>
										</td>
								</tr>
							</table>
							</div>
						</div>
						
						<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">
								</label>
								<div class="am-u-sm-9">
								<table>
									<tr>
										<td>
											<select id="myarticle3" name="myarticle3" data-am-selected="{searchBox: 1,maxHeight: 400}">
											  <c:if test="${suitpart3==-1 }">
											  	  <option value="-1" selected="selected"></option>
											  </c:if>
											  <c:if test="${suitpart3!=-1 }">
											  	  <option value="-1"></option>
											  </c:if>
											  <c:forEach items="${partlist}" var="part">
											  <c:if test="${part.id==suitpart3 }">
											  	  <option value="${part.id }" selected="selected">${part.name }</option>
											  </c:if>
											  	
											  <c:if test="${part.id!=suitpart3 }">
											  	  <option value="${part.id }">${part.name }</option>
											  </c:if>
											  </c:forEach>
											</select>
										</td>
									
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">数量：
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${num3}" name="num3" type="text"
														class="tpl-form-input" id="num3">
												</div>
											</div>
										</td>
								</tr>
							</table>
							</div>
						</div>
						
						<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">
								</label>
								<div class="am-u-sm-9">
								<table>
									<tr>
										<td>
											<select id="myarticle4" name="myarticle4" data-am-selected="{searchBox: 1,maxHeight: 400}">
											  <c:if test="${suitpart4==-1 }">
											  	  <option value="-1" selected="selected"></option>
											  </c:if>
											  <c:if test="${suitpart4!=-1 }">
											  	  <option value="-1"></option>
											  </c:if>
											  <c:forEach items="${partlist}" var="part">
											  <c:if test="${part.id==suitpart4 }">
											  	  <option value="${part.id }" selected="selected">${part.name }</option>
											  </c:if>
											  	
											  <c:if test="${part.id!=suitpart4 }">
											  	  <option value="${part.id }">${part.name }</option>
											  </c:if>
											  </c:forEach>
											</select>
										</td>
									
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">数量：
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${num4}" name="num4" type="text"
														class="tpl-form-input" id="num4">
												</div>
											</div>
										</td>
								</tr>
							</table>
							</div>
						</div>
						
						<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">
								</label>
								<div class="am-u-sm-9">
								<table>
									<tr>
										<td>
											<select id="myarticle5" name="myarticle5" data-am-selected="{searchBox: 1,maxHeight: 400}">
											  <c:if test="${suitpart5==-1 }">
											  	  <option value="-1" selected="selected"></option>
											  </c:if>
											  <c:if test="${suitpart5!=-1 }">
											  	  <option value="-1"></option>
											  </c:if>
											  <c:forEach items="${partlist}" var="part">
											  <c:if test="${part.id==suitpart5 }">
											  	  <option value="${part.id }" selected="selected">${part.name }</option>
											  </c:if>
											  	
											  <c:if test="${part.id!=suitpart5 }">
											  	  <option value="${part.id }">${part.name }</option>
											  </c:if>
											  </c:forEach>
											</select>
										</td>
									
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">数量：
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${num5}" name="num5" type="text"
														class="tpl-form-input" id="num5">
												</div>
											</div>
										</td>
								</tr>
							</table>
							</div>
						</div>
						
						<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">
								</label>
								<div class="am-u-sm-9">
								<table>
									<tr>
										<td>
											<select id="myarticle6" name="myarticle6" data-am-selected="{searchBox: 1,maxHeight: 400}">
											  <c:if test="${suitpart6==-1 }">
											  	  <option value="-1" selected="selected"></option>
											  </c:if>
											  <c:if test="${suitpart6!=-1 }">
											  	  <option value="-1"></option>
											  </c:if>
											  <c:forEach items="${partlist}" var="part">
											  <c:if test="${part.id==suitpart6 }">
											  	  <option value="${part.id }" selected="selected">${part.name }</option>
											  </c:if>
											  	
											  <c:if test="${part.id!=suitpart6 }">
											  	  <option value="${part.id }">${part.name }</option>
											  </c:if>
											  </c:forEach>
											</select>
										</td>
									
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">数量：
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${num6}" name="num6" type="text"
														class="tpl-form-input" id="num6">
												</div>
											</div>
										</td>
								</tr>
							</table>
							</div>
						</div>
						
						<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">
								</label>
								<div class="am-u-sm-9">
								<table>
									<tr>
										<td>
											<select id="myarticle7" name="myarticle7" data-am-selected="{searchBox: 1,maxHeight: 400}">
											  <c:if test="${suitpart7==-1 }">
											  	  <option value="-1" selected="selected"></option>
											  </c:if>
											  <c:if test="${suitpart7!=-1 }">
											  	  <option value="-1"></option>
											  </c:if>
											  <c:forEach items="${partlist}" var="part">
											  <c:if test="${part.id==suitpart7 }">
											  	  <option value="${part.id }" selected="selected">${part.name }</option>
											  </c:if>
											  	
											  <c:if test="${part.id!=suitpart7 }">
											  	  <option value="${part.id }">${part.name }</option>
											  </c:if>
											  </c:forEach>
											</select>
										</td>
									
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">数量：
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${num7}" name="num7" type="text"
														class="tpl-form-input" id="num7">
												</div>
											</div>
										</td>
								</tr>
							</table>
							</div>
							<div class="am-form-group">
						      <label for="doc-ta-1">套装说明:</label>
						      <textarea class="" id="explain" name="explain" rows="10">${explain}</textarea>
						    </div>
						</div>		

						<!-- 表单体  end-->
						<input type="text" id="usernametext" name="usernametext"  type="hidden"></input>
					</div>
				</div>
		</div>
	</form>
</body>
</html>
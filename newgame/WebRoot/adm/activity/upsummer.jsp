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
    web.webSocket.pojo.WgMain,
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
	
	String newaid=request.getParameter("newaid");
	String myarticle=request.getParameter("myarticle");
	String myarticle2=request.getParameter("myarticle2");
	String myarticle3=request.getParameter("myarticle3");
	String myarticle4=request.getParameter("myarticle4");
	
	String carnum=request.getParameter("carnum");
	
	String num1=request.getParameter("num");
	
	String radio1=request.getParameter("radio1");
	String datetimepicker1=request.getParameter("datetimepicker1");
	String datetimepicker2=request.getParameter("datetimepicker2");
	String explain=request.getParameter("explain");
	
	String huodongname=request.getParameter("suiname");
	
	if(newaid!=null && !newaid.equals("") &&
		myarticle!=null && !myarticle.equals("") &&
		myarticle2!=null && !myarticle2.equals("") &&
		myarticle3!=null && !myarticle3.equals("") &&
		myarticle4!=null && !myarticle4.equals("") &&
		carnum!=null && !carnum.equals("") &&
		num1!=null && !num1.equals("") &&
		datetimepicker1!=null && !datetimepicker1.equals("") &&
		datetimepicker2!=null && !datetimepicker2.equals("") &&
		explain!=null && !explain.equals("") &&
		radio1!=null && !radio1.equals("") &&
		huodongname!=null && !huodongname.equals("")){
		int[] newsuitpart=new int[4];
		newsuitpart[0]=Integer.valueOf(myarticle);
		newsuitpart[1]=Integer.valueOf(myarticle2);
		newsuitpart[2]=Integer.valueOf(myarticle3);
		newsuitpart[3]=Integer.valueOf(myarticle4);
		
		WgMain wgMain=activityManager.getWgMain();
		wgMain.setSummercard(newaid+":"+num1+":"+Util.Join(newsuitpart, ",")+":"+carnum+":"+explain);
		activityManager.upWgmain(wgMain,1);
		activityManager.setSummeraid(Integer.valueOf(newaid));
		//修改活动
		String[] huodong2new=activityManager.getHuodong().split(",");
		for(int i=0; i<huodong2new.length; i++){
			String [] huodong3new=huodong2new[i].split("@");
			if(huodong3new[0].equals("7")){
				long time1=Util.dateTimeStamp2(datetimepicker1, "yyyy-MM-dd");
				long time2=Util.dateTimeStamp2(datetimepicker2, "yyyy-MM-dd");
				huodong2new[i]="7@"+radio1+"@"+time1+"@"+time2+"@0";
				activityManager.upWgmainhuodong(Util.Join(huodong2new, ","));
			}
		}
		wgMain2.setSummername(huodongname);
		activityManager.updatewgmain2(wgMain2);
	}
	WgMain wgMain=activityManager.getWgMain();
	int aid=0;
	int num=0;
	int[] article=new int[4];
	int carnumnew=0;
	String explainnew="";
	if(wgMain!=null){
		String summercard=wgMain.getSummercard();
		if(summercard!=null){
			String[] summercardarray=summercard.split(":");
			if(summercardarray[0]==null){
				aid=0;
			}else{
				aid=Integer.valueOf(summercardarray[0]);
			}
			if(summercardarray[1]==null){
				num=0;
			}else{
				num=Integer.valueOf(summercardarray[1]);
			}
			if(summercardarray[2]==null){
				num=0;
			}else{
				String[] summercardarray2=summercardarray[2].split(",");
				for(int i=0; i<summercardarray2.length ;i++){
					article[i]=Integer.valueOf(summercardarray2[i]);
				}
			}
			if(summercardarray[3]!=null){
				carnumnew=Integer.valueOf(summercardarray[3]);
			}
			if(summercardarray[4]!=null){
			   explainnew=summercardarray[4];
			}
		}
	}
	request.setAttribute("explainnew", explainnew);
	request.setAttribute("huodongname", wgMain2.getSummername());
	request.setAttribute("aid", aid);
    request.setAttribute("num", num);
    request.setAttribute("article", article[0]);
    request.setAttribute("article2", article[1]);
    request.setAttribute("article3", article[2]);
    request.setAttribute("article4", article[3]);
    
    request.setAttribute("carnum", carnumnew);

    String[] huodong2=activityManager.getHuodong().split(",");
	for(int i=0; i<huodong2.length; i++){
		String [] huodong3=huodong2[i].split("@");
		if(Integer.valueOf(huodong3[0])==7){
			
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
			var num=document.getElementById("num").value;
			var explain=document.getElementById("explain").value;
			
			var carnum=document.getElementById("carnum").value;
			var suiname=document.getElementById("suiname").value;
			
			
			if(datetimepicker1.length<=0){
				layer.msg("开始时间不允许为空!");
				return false;
			}else if(datetimepicker2.length<=0){
				layer.msg("结束时间不允许为空!");
				return false;
			}else if(isNaN(num)){
				layer.msg("请输入道具数量!");
				return false;
			}else if(parseInt(num)<=0){
				layer.msg("道具数量需要大于0!");
				return false;
			}else if(isNaN(carnum)){
				layer.msg("请输入碎片数量!");
				return false;
			}else if(parseInt(carnum)<=0){
				layer.msg("碎片数量需要大于0!");
				return false;
			}else if(explain.length<=0){
				layer.msg("活动文案不允许未空!");
				return false;
			}else if(suiname.length<=0){
				layer.msg("活动名称不允许未空!");
				return false;
			}else{
				document.getElementById("send").submit();
			}
		}
</script>
</head>
<body class="theme-black">
	<form id="send" action="upsummer.jsp" method="post" data-am-validator
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
									<input value="${huodongname}" id="suiname" name="suiname" type="text"
										class="tpl-form-input"></input>
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
								<label for="user-phone" class="am-u-sm-3 am-form-label">需要道具:
								</label>
								<div class="am-u-sm-9">
									<select id="newaid" name="newaid" data-am-selected="{searchBox: 1,maxHeight: 400}">
									  <c:if test="${aid==-1 }">
										  <option value="-1" selected="selected"></option>
									  </c:if>
									  <c:if test="${aid!=-1 }">
									  	  <option value="-1"></option>
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
								<label for="user-name" class="am-u-sm-3 am-form-label">需要道具数量:
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${num}" id="num" name="num" type="text"
										class="tpl-form-input"placeholder=""> <small></small>
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">碎片
								</label>
								<div class="am-u-sm-9">
								<table>
									<tr>
										<td>
											<select id="myarticle" name="myarticle" data-am-selected="{searchBox: 1,maxHeight: 400}">
											  <c:if test="${article==-1 }">
											  	  <option value="-1" selected="selected"></option>
											  </c:if>
											  <c:if test="${article!=-1 }">
											  	  <option value="-1"></option>
											  </c:if>
											  <c:forEach items="${articlelist}" var="list">
											  <c:if test="${list.articleType==3 && list.subType==1}">
											  	  <c:if test="${list.id==article }">
											  	  	  <option value="${list.id }" selected="selected">${list.name }</option>
												  </c:if>
												  	
												  <c:if test="${list.id!=article }">
												  	  <option value="${list.id }">${list.name }</option>
												  </c:if>
											  
											  </c:if>
											  
											  
											  </c:forEach>
											</select>
										</td>
								</tr>
							</table>
							</div>
						</div>
						
						<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">碎片2
								</label>
								<div class="am-u-sm-9">
								<table>
									<tr>
										<td>
											<select id="myarticle2" name="myarticle2" data-am-selected="{searchBox: 1,maxHeight: 400}">
											  <c:if test="${article2==-1 }">
											  	  <option value="-1" selected="selected"></option>
											  </c:if>
											  <c:if test="${article2!=-1 }">
											  	  <option value="-1"></option>
											  </c:if>
											  <c:forEach items="${articlelist}" var="list">
												  <c:if test="${list.articleType==3 && list.subType==1}">
												  	  <c:if test="${list.id==article2 }">
												  	  		<option value="${list.id }" selected="selected">${list.name }</option>
													  </c:if>
													  	
													  <c:if test="${list.id!=article2 }">
													  	  <option value="${list.id }">${list.name }</option>
													  </c:if>
												  
												  </c:if>
											  
											  </c:forEach>
											</select>
										</td>
								</tr>
							</table>
							</div>
						</div>
						
						<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">碎片3
								</label>
								<div class="am-u-sm-9">
								<table>
									<tr>
										<td>
											<select id="myarticle3" name="myarticle3" data-am-selected="{searchBox: 1,maxHeight: 400}">
											  <c:if test="${article3==-1 }">
											  	  <option value="-1" selected="selected"></option>
											  </c:if>
											  <c:if test="${article3!=-1 }">
											  	  <option value="-1"></option>
											  </c:if>
											  <c:forEach items="${articlelist}" var="list">
											  	  <c:if test="${list.articleType==3 && list.subType==1}">
												  	  <c:if test="${list.id==article3 }">
												  	  		<option value="${list.id }" selected="selected">${list.name }</option>
													  </c:if>
													  	
													  <c:if test="${list.id!=article3 }">
													  	  <option value="${list.id }">${list.name }</option>
													  </c:if>
												  
												  </c:if>
											  </c:forEach>
											</select>
										</td>
								</tr>
							</table>
							</div>
						</div>
						
						<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">碎片4
								</label>
								<div class="am-u-sm-9">
								<table>
									<tr>
										<td>
											<select id="myarticle4" name="myarticle4" data-am-selected="{searchBox: 1,maxHeight: 400}">
											  <c:if test="${article4==-1 }">
											  	  <option value="-1" selected="selected"></option>
											  </c:if>
											  <c:if test="${article4!=-1 }">
											  	  <option value="-1"></option>
											  </c:if>
											  <c:forEach items="${articlelist}" var="list">
											  	 <c:if test="${list.articleType==3 && list.subType==1}">
												  	  <c:if test="${list.id==article4 }">
												  	  		<option value="${list.id }" selected="selected">${list.name }</option>
													  </c:if>
													  	
													  <c:if test="${list.id!=article4 }">
													  	  <option value="${list.id }">${list.name }</option>
													  </c:if>
												  
												  </c:if>
											  </c:forEach>
											</select>
										</td>
								</tr>
							</table>
							</div>
							
						<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">碎片数量：
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${carnum}" id="carnum" name="carnum" type="text"
										class="tpl-form-input"placeholder=""> <small></small>
								</div>
						</div>
						
						<div class="am-form-group">
					      <label for="doc-ta-1">活动文案:</label>
					      <textarea class="" id="explain" name="explain" rows="10">${explainnew}</textarea>
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
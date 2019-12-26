<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="web.webSocket.player.PlayerManager,
    java.util.*,
    web.webSocket.mail.MailManager,
    web.webSocket.pojo.WgPlayerserver,
    web.webSocket.article.Knapsack,
    web.webSocket.util.BillingCenter,
    web.webSocket.message.Messagepush,
    web.webSocket.article.Article,
    web.webSocket.article.ArticleManager,
    web.webSocket.article.ArticleClient,
    web.webSocket.pojo.WgKnapsack,
    net.sf.json.JSONArray,
	net.sf.json.JSONObject,
    web.webSocket.util.GameServerManager,
    web.webSocket.util.SendgetManager,
    web.webSocket.article.logic.impl.ArticleLogicImpl"%>
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
	//送福利
	Collection<Article> collection=ArticleManager.getInstance().getArticlemap().values();
	List<Article> list=new ArrayList<Article>();
	list.addAll(collection);
	request.setAttribute("list", list);
	
	//String wglist=request.getParameter("usernametext");
	/* List<Messagepush> listtwo=(List<Messagepush>)session.getAttribute("listtwo");
 	int num=0;
 	//检查账号是否有该权限
 	if(listtwo!=null && listtwo.size()>0 ){
	 	for(Messagepush messagepush:listtwo){
			if(messagepush.getType()==504){
				num++;
				break;
			}
		}
 	}
	if(num<1){
		response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
		return ;
	} */
	//管理员uid
	String uid=request.getParameter("uid");
	
	String mytext=request.getParameter("mytext");
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	if(title!=null && content!=null){
		if(mytext!=null && !mytext.equals("")){
			if(mytext.substring(mytext.length()-1,mytext.length()).equals(",")){
				mytext=mytext.substring(0, mytext.length()-1);
			}
		}
		
		//System.out.println("mytext="+mytext);
		//String[] aidnumstr=mytext.split(",");
		//Map<Integer,Integer> mapone=new HashMap<Integer,Integer>();
		//for(int i=0;i<aidnumstr.length;i++){
		//	String[] aidnumstr2=aidnumstr[i].split(":");
		//	mapone.put(Integer.valueOf(aidnumstr2[0]), Integer.valueOf(aidnumstr2[1]));
		//} 
		
		PlayerManager playerManager=PlayerManager.getInstance();
		Collection<WgPlayerserver> wgplaylist=playerManager.getIdplayermap().values();
		List<WgPlayerserver> wglist=new ArrayList<WgPlayerserver>();
		wglist.addAll(wgplaylist);
	
	 	for(WgPlayerserver wg:wglist){
			if(wg!=null && wg.getServeruid()!=-1 && wg.getServeruid()!=-2){
				try {
					MailManager.getInstance().fulisendmail("系统邮件", title, content, mytext, (long)-1, wg.getServeruid() , 1);
				} catch (Exception e) {
				}	
			}
		}
		//response.sendRedirect("error.jsp?info=2");
		//out.prinln("success");
		
		GameServerManager servers=GameServerManager.getInstance();
		String weburl=servers.getWeburl();
		String url=weburl+"/GameApi/maintenancelog?uid="+uid+"&serverid="+servers.getServerid()+"&action=success";
		String getreturn=SendgetManager.SendGET(url);
		//JSONObject json = JSONObject.fromObject(getreturn);  
		//String status=json.getString("status");
			
		return;
		//增加日志
		//for(Integer in:mapone.keySet()){
		//	playerManager.giveLog(Integer.valueOf(userid), -1,BillingCenter.articletype,mapone.get(in),String.valueOf(in));
		//}
		//response.sendRedirect("error.jsp?info=2");
		//return ;
	}
	
 %>
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
    <script type="text/javascript">
		layui.define(['form','layer','laypage','laydate'], function(exports){
		var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;
			
		});
		function add(){
			var myarticle=document.getElementById("myarticle").value;
			arr=myarticle.split(":");
			var mynum=document.getElementById("mynum").value;
			if(mynum.length<=0){
				layer.msg("数量不允许为空！");
				return false;
			}else if(isNaN(mynum)){
				layer.msg("数量只能输入数字！");
				return false;
			}
			var mytext=document.getElementById("mytext").value;
			var mytext2=document.getElementById("mytext2").value;
			document.getElementById("mytext2").value=arr[1]+":"+mynum+","+mytext2; 
			document.getElementById("mytext").value=arr[0]+":"+mynum+","+mytext; 
		}
		
		function del(){
			document.getElementById("mytext").value="";
			document.getElementById("mytext2").value="";
		}
		
		function addusername(){
			var username=document.getElementById("username").value;
			var myusername=document.getElementById("myusername").value;
			document.getElementById("myusername").value=username+","+myusername; 
			document.getElementById("username").value=""; 
		}
		
		function delusername(){
			document.getElementById("myusername").value="";
			
		}
		
		function send(){
			//var username=document.getElementById("doc-ta-1").value;
			var mytext=document.getElementById("mytext").value;
			var title=document.getElementById("title").value;
			var content=document.getElementById("content").value;
			var mynum=document.getElementById("mynum").value;
			/* if(username<=0){
				layer.msg("玩家账号不允许为空！");
				return false;
			}else  */if(title.length<=0){
				layer.msg("标题不允许为空！");
				return false;
			}else if(content.length<=0){
				layer.msg("内容不允许为空！");
				return false;
			}
			/*else if(mynum.length<=0){
				layer.msg("数量不允许为空！");
				return false;
			}
			else if(isNaN(mynum)){
				layer.msg("数量只能输入数字！");
				return false;
			}
			else if(mytext.length<=0){
				layer.msg("道具:数量不允许为空！");
				return false;
			}*/
			else{
				//var reg = new RegExp("\n", "g");
  				//var str = username.replace(reg, ",");
		        //document.getElementById("usernametext").value=str;
			   document.getElementById("send").submit();
			}
		}
</script>
</head>
<body class="theme-black">
	<form id="send" action="compensation.jsp" method="post" data-am-validator
							class="am-form tpl-form-line-form">
	<!-- 内容区域 -->
		<div class="theme-black">
				<div class="am-btn-group am-btn-group-xs" style="margin-top: 10px">
					<button id="saveBtn" type="button" onclick="send();"
						class="am-btn am-btn-default am-btn-secondary">
						<span class="am-icon-save"></span> 发送邮件
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

 							<!-- <div class="am-form-group">
						      <label for="doc-ta-1">玩家账号:</label>
						      <textarea class="" rows="5" id="doc-ta-1"></textarea>
						       
						    </div> -->
							
<!-- 							<div class="am-form-group">
						      <label for="doc-ta-1">玩家账号</label>
						      <input type="text" id="myusername" name="myusername"  readonly="readonly"></input>
						    </div>
						    
						    <div class="am-form-group">
						      <label for="doc-ta-1">请输入玩家账号</label>
						      <input type="text" id="username" name="username" ></input>
						    </div> -->
						    
<!-- 							<div class="am-form-group">
							    <div class="am-u-sm-10 am-u-sm-offset-2">
							      <button type="button" onclick="addusername();" class="am-btn am-btn-primary am-btn-block">点击添加玩家账号</button>
							    </div>
							</div>
							
							<div class="am-form-group">
							    <div class="am-u-sm-10 am-u-sm-offset-2">
							      <button type="button" onclick="delusername();" class="am-btn am-btn-primary am-btn-block">点击清空玩家账号</button>
							    </div>
							</div> -->
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">标题:
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="" name="title" id="title" type="text"
										class="tpl-form-input" placeholder="请填写标题"> <small>请填写标题</small>
								</div>
							</div>

							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">内容:
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="" name="content" id="content" type="text"
										class="tpl-form-input" id="email" placeholder="请输入内容"> <small>请填写内容</small>
								</div>
							</div>
							
<%-- 						    <div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">物品列表
								</label>
								<div class="am-u-sm-9">
									<select id="myarticle" name="myarticle"
										data-am-selected="{searchBox: 1}" style="display: none;">
											<c:forEach items="${list }" var="article">
												<option value="${article.id }">${article.name }</option>
											</c:forEach>
									</select>
								</div>
							</div> --%>
							<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">物品列表:
								</label>
								<div class="am-u-sm-9">
									<select id="myarticle" name="myarticle" data-am-selected="{searchBox: 1,maxHeight: 400}">
									  <c:forEach items="${list }" var="article">
												<option value="${article.id }:${article.name }">${article.name }</option>
									  </c:forEach>
									</select>
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">数量:
								</label>
								<div class="am-u-sm-9">
									<!-- <select id="mynum" name="mynum"
										data-am-selected="{searchBox: 1}" style="display: none;">
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
									</select> -->
									<input type="text" id="mynum" name="mynum" value="1"></input>
								</div>
							</div>
							
							<div class="am-form-group">
						      <input type="text" id="mytext" name="mytext"  style="display:none"></input>
						    </div>
						    
						    <div class="am-form-group">
						      <label for="doc-ta-1">道具:数量</label>
						      <input type="text" id="mytext2" name="mytext2"  readonly="readonly"></input>
						    </div>
						    
							<div class="am-form-group">
							    <div class="am-u-sm-10 am-u-sm-offset-2">
							      <button type="button" onclick="return add();" class="am-btn am-btn-primary am-btn-block">点击添加道具与数量</button>
							    </div>
							</div>
							
							<div class="am-form-group">
							    <div class="am-u-sm-10 am-u-sm-offset-2">
							      <button type="button" onclick="del();" class="am-btn am-btn-primary am-btn-block">点击清空道具与数量</button>
							    </div>
							</div>
  							
						    
<%-- 							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">姓名
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${user.realname}" name="realname" type="text"
										class="tpl-form-input" id="realname" placeholder="请输入姓名"> <small>请填写姓名</small>
								</div>
							</div> --%>
						

						<!-- 表单体  end-->
						<input type="text" id="usernametext" name="usernametext"  type="hidden"></input>
					</div>
				</div>
		</div>
	</form>
</body>
</html>
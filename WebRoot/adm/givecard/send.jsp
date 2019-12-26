<%@page import="com.sun.org.apache.xalan.internal.xsltc.compiler.sym"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="web.webSocket.card.CardManager,
		    web.webSocket.player.PlayerManager,
		    java.util.*,
		    web.webSocket.util.BillingCenter,
		    web.webSocket.mail.MailManager,
		    web.webSocket.message.Messagepush,
		    web.webSocket.card.Card,
		    web.webSocket.article.ArticleManager,
		    web.webSocket.pojo.WgPlayerserver"%>
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
<script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/echarts.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/moment-with-locales.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/amazeui.datetimepicker-se.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/moment.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/amazeui-pagination.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/common.js"></script> 
<%
	Collection<Card> collection=CardManager.getInstance().getCardmap().values();
	List<Card> list=new ArrayList<Card>();
	list.addAll(collection);
	request.setAttribute("list", list);
	
	String wglist=request.getParameter("usernametext");
	List<Messagepush> listtwo=(List<Messagepush>)session.getAttribute("listtwo");
 	int num=0;
 	//检查账号是否有该权限
 	if(listtwo!=null && listtwo.size()>0 ){
		for(Messagepush messagepush:listtwo){
			if(messagepush.getType()==503){
				num++;
				break;
			}
		}
	}
	if(num<1){
		response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
		return ;
	}

	String mytext=request.getParameter("mytext");
	if(wglist!=null && mytext!=null){
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		Map<Integer,Integer> map=new HashMap<Integer,Integer>();
		if(mytext.substring(mytext.length()-1,mytext.length()).equals(",")){
			mytext=mytext.substring(0, mytext.length()-1);
			String[] mytextstr=mytext.split(",");
			for(int i=0;i<mytextstr.length;i++){
				String[] cardidstr=mytextstr[i].split(":");
				int id=Integer.valueOf(cardidstr[0]);
				if(map.get(id)==null){
				 	map.put(id, 1);
				}
			}
		}
		PlayerManager playerManager=PlayerManager.getInstance();
		Long getid=playerManager.getplayerid(wglist);
 		if(getid==null){
 			response.sendRedirect("error.jsp?info=0");
 			return ;
 		}
		WgPlayerserver wgPlayerserver = playerManager.getplayer(getid);
		String userid=(String)session.getAttribute("userid");
		boolean result=false;
		String nocardid="";
		//判断玩家是否拥有卡片
		ArticleManager articleManager=ArticleManager.getInstance();
		String aidstr="";
		for(Integer in:map.keySet()){
			result=wgPlayerserver.getCard().hasinid(in);
			if ( in== 51003 || in== 51004 || in== 51005) {
				result=true;
				
			}
			if(result==false){
				wgPlayerserver.getCard().addcard(in, 1, 0,0);
				int aid=articleManager.getcard(in);
				aidstr+=aid+",";
			}else{
				nocardid+=in+",";
			}	
		}
		if(aidstr!=null && !aidstr.equals("")){
			aidstr=aidstr.substring(0, aidstr.length()-1);
			//增加日志
			playerManager.giveLog(Integer.valueOf(userid), wgPlayerserver.getUid(),BillingCenter.articletype,1,aidstr); 
		}
		response.sendRedirect("error.jsp?info="+nocardid);
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
			var username=document.getElementById("doc-ta-1").value;
			var mytext=document.getElementById("mytext").value;
			var mynum=document.getElementById("mynum").value;
			if(username<=0){
				layer.msg("玩家账号不允许为空！");
				return false;
			}else if(mytext.length<=0){
				layer.msg("卡片:数量不允许为空！");
				return false;
			}else{
				var reg = new RegExp("\n", "g");
  				var	str = username.replace(reg, ",");
		       document.getElementById("usernametext").value=str; 
			   document.getElementById("send").submit();
			}
		}
</script>
</head>
<body class="theme-black">
	<form id="send" action="send.jsp" method="post" data-am-validator
							class="am-form tpl-form-line-form">
	<!-- 内容区域 -->
		<div class="theme-black">
				<div class="am-btn-group am-btn-group-xs" style="margin-top: 10px">
					<button id="saveBtn" type="button" onclick="send();"
						class="am-btn am-btn-default am-btn-secondary">
						<span class="am-icon-save"></span> 发送
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
								<label for="user-name" class="am-u-sm-3 am-form-label">玩家账号:
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="" name="doc-ta-1" id="doc-ta-1" type="text"
										class="tpl-form-input" placeholder="请填写玩家账号"> <small>请填写玩家账号</small>
								</div>
							</div>

							<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">卡片列表:
								</label>
								<div class="am-u-sm-9">
									<select id="myarticle" name="myarticle" data-am-selected="{searchBox: 1,maxHeight: 400}">
									  <c:forEach items="${list }" var="card">
												<option value="${card.id }:${card.name }">${card.name }</option>
									  </c:forEach>
									</select>
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">数量:
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input name="mynum" id="mynum" value="1" readonly="readonly" type="text"
										class="tpl-form-input"> <small>注意:默认一个，不可修改</small>
								</div>
							</div>
							
							<div class="am-form-group">
						      <label for="doc-ta-1">卡片:数量</label>
						      <input type="text" id="mytext2" name="mytext2"  readonly="readonly"></input>
						    </div>
						    
							
						    <input type="text" id="mytext" name="mytext"  style="display:none"></input>
						   
						    
							<div class="am-form-group">
							    <div class="am-u-sm-10 am-u-sm-offset-2">
							      <button type="button" onclick="add();" class="am-btn am-btn-primary am-btn-block">点击添加卡片与数量</button>
							    </div>
							</div>
							
							<div class="am-form-group">
							    <div class="am-u-sm-10 am-u-sm-offset-2">
							      <button type="button" onclick="del();" class="am-btn am-btn-primary am-btn-block">点击清空卡片与数量</button>
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
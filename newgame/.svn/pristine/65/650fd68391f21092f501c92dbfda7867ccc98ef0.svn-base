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
    web.webSocket.player.Chat,
    web.webSocket.message.Messagepush,
    web.webSocket.message.MessageManager,
    web.webSocket.handler.SystemWebSocketHandler,
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
	
	
	List<Messagepush> listtwo=(List<Messagepush>)session.getAttribute("listtwo");
 	int num=0;
 	//检查账号是否有该权限
 	if(listtwo!=null && listtwo.size()>0 ){
	 	for(Messagepush messagepush:listtwo){
			if(messagepush.getType()==1101){
				num++;
				break;
			}
		}
 	}
	if(num<1){
		response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
		return ;
	}

	String content=request.getParameter("content");
	/* String usernametext=request.getParameter("usernametext");
	PlayerManager playerManager=PlayerManager.getInstance();
	
	
	
	
	
	if(content!=null && !content.equals("") && usernametext!=null && !usernametext.equals("")){
		Long getiddd=playerManager.getplayerid(usernametext);
		WgPlayerserver player = playerManager.getplayer(getiddd);
 		if(player==null){
 			response.sendRedirect("error.jsp?info=1");
 			return ;
 		}
		//内容
		if(content==null || content.equals("")){
			response.sendRedirect("error.jsp?info=2");
			return ;
		}
		
		int type=0;
		//群聊
		Chat chat=new Chat();
		chat.setFromid(player.getServeruid());
		chat.setFromname(player.getPlayername());
		chat.setContent(content);
		chat.setType(type);
		chat.setTime(System.currentTimeMillis());
		chat.setFromavatar(player.getAvatar());
		//chat.setContenttype(contenttype);
		chat.setVipLv(player.getViplevel());
		chat.setToname("");
		chat.setHref("");
		chat.setCardLid(0l);

		playerManager.addchat(chat);
		try {
			SystemWebSocketHandler.getInstance().broadcast(chat,10022,"");
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		response.sendRedirect("error.jsp?info=3");
		return ; */
		
		if(content!=null && !content.equals("")){
			List<Messagepush> listpush=new ArrayList<Messagepush>();
			content= "#white"+content+"#end";
			String url="";
			Messagepush messagepush=new Messagepush(content, url, 0);
			listpush.add(messagepush);
			
			MessageManager messageManager=MessageManager.getInstance();
			
			if(listpush.size()>0){
				try {
					//messageManager.broadcast(listpush,110001,"");
					//SystemWebSocketHandler systemWebSocketHandler=SystemWebSocketHandler.getInstance();
					//systemWebSocketHandler.broadcast(listpush, 110001, "");
					messageManager.addbroadcast(0, 110001, listpush);
				} catch (Exception e) {
					e.printStackTrace();
					// TODO: handle exception
				}
			}
			response.sendRedirect("error.jsp?info=3");
			return ; 
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
			var content=document.getElementById("content").value;
			/* if(username<=0){
				layer.msg("玩家账号不允许为空！");
				return false;
			}else */ if(content.length<=0){
				layer.msg("内容不允许为空！");
				return false;
			}else{
				//var reg = new RegExp("\n", "g");
  				//var	str = username.replace(reg, ",");
		       //document.getElementById("usernametext").value=str; 
			   document.getElementById("send").submit();
			}
		}
</script>
</head>
<body class="theme-black">
	<form id="send" action="publicchat.jsp" method="post" data-am-validator
							class="am-form tpl-form-line-form">
	<!-- 内容区域 -->
		<div class="theme-black">
				<div class="am-btn-group am-btn-group-xs" style="margin-top: 10px">
					<button id="saveBtn" type="button" onclick="send();"
						class="am-btn am-btn-default am-btn-secondary">
						<span class="am-icon-save"></span> 发送全服广播
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
						      <label for="doc-ta-1">发送人的熊猫id:</label>
						      <textarea class="" rows="5" id="doc-ta-1"></textarea>
						       
						    </div> -->

							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">内容:
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="" name="content" id="content" type="text"
										class="tpl-form-input" id="email" placeholder="请输入内容"> <small>请填写内容</small>
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
						<!-- <input type="text" id="usernametext" name="usernametext"  type="hidden"></input> -->
					</div>
				</div>
		</div>
	</form>
</body>
</html>
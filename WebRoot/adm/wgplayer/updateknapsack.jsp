<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"    
    import="web.webSocket.player.PlayerManager,
    java.util.*,
    java.util.regex.Pattern,
    java.util.regex.Matcher,
    web.webSocket.util.BillingCenter,
    web.webSocket.pojo.WgPlayerserverClient,
    web.webSocket.pojo.WgPlayerserver,
    web.webSocket.article.Knapsack,
    web.webSocket.article.ArticleManager,
    web.webSocket.pojo.WgKnapsack,
    web.webSocket.article.logic.impl.ArticleLogicImpl"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jstl/core_rt" %>
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

<script type="text/javascript" src="<%=path %>/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/echarts.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/moment-with-locales.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/amazeui.datetimepicker-se.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/moment.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/amazeui-pagination.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/common.js"></script> 
<%
			String serveruid=request.getParameter("serveruid");
			String num=request.getParameter("num");
			long seruid=Long.parseLong(serveruid);
			String kid=request.getParameter("kid");
			long userkid=Long.parseLong(kid);
			PlayerManager playerManager=PlayerManager.getInstance();
			WgPlayerserver wg=playerManager.getplayer(seruid);
			Knapsack knapsack=wg.getKnapsack();
			WgKnapsack wgKnapsack=knapsack.getWgKnapsackmap().get(userkid);
			request.setAttribute("wgkna", wgKnapsack);
			
			String userid=(String)session.getAttribute("userid");
			
			if(num!=null){
				Pattern pattern = Pattern.compile("[0-9]*"); 
			    Matcher isNum = pattern.matcher(num);
			    if(isNum.matches() ){
			    	int number=Integer.valueOf(num);
					if(number>=0){
						//判断增减
						int num2=wgKnapsack.getNum();
						int aid=wgKnapsack.getAid();
						if(num2<number){
							knapsack.addknapsacknum(aid, number-num2);
							playerManager.giveLog(Integer.valueOf(userid), wg.getUid(),BillingCenter.articleaddtype,number-num2,String.valueOf(aid));
						}else if(num2>number){
							knapsack.delknapsacknum(userkid,num2-number);
							playerManager.giveLog(Integer.valueOf(userid), wg.getUid(),BillingCenter.articleaddtype,number-num2,String.valueOf(aid));	
						}
					}
			    }
			}
 %>
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
    <script type="text/javascript">
		layui.define(['form','layer','laypage','laydate'], function(exports){
		var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;
		});
	 
</script>
</head>
<body class="theme-black">
<form action="updateknapsack.jsp" method="post" id="hp_form" data-am-validator
							class="am-form tpl-form-line-form">
	<!-- 内容区域 -->
		<div class="theme-black">
				<div class="am-btn-group am-btn-group-xs" style="margin-top: 10px">
					<button id="saveBtn" type="submit"
						class="am-btn am-btn-default am-btn-secondary">
						<span class="am-icon-save"></span> 保存
					</button>
					<%-- <button onclick="window.history.go(-1)" type="button"
						class="am-btn am-btn-default am-btn-warning">
						<span class="am-icon-reply"></span> 返回
					</button> --%>
				</div>
			</div>

			<div class="row">

				<div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
					<div class="widget am-cf">

						
							
<%-- 							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">玩家昵称
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									 <input value="${wg.playername}" id="rolename" name="rolename" type="text"
										class="tpl-form-input">
								</div>
							</div> --%>
 							
 						  	<div class="am-u-sm-12">
 						  		<!-- <table>
 						  			<tr>
 						  			<td>图片</td>
		                            <td>名称</td>
		                            <td>数量</td>
 						  			</tr> -->
	                                
		                                 <%-- <label class="am-checkbox am-secondary am-u-sm-3">
		                                  		<input type="text" name="" value="${wgkna.name}:${wgkna.num}">
		                                 </label> --%>
		                               <!--   <tr> -->
		                                <%--  <td class="am-text-middle" style="display: none">${wgkna.kid}</td> --%>
		                                <%--  <td><input type="text" value="${wgkna.name}" /></td> --%>
		                                 数量：<input type="text" name="num" value="${wgkna.num}" />
		                                 <!-- </tr> -->
	                                
                                 <!-- </table> -->
 							</div>
 
							<!-- 隐藏域-->
 									 <input id="serveruid" name="serveruid" type="hidden"
										value="${wgkna.serveruid}" />
									<input id="kid" name="kid" type="hidden"
										value="${wgkna.kid}" />
						
						<!-- 表单体  end-->
					</div>
				</div>
		</div>
</form>
</body>
</html>
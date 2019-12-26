<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="web.webSocket.login.LoginManager,
    	    web.webSocket.pojo.WgAdmin,
    	    java.util.*,
    	    web.webSocket.util.MD5Util,
    	    web.webSocket.pojo.WgAdminRole"
    %>
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

	String username=request.getParameter("username");
	String password=request.getParameter("password");
	String newpassword=request.getParameter("password2");
		if(password!=null && newpassword!=null){
				List<WgAdmin> list=LoginManager.getInstance().selectone(username,"11");
				if(list==null || list.size()==0){
					response.sendRedirect("uppassword.jsp");;
					return;
				}
				WgAdmin wgAdmin=list.get(0);
				String oldpassword=MD5Util.md5Jdk(password);
					   newpassword=MD5Util.md5Jdk(newpassword);
				if(wgAdmin.getEncrypt()!=null){
					oldpassword=MD5Util.md5Jdk(oldpassword+wgAdmin.getEncrypt());
					newpassword=MD5Util.md5Jdk(newpassword+wgAdmin.getEncrypt());
				}else{
					oldpassword=MD5Util.md5Jdk(oldpassword);
					newpassword=MD5Util.md5Jdk(newpassword);
				}
				if(oldpassword.equals(wgAdmin.getPassword())){
					wgAdmin.setPassword(newpassword);
					LoginManager.getInstance().upWgAdmin(wgAdmin);
					session.removeAttribute("username");
					session.removeAttribute("password");
					session.removeAttribute("realname");
					//response.sendRedirect("../index.jsp");
					response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");  
				}
				
		}
 %>
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
    <script type="text/javascript">
 		layui.define(['form','layer','laypage','laydate'], function(exports){
		var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;
			
		});
		
		function send(){
			var password=document.getElementById("password").value;
			var oldpassward=document.getElementById("oldpassward").value;
			var password2=document.getElementById("password2").value;
			var password3=document.getElementById("password3").value;
			if(password<=0){
				layer.msg("原密码不允许为空！");
				return false;
			}else if(oldpassward!=password){
				layer.msg("原密码不对！");
				return false;
			}else if(password2<=0){
				layer.msg("新密码不允许为空！");
				return false;
			}else if(password3<=0){
				layer.msg("确认密码不允许为空！");
				return false;
			}else if(password2!=password3){
				layer.msg("新密码与确认密码不一致！");
				return false;
			}else{
				//var reg = new RegExp("\n", "g");
  				//var	str = username.replace(reg, ",");
			   document.getElementById("hp_form").submit();
			}
		}
</script>
</head>
<body class="theme-black">
	<form id="hp_form" action="uppassword.jsp" method="post" data-am-validator
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
								<label for="user-name" class="am-u-sm-3 am-form-label">原密码:
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="" id="password" name="password" type="password"
										class="tpl-form-input">
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">新密码:
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="" id="password2" name="password2" type="password"
										class="tpl-form-input">
								</div>
							</div>

							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">确认密码:
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="" id="password3" name="password3" type="password"
										class="tpl-form-input">
								</div>
							</div>
									<!-- 隐藏域-->
 									<input id="username" name="username" type="hidden"
										value="${username}" /> 
									<input id="oldpassward" name="oldpassward" type="hidden"
										value="${passward}" /> 
						
						<!-- 表单体  end-->
					</div>
				</div>
		</div>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="web.webSocket.login.LoginManager,
    	    web.webSocket.pojo.WgAdmin,
    	    java.util.*,
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
	//查询一个
	String username=request.getParameter("username");
	WgAdmin wgAdmin=null;
	if(username!=null && !username.equals("")){
		List<WgAdmin> list=LoginManager.getInstance().selectone(username,"11");
		wgAdmin=list.get(0);
	}
	request.setAttribute("user", wgAdmin);
	List<WgAdminRole> wgrolelist=LoginManager.getInstance().selectAllWgAdminRole();
	request.setAttribute("data", wgrolelist);
	
	
	//编辑
	String roleid=request.getParameter("roleid");
	String phone=request.getParameter("phone");
	String email=request.getParameter("email");
	String realname=request.getParameter("realname");
	String userid=request.getParameter("userid");
		if(username!=null && !username.equals("") && roleid!=null && !roleid.equals("")){
				wgAdmin=new WgAdmin();
				wgAdmin.setUsername(username);
				wgAdmin.setRoleid(Short.valueOf(roleid));
				wgAdmin.setEmail(email);
				wgAdmin.setPhone(phone);
				wgAdmin.setRealname(realname);
				wgAdmin.setUserid(Integer.valueOf(userid));
				LoginManager.getInstance().upWgAdmin(wgAdmin);
				request.setAttribute("user", wgAdmin);
		}
 %>
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
    <script type="text/javascript">
 		layui.define(['form','layer','laypage','laydate'], function(exports){
		var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;
			
		});
		
		function send(){
			var username=document.getElementById("username").value;
			if(username<=0){
				layer.msg("账号不允许为空！");
				return false;
			}else{
				var reg = new RegExp("\n", "g");
  				var	str = username.replace(reg, ",");
			   document.getElementById("hp_form").submit();
			}
		}
</script>
</head>
<body class="theme-black">
	<form id="hp_form" action="upuser.jsp?type=1" method="post" data-am-validator
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
								<label for="user-name" class="am-u-sm-3 am-form-label">用户名:
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${user.username}" id="username" name="username" type="text" readonly="readonly"
										class="tpl-form-input">
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">用户等级:
								</label>
								<div class="am-u-sm-9">
									<select id="roleid" name="roleid"
										data-am-selected="{searchBox: 1}" style="display: none;">
											<s:forEach var="list" items="${data}">
												<s:if test="${user.roleid==list.roleid}">
													<option value="${user.roleid}" selected="selected">${list.rolename}</option>
												</s:if>
												<s:if test="${user.roleid!=list.roleid  }">
													<option value="${list.roleid}">${list.rolename}</option>
												</s:if> 
											</s:forEach>
											
									</select>

								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">联系电话:
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${user.phone}" name="phone" id="phone" type="text"
										class="tpl-form-input" placeholder="请输入联系电话"> <small>请填写联系电话10-20字左右。</small>
								</div>
							</div>

							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">email:
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${user.email}" name="email" type="text"
										class="tpl-form-input" id="email" placeholder="请输入email"> <small>请填写email</small>
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">姓名:
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${user.realname}" name="realname" type="text"
										class="tpl-form-input" id="realname" placeholder="请输入姓名"> <small>请填写姓名</small>
								</div>
							</div>
						
									<!-- 隐藏域-->
 									<input id="userid" name="userid" type="hidden"
										value="${user.userid}" /> 
						
						<!-- 表单体  end-->
					</div>
				</div>
		</div>
	</form>
</body>
</html>
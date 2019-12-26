<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<script type="text/javascript" src="<%=path %>/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/echarts.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/moment-with-locales.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/amazeui.datetimepicker-se.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/moment.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/amazeui-pagination.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/common.js"></script> 
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
    <script type="text/javascript">
	layui.config({
		  base: '<%=path %>/admin/usertype/' //你存放新模块的目录，注意，不是layui的模块目录
		}).use('addusertype'); //加载入口
		
/* 		var jsonStr = ${user.wgAdminRole.qkbyrolecheck};
		alert(JSON.parse(jsonStr)); */
</script>
</head>
<body class="theme-black">

	<!-- 内容区域 -->
		<div class="theme-black">
				<div class="am-btn-group am-btn-group-xs" style="margin-top: 10px">
					<button id="saveBtn" type="button"
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

						<form id="hp_form" data-am-validator
							class="am-form tpl-form-line-form">
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">类型昵称
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${usertype.rolename}" id="rolename" name="rolename" type="text"
										class="tpl-form-input">
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">类型功能
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${usertype.description}" id="description" name="description" type="text"
										class="tpl-form-input">
								</div>
							</div>
							
							 <div class="am-u-sm-12">
                                  <c:forEach var="list" items="${data}">
                                  	<c:set var="number" value="0" />
	                                    <label class="am-checkbox am-secondary am-u-sm-3">
	                                    	<c:forEach var="list2" items="${liststring}">
		                                    	<c:if test="${list2==list.type }">
		                                    	<c:set var="number" value="1" />
		                                    	</c:if>
	                                    	</c:forEach>
	                                    	
	                                    	<c:if test="${number>0 }">
		                                    		<input type="checkbox" checked="checked" name="checkbox" value="${list.type}" data-am-ucheck>&nbsp&nbsp${list.title }
		                                    </c:if>
		                                    <c:if test="${number==0 }">
		                                    		<input type="checkbox" name="checkbox" value="${list.type}" data-am-ucheck>&nbsp&nbsp${list.title }
		                                    </c:if>
										</label>
                                   </c:forEach>
 							</div>
							<!-- 隐藏域-->
 									<input id="roleid" name="roleid" type="hidden"
										value="${usertype.roleid}" /> 
						</form>
						<!-- 表单体  end-->
					</div>
				</div>
		</div>

</body>
</html>
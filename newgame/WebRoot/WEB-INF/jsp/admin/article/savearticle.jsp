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
		  base: '<%=path %>/admin/article/' //你存放新模块的目录，注意，不是layui的模块目录
		}).use('addarticle'); //加载入口
		
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
								<label for="user-name" class="am-u-sm-3 am-form-label">名称
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${article.name}" id="name" name="name" type="text" readonly="readonly"
										class="tpl-form-input">
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">大类型
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${article.articleType}" id="articleType" name="articleType" type="text" readonly="readonly"
										class="tpl-form-input">
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">小类型
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${article.subType}" id="subType" name="subType" type="text" readonly="readonly"
										class="tpl-form-input">
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">使用等级
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${article.articleLevel}" id="articleLevel" name="articleLevel" type="text" 
										class="tpl-form-input">
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">增加量
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${article.add}" id="add" name="add" type="text" 
										class="tpl-form-input">
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">出售价
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${article.sellnum}" id="sellnum" name="sellnum" type="text" 
										class="tpl-form-input">
								</div>
							</div>
							
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">是否图纸
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<c:if test="${article.articleType==2}">
										<c:if test="${article.subType==2}">
											是
										</c:if>
										<c:if test="${article.subType!=2}">
											否
										</c:if>
									</c:if>
									<c:if test="${article.articleType!=2}">
											否
									</c:if>
								</div>
						 </div>
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">能否购买
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<c:if test="${article.articleType==2}">
										<c:if test="${article.subType==2}">
											<c:if test="${article.purchase==1}">
											<input type="radio" name="purchase" class="tpl-form-input" value="1" checked="checked"
											 />是 <input
											type="radio" name="purchase" class="tpl-form-input" value="0"
											 />否
											</c:if>
											<c:if test="${article.purchase!=1}">
											<input type="radio" name="purchase" class="tpl-form-input" value="1" 
											 />是 <input
											type="radio" name="purchase" class="tpl-form-input" value="0" checked="checked"
											 />否
											</c:if>
										</c:if>
									</c:if>
									<c:if test="${article.articleType!=2}">
										<c:if test="${article.subType!=2}">
											<input value="非图纸，不能填写"  type="text" readonly="readonly"
											class="tpl-form-input">
										</c:if>
									</c:if>
								</div>
						</div>
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">掉落关卡
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${article.produce}" id="produce" name="produce" type="text"
										class="tpl-form-input">
								</div>
							</div>
							
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">纸娃娃id
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${article.secondid}" id="secondid" name="secondid" type="text" readonly="readonly"
										class="tpl-form-input">
								</div>
							</div>

<%-- 						<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">说明
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${article.description}" id="description" name="description" type="text"
										class="tpl-form-input">
								</div>
							</div> --%>
							
							<div class="am-form-group">
						      <label for="doc-vld-ta-2">说明：</label>
						      <textarea id="doc-vld-ta-2"  minlength="10" maxlength="100" name="description">${article.description}</textarea>
						    </div>
							
							<!-- 隐藏域-->
 							<input id="id" name="id" type="hidden"
										value="${article.id}" /> 
						</form>
						<!-- 表单体  end-->
					</div>
				</div>
		</div>
</body>
</html>
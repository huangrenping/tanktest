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
		  base: '<%=path %>/admin/shopping/' //你存放新模块的目录，注意，不是layui的模块目录
		}).use('addshopping'); //加载入口
		
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
									<input value="${shop.name}" id="name" name="name" type="text" readonly="readonly"
										class="tpl-form-input">
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">道具表id
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${shop.articleid}" id="articleid" name="articleid" type="text" readonly="readonly"
										class="tpl-form-input">
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">货币类型
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<c:if test="${shop.montype==1}">
									<input type="radio" name="montype" class="tpl-form-input" value="1" checked="checked"
										 />钻石 <input
										type="radio" name="montype" class="tpl-form-input" value="0"
										 />金币
									</c:if>
									<c:if test="${shop.montype==0 }">
									<input type="radio" name="montype" class="tpl-form-input" value="1" 
										 />钻石 <input
										type="radio" name="montype" class="tpl-form-input" value="0" checked="checked"
										 />金钱
									</c:if>
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">单价
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${shop.price}" id="price" name="price" type="text"
										class="tpl-form-input">
								</div>
							</div>
							
			 				<div class="am-form-group">
								<label for="user-email" class="am-u-sm-3 am-form-label">开始时间
								</label>
								<div class="am-u-sm-9">
								<c:if test="${shop.starttime!=null }">
									<input
										value="${shop.starttime}"
										name="starttime" type="text"
										class="am-form-field tpl-form-no-bg" placeholder="不填为永久"
										data-am-datepicker="" readonly="">
								</c:if>
								<c:if test="${shop.starttime==null }">
									<input
										value="2010-01-01"
										name="starttime" type="text"
										class="am-form-field tpl-form-no-bg" placeholder="不填为永久"
										data-am-datepicker="" readonly="">
								</c:if>
								</div>
							</div>
														
							 <div class="am-form-group">
								<label for="user-email" class="am-u-sm-3 am-form-label">结束时间
								</label>
								<div class="am-u-sm-9">
								<c:if test="${shop.endtime!=null }">
									<input
										value="${shop.endtime}"
										name="endtime" type="text"
										class="am-form-field tpl-form-no-bg" placeholder="不填为永久"
										data-am-datepicker="" readonly="">
								</c:if>
								<c:if test="${shop.endtime==null }">
									<input
										value="2010-01-01"
										name="endtime" type="text"
										class="am-form-field tpl-form-no-bg" placeholder="不填为永久"
										data-am-datepicker="" readonly="">
								</c:if>
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">数量
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${shop.count}" name="count" id="count" type="text"
										class="tpl-form-input" placeholder="请输入联系电话"> <small>请大于0</small>
								</div>
							</div>

							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">是否热卖
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
								<c:if test="${shop.isremai==0 }">
										<input type="radio" name="isremai" class="tpl-form-input"
										value="1">是
										<input type="radio" name="isremai" class="tpl-form-input"
										value="0" checked="checked">否
								</c:if>
								<c:if test="${shop.isremai==1}">
										<input type="radio" name="isremai" class="tpl-form-input"
										value="1" checked="checked">是
										<input type="radio" name="isremai" class="tpl-form-input"
										value="0" >否
								</c:if>
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">商城是否显示
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
								<c:if test="${shop.show==0 }">
										<input type="radio" name="show" class="tpl-form-input"
										value="1">是
										<input type="radio" name="show" class="tpl-form-input"
										value="0" checked="checked">否
								</c:if>
								<c:if test="${shop.show==1}">
										<input type="radio" name="show" class="tpl-form-input"
										value="1" checked="checked">是
										<input type="radio" name="show" class="tpl-form-input"
										value="0" >否
								</c:if>
								</div>
							</div>

							<!-- 隐藏域-->
 							<input id="id" name="id" type="hidden"
										value="${shop.id}" /> 
						</form>
						<!-- 表单体  end-->
					</div>
				</div>
		</div>

</body>
</html>
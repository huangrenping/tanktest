<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" type="image/png" href="${webPath}/assets/i/favicon.png">
<link rel="apple-touch-icon-precomposed" href="${webPath}/assets/i/app-icon72x72@2x.png">
<link rel="stylesheet" href="${webPath}/assets/css/amazeui.min.css" />
<link rel="stylesheet" href="${webPath}/assets/css/amazeui.datatables.min.css" />
<link rel="stylesheet" href="${webPath}/assets/css/app.css">
<link rel="stylesheet" href="${webPath}/assets/js/amazeui.datetimepicker-se.min.css">

<script type="text/javascript" src="${webPath}/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${webPath}/assets/js/echarts.min.js"></script>
<script type="text/javascript" src="${webPath}/assets/js/moment-with-locales.min.js"></script>
<script type="text/javascript" src="${webPath}/assets/js/amazeui.datetimepicker-se.js"></script>
<script type="text/javascript" src="${webPath}/assets/js/moment.min.js"></script>
<script type="text/javascript" src="${webPath}/assets/js/amazeui-pagination.js"></script>
<script type="text/javascript" src="${webPath}/assets/js/common.js"></script> 

	<script type="text/javascript">
	layui.config({
		  base: '${webPath}/admin/userLevel/' //你存放新模块的目录，注意，不是layui的模块目录
		}).use('addLevel'); //加载入口
		
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
								<label for="user-name" class="am-u-sm-3 am-form-label">部门名称:
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${level.name}" id="name" name="name" type="text"
										class="tpl-form-input" placeholder="请输入部门名称">
									<!-- 隐藏域 -->
									<input value="${level.name}" id="oldname" name="oldname" type="hidden"
										class="tpl-form-input" >
								</div>
							</div>

							<div class="am-form-group">
						      <label for="doc-vld-ta-2">备注：</label>
						      <textarea id="doc-vld-ta-2" cols="10" rows="10" name="mark" id="mark" minlength="10" maxlength="100">${level.mark}</textarea>
						    </div>
									<!-- 隐藏域-->
									<input id="id" name="id" type="hidden"
										value="${level.id}" />
						</form>
						<!-- 表单体  end-->
					</div>
				</div>
		</div>

</body>
</html>
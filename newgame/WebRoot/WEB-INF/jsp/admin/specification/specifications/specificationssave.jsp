<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<c:set var="webPath" value="${pageContext.request.contextPath }"></c:set>   
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${webPath}/assets/css/amazeui.min.css" />
<link rel="stylesheet" href="${webPath}/assets/css/amazeui.datatables.min.css" />
<link rel="stylesheet" href="${webPath}/assets/css/app.css">
<script src="${webPath}/assets/js/jquery.min.js"></script>
<script src="${webPath}/assets/js/theme.js"></script>
<script src="${webPath}/assets/js/amazeui.min.js"></script>
<script src="${webPath}/assets/js/app.js"></script>
<script src="${webPath}/assets/js/amazeui-pagination.js"></script>

<script type="text/javascript">
	layui.config({
		  base: '${webPath}/admin/specification/specifications/' //你存放新模块的目录，注意，不是layui的模块目录
		}).use('specificationssave'); //加载入口
</script>

<title>规格种类表</title>
</head>
<script>
	var webPath = "${webPath}";
</script>
<body class="theme-black">
	<!-- 内容区域 -->
		<div class="row-content am-cf">
			<div class="row">
				<div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
					<div class="widget am-cf">
						<div class="widget-head am-cf">
							<div class="widget-title am-fl">增加商品规格类型</div>
							<div class="widget-function am-fr">
								<a href="javascript:;" class="am-icon-cog"></a>
							</div>
						</div>
						<div class="widget-body am-fr">
							<form class="am-form tpl-form-border-form tpl-form-border-br" id="save-form">
								<input type="hidden" name="id" value="${entity.id }">
								<div class="am-form-group">
									<label for="user-name" class="am-u-sm-3 am-form-label">规格种类名称:</label>
									<div class="am-u-sm-9">
										<input type="text" class="tpl-form-input" id="name" name="name" value="${entity.name }"
											placeholder="请输入规格种类名称"> <small>请填规格种类名称10-20字左右</small>
									</div>
								</div>
								<div class="am-form-group">
									<label for="user-intro" class="am-u-sm-3 am-form-label">规格种类描述:</label>
									<div class="am-u-sm-9">
										<textarea class="" rows="10" id="remark" name="mark"
											placeholder="请输入规格种类描述">${entity.mark }</textarea>
									</div>
								</div>
								
								<div class="am-form-group">
									<div class="am-u-sm-9 am-u-sm-push-3">
										<button id="btn-save" type="button" class="am-btn am-btn-primary tpl-btn-bg-color-success ">提交</button>
									</div>
								</div>
								<input type="hidden" value="1" id="isdrop"></input>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

	<!-- 删除弹出框 -->
	<div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm">
		  <div class="am-modal-dialog">
		    <div class="am-modal-hd">Amaze UI</div>
		    <div class="am-modal-bd">
		      你，确定要删除这条记录吗？
		    </div>
		    <div class="am-modal-footer">
		      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
		      <span class="am-modal-btn" data-am-modal-confirm>确定</span>
		    </div>
		  </div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<c:set var="webPath" value="${pageContext.request.contextPath }"></c:set>   
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
		  base: '${webPath}/admin/goodstype/goodstypebig/' //你存放新模块的目录，注意，不是layui的模块目录
		}).use('goodstypebigsave'); //加载入口
</script>

<title>大类型类型添加</title>
<script>
	var webPath = "${webPath}";
</script>
</head>
<body class="theme-black">
	<!-- 内容区域 -->
		<div class="row-content am-cf">
			<div class="row">
				<div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
					<div class="widget am-cf">
						<div class="widget-head am-cf">
							<div class="widget-title am-fl">增加商品大类型</div>
							<div class="widget-function am-fr">
								<a href="javascript:;" class="am-icon-cog"></a>
							</div>
						</div>
						<div class="widget-body am-fr">
							<form class="am-form tpl-form-border-form tpl-form-border-br" id="save-form">
								<input type="hidden" name="id" value="${entity.id }">
								<div class="user-intro">
									<label for="name" class="am-u-sm-3 am-form-label">大类型名称:</label>
									<div class="am-u-sm-9">
										<input type="text" class="tpl-form-input" id="name" name="name" value="${entity.name }"
											placeholder="请输入商品大类型"> <small>请填写商品大类型</small>
									</div>
								</div>
								<div class="am-form-group">
									<label for="user-intro" class="am-u-sm-3 am-form-label">大类型备注:</label>
									<div class="am-u-sm-9">
										<textarea class="" rows="10" id="remark" name="mark"
											placeholder="请输入商品类型备注">${entity.mark }</textarea>
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
			
		
	<!-- 确定弹出框 -->
	<div class="am-modal am-modal-alert" tabindex="-1" id="my-alert">
	  <div class="am-modal-dialog">
	    <div class="am-modal-hd">Amaze UI</div>
	    <div class="am-modal-bd" id="message">
	      Hello world！
	    </div>
	    <!-- <div class="am-modal-footer">
	      <span class="am-modal-btn">确定</span>
	    </div> -->
	  </div>
	</div>
</body>
</html>
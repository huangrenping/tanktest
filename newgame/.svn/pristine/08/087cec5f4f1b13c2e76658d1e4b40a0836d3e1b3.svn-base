<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加轮播图页面</title>
<script src="${webPath}/assets/js/echarts.min.js"></script>
<link rel="stylesheet" href="${webPath}/assets/css/amazeui.min.css" />
<link rel="stylesheet"
	href="${webPath}/assets/css/amazeui.datatables.min.css" />
<link rel="stylesheet" href="${webPath}/assets/css/app.css">
<script src="${webPath}/assets/js/jquery.min.js"></script>
<script src="${webPath}/assets/js/amazeui.min.js"></script>
<script src="${webPath}/assets/js/amazeui.datatables.min.js"></script>
<script src="${webPath}/assets/js/dataTables.responsive.min.js"></script>
<script src="${webPath}/assets/js/app.js"></script>
<script type="text/javascript"
		src="${webPath}/js/jquery-3.2.1.js"></script>
<script type="text/javascript"
		src="${webPath}/eudit/ueditor.config.js"></script>
<script type="text/javascript"
		src="${webPath}/eudit/ueditor.all.js"></script>
<script type="text/javascript"
		src="${webPath}/eudit/lang/zh-cn/zh-cn.js"></script>

<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
<script type="text/javascript">
	 layui.config({
		base : '${webPath}/admin/News/' //你存放新模块的目录，注意，不是layui的模块目录
	}).use('AddNews'); //加载入口
</script>
</head>
<body class="theme-black">
	<!-- 内容区域 -->
	 <div class="row-content am-cf">
		<div class="row">
			<div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
				<div class="widget am-cf">
					<div class="widget-head am-cf">
						<div class="widget-title am-fl">编辑新闻</div>
						<div class="widget-function am-fr">
							<a href="javascript:;" class="am-icon-cog"></a>
						</div>
					</div>
					<div class="widget-body am-fr">
						<form id="news_form"
							class="am-form tpl-form-border-form tpl-form-border-br"
							data-am-validator="" novalidate="novalidate">
							<fieldset>
								<div class="am-form-group">
									<label for="doc-vld-name-2" class="am-u-sm-3 am-form-label">新闻标题：<span
										class="tpl-form-line-small-title">Title</span></label>
									<div class="am-u-sm-9">
										<input type="text" name="title" value="${news.title}"
											class="tpl-form-input" id="doc-vld-name-2" required=""
											placeholder="请输入新闻标题" >
									</div>
								</div>
								<div class="am-form-group" style="width: 788px; height: 477px;">
									<label for="doc-vld-name-2" class="am-u-sm-3 am-form-label">新闻内容：<span
										class="tpl-form-line-small-title">content</span></label> <br>
										<div class="am-u-sm-9" >
                                              <textarea id="myEditor"  style="width: 571px; height:300px; " >${news.content}</textarea>  
                                        </div>
    								
								</div>
								<input type="hidden"  name="id" value="${news.id}">
								<div class="am-form-group">
									<div class="am-u-sm-9 am-u-sm-push-6">
										<button id="btn_EditNews" type="button"
											class="am-btn am-btn-primary tpl-btn-bg-color-success ">提交</button>
									</div>
								</div>

							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div> 
	<!-- 加载编辑器的容器 -->
    <script type="text/javascript">
    $(function(){ 
    	var editor = new UE.ui.Editor({ initialFrameHeight:300},
    			{initialFrameWidth:600});
    	editor.render('myEditor');    
        UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;  
        UE.Editor.prototype.getActionUrl = function(action){  
            if(action == 'uploadimage'){
                return webPath+'/news/uploadimage';  
            }else{  
                return this._bkGetActionUrl.call(this, action);  
            } 
        }
    });  
    </script>

</body>
</html>
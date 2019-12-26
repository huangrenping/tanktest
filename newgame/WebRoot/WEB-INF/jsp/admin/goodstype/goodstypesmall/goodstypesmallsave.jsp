<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<c:set var="webPath" value="${pageContext.request.contextPath }"></c:set>   
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <script src="${webPath}/assets/js/echarts.min.js"></script>
    <link rel="stylesheet" href="${webPath}/assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="${webPath}/assets/css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="${webPath}/assets/css/app.css">
    <script src="${webPath}/assets/js/jquery.min.js"></script>
   <script src="${webPath}/assets/js/amazeui.min.js"></script>
    <script src="${webPath}/assets/js/amazeui.datatables.min.js"></script>
    <script src="${webPath}/assets/js/dataTables.responsive.min.js"></script>
    <script src="${webPath}/assets/js/app.js"></script>
    
    <jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>

<script type="text/javascript">
	layui.config({
		  base: '${webPath}/admin/goodstype/goodstypesmall/' //你存放新模块的目录，注意，不是layui的模块目录
		}).use('goodstypesmallsave'); //加载入口
</script>

<title>小类型管理</title>
</head>
<body class="theme-black">
	<!-- 内容区域 -->
		<div class="row-content am-cf">
			<div class="row">
				<div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
						<div class="widget am-cf">
							<div class="widget-head am-cf">
								<div class="widget-title am-fl">增加商品小类</div>
								<div class="widget-function am-fr">
									<a href="javascript:;" class="am-icon-cog"></a>
								</div>
							</div>
							<div class="widget-body am-fr">

								<form class="am-form tpl-form-border-form tpl-form-border-br" id="save-form">
									<div class="am-form-group">
										<label for="user-name" class="am-u-sm-3 am-form-label">小类名称：
										</label>
										<div class="am-u-sm-9">
											<input type="text" class="tpl-form-input" name="name" id="Smallname"
												placeholder="请输入小类名称"> <small>请规范输入小类名称。</small>
										</div>
									</div>
									<div class="am-form-group">
										<label for="user-phone" class="am-u-sm-3 am-form-label">所属大类：
										</label>

										<div class="am-u-sm-9">
											<select data-am-selected="" style="display: none;" name="goodsTypeId" id="goodsTypeId">
											     
											</select>
										</div>

									</div>
									<div class="am-form-group">
										<label for="user-weibo" class="am-u-sm-3 am-form-label">小类简图：
										</label>
										<div class="am-u-sm-9">
											<div class="am-form-group am-form-file">
												<div class="tpl-form-file-img">
													<img id="imgUrl" src="${webPath }/admin/goodstype/img/tx02S.jpg"
														width="500px" height="300px">
												</div>
				    							
												 <button type="button" id="kdUploadSelect" class="am-btn am-btn-danger am-btn-sm          ">
														<i class="am-icon-cloud-upload"></i> 添加小类简图
												</button>
												<input id="fImg" name="img" type="hidden" value="/admin/goodstype/img/tx02S.jpg">
											</div>
										</div>
									</div>
                                    <input type="hidden" value="1" id=isdelete>
									<div class="am-form-group">
										<div class="am-u-sm-9 am-u-sm-push-3">
											<button type="button" id="btn-save"
												class="am-btn am-btn-primary tpl-btn-bg-color-success ">确定添加</button>
										</div>
									</div>
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
	
	<!-- 确定弹出框 -->
	<div class="am-modal am-modal-alert" tabindex="-1" id="my-alert">
	  <div class="am-modal-dialog">
	    <div class="am-modal-hd">Amaze UI</div>
	    <div class="am-modal-bd" id="message">
	      Hello world！
	    </div>
	    <div class="am-modal-footer">
	      <span class="am-modal-btn">确定</span>
	    </div>
	  </div>
	</div>
</body>
</html>
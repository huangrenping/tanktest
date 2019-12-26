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
<script type="text/javascript" src="${webPath}/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="${webPath}/eudit/ueditor.config.js"></script>
<script type="text/javascript" src="${webPath}/eudit/ueditor.all.js"></script>
<%-- <script type="text/javascript" src="${webPath}/assets/js/amazeui.chosen.js"></script>
<script type="text/javascript" src="${webPath}/assets/js/jquery.form.min.js"></script> --%>
<script type="text/javascript"
	src="${webPath}/eudit/lang/zh-cn/zh-cn.js"></script>

<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
<script type="text/javascript">
	layui.config({
		base : '${webPath}/admin/goods/' //你存放新模块的目录，注意，不是layui的模块目录
	}).use('savegoods'); //加载入口
</script>
</head>
<body class="theme-black">
	<!-- 内容区域 -->
	<div class="row-content am-cf">
		<div class="row">
			<div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
				<div class="widget am-cf">
					<div class="widget-head am-cf">
						<div class="widget-title am-fl">编辑商品</div>
						<div class="widget-function am-fr">
							<a href="javascript:;" class="am-icon-cog"></a>
						</div>
					</div>
					<div class="widget-body am-fr">
						<form id="goods_form"
							class="am-form tpl-form-border-form tpl-form-border-br"
							data-am-validator="" novalidate="novalidate">
							<fieldset>
								<div class="am-form-group am-form-error">
									<label for="doc-vld-name-2" class="am-u-sm-3 am-form-label">商品名称：<span
										class="tpl-form-line-small-title">Name</span></label>

									<div class="am-u-sm-9">
										<input type="text" name="name" value="${goods.name}"
											class="tpl-form-input am-field-error am-active"
											id="doc-vld-name-2" required="" placeholder="请输入商品名称">
									</div>
								</div>

								<div class="am-form-group am-form-error">
									<label for="doc-vld-name-2" class="am-u-sm-3 am-form-label">商品标题：<span
										class="tpl-form-line-small-title">Title</span></label>
									<div class="am-u-sm-9">
										<textarea class="am-field-error am-active" name="title"
											rows="2" id="doc-vld-ta-2" placeholder="请输入商品标题" required="">${goods.title}</textarea>
									</div>
								</div>

								<div class="am-form-group">
									<label for="doc-vld-name-2" class="am-u-sm-3 am-form-label">商品子标题：<span
										class="tpl-form-line-small-title">SubTitle</span></label>
									<div class="am-u-sm-9">
										<textarea class="" name="subtitle" rows="2"
											id="doc-vld-ta-sub-2" placeholder="请输入商品子标题" required="">${goods.subtitle}</textarea>
									</div>
								</div>
								<div class="am-form-group">
									<label for="doc-select-1" class="am-u-sm-3 am-form-label">商品类型
										<span class="tpl-form-line-small-title">GoodsType</span>
									</label>
									<div class="am-u-sm-9">
								
										<select id="js-selected" style="width: 100px;height:38px;color: gray; ">
											<option value="-1">--请选择--</option>
											<option value="1">男装</option>
											<option value="2">女装</option>
											<option value="3">时装</option>
										</select>
		
										<div style="float: left; margin-left: 120px;margin-top: -38px">
										<select name="goodsTypeId" id="goodstypesmall"
											data-am-selected >
											<option value="" >--请选择--</option>
											
										</select>
										</div> 
									</div>
								</div>

								<div class="am-form-group">
									<div for="doc-vld-name-2" class="am-u-sm-3 am-form-label">
										<label>商品尺寸：<span class="tpl-form-line-small-title">goodsSize</span>
										</label>
									</div>
									<div class="am-form-group" style="margin-top: 10px">
										<label class="am-checkbox-inline"><input
											type="checkbox" value="1"> S</label><label
											class="am-checkbox-inline" name="size"><input
											type="checkbox" value="2" name="size"> M</label><label
											class="am-checkbox-inline"><input type="checkbox"
											value="3" name="size"> L</label><label
											class="am-checkbox-inline"> <input type="checkbox"
											value="4" name="size"> XL
										</label> <label class="am-checkbox-inline"><input
											type="checkbox" value="5" name="size">XXL</label> <label
											class="am-checkbox-inline"><input type="checkbox"
											value="6" name="size">XXXL</label> <label
											class="am-checkbox-inline"><input type="checkbox"
											value="7" name="size">均码</label>
									</div>
									<script type="text/javascript">
										window.onload = function() {
											//size
											var h1 = document.getElementsByName("size");
											var h2 = "${goods.size}";
											var h4 = h2.split(",");
											for (var a = 0; a < h1.length; a++) {
												for (var i = 0; i < h4.length; i++) {
													if (h1[a].value == h4[i]) {
														h1[a].checked = "checked";
													}

												}
											}
											//color
											var h5 = document.getElementsByName("color");
											var h6 = "${goods.color}";
											var h7 = h6.split(",");
											for (var a = 0; a < h5.length; a++) {
												for (var i = 0; i < h7.length; i++) {
													if (h5[a].value == h7[i]) {
														h5[a].checked = "checked";
													}

												}
											}
											//state
											var h8 = document.getElementsByName("state");
											var h9 = "${goods.state}";
											h8[h9].checked = "checked";
											//goodstypesmall
											/* var type=document.getElementById("goodstypesmall");
											var idvalue="${goods.goodsTypeId}";
											type.value(idvalue); */
										}
									</script>

								</div>
								<div class="am-form-group">
									<div for="doc-vld-name-2" class="am-u-sm-3 am-form-label">
										<label>商品颜色：<span class="tpl-form-line-small-title">goodsColor</span>
										</label>
									</div>
									<div class="am-form-group" style="margin-top: 10px">
										<label class="am-checkbox-inline"><input
											type="checkbox" value="8" name="color">黑色</label> <label
											class="am-checkbox-inline"><input type="checkbox"
											value="9" name="color">白色</label> <label
											class="am-checkbox-inline"><input type="checkbox"
											value="10" name="color">红色</label><label
											class="am-checkbox-inline"> <input type="checkbox"
											value="11" name="color"> 灰色
										</label> <label class="am-checkbox-inline"><input
											type="checkbox" value="12" name="color">粉色</label> <label
											class="am-checkbox-inline"><input type="checkbox"
											value="13" name="color">绿色</label> <label
											class="am-checkbox-inline"><input type="checkbox"
											value="14" name="color">紫色</label> <label
											class="am-checkbox-inline"><input type="checkbox"
											value="15" name="color">黄色</label>
									</div>

								</div>
								<div class="am-form-group">
									<label for="doc-vld-name-2" class="am-u-sm-3 am-form-label">存货数量：<span
										class="tpl-form-line-small-title">RepositoryNum</span></label>

									<div class="am-u-sm-9">
										<input type="number" name="num" min="0" value="${goods.num}"
											class="tpl-form-input" required="" placeholder="请输入存货数量"
											pattern="^-?(?:\d+|\d{1,3}(?:,\d{3})+)?(?:\.\d+)?$">
									</div>
								</div>
								<div class="am-form-group">
									<label for="doc-vld-name-2" class="am-u-sm-3 am-form-label">商品价格：<span
										class="tpl-form-line-small-title">Price</span></label>

									<div class="am-u-sm-9">
										<input type="number" min="0" value="${goods.price}"
											name="price" class="tpl-form-input" required=""
											placeholder="请输入商品价格"
											pattern="^-?(?:\d+|\d{1,3}(?:,\d{3})+)?(?:\.\d+)?$">
									</div>
								</div>

								<div class="am-form-group">
									<label for="doc-vld-name-2" class="am-u-sm-3 am-form-label">运费：<span
										class="tpl-form-line-small-title">Freight</span></label>

									<div class="am-u-sm-9">
										<input type="number" min="0" value="${goods.freight}"
											name="freight" class="tpl-form-input" required=""
											placeholder="请输入运费"
											pattern="^-?(?:\d+|\d{1,3}(?:,\d{3})+)?(?:\.\d+)?$">
									</div>
								</div>
								<div class="am-form-group">
									<div for="doc-vld-name-2" class="am-u-sm-3 am-form-label">
										<label>商品状态：<span class="tpl-form-line-small-title">goodsState</span>
										</label>
									</div>
									<div class="am-u-sm-9">
										<label class="am-radio-inline"> <input type="radio"
											checked="checked" value="1" name="state" required="">上架
										</label> <label class="am-radio-inline"> <input type="radio"
											name="state" value="3"> 准备上架
										</label> <label class="am-radio-inline"> <input type="radio"
											name="state" value="2"> 下架
										</label>
									</div>
									<script type="text/javascript">
										$(
												"input[name='state'][type='radio'][value='']")
												.attr("checked", true);
									</script>
								</div>

								<div class="am-form-group">
									<label for="user-weibo" class="am-u-sm-3 am-form-label">商品封面图
										<span class="tpl-form-line-small-title">Images</span>
									</label>
									<div class="am-u-sm-9">
										<div class="am-form-group am-form-file">
											<div class="tpl-form-file-img">
												<c:if test="${goods.coverimg==null ||goods.coverimg=='' }">
													<img id="imgUrl" src="${webPath}/assets/img/a5.png"
														width="436px" height="303px" alt="">
												</c:if>
												<c:if test="${goods.coverimg!=null &&goods.coverimg!='' }">
													<img id="imgUrl" src="${webPath}/${goods.coverimg}"
														width="436px" height="303px" alt="">
												</c:if>
											</div>
											<button type="button" id="kdUploadSelect"
												class="am-btn am-btn-danger am-btn-sm">
												<i class="am-icon-cloud-upload"></i> 添加封面图片
											</button>
											<!-- <input id="doc-form-file" type="file" multiple=""> -->
										</div>
									</div>
								</div>
								<div class="am-form-group">
									<label for="user-weibo" class="am-u-sm-3 am-form-label">商品轮播图
										<span class="tpl-form-line-small-title">ImagesLooper</span>
									</label>
									<div class="am-u-sm-9">
										<div class="am-form-group am-form-file">
											<div class="tpl-form-file-img">
												<div class="hp-upload-div" id="uploadViewDiv"
													style="width: 1100px"></div>
												<div style="display: none;" id="hp-upload-div-data"></div>
											</div>
										</div>
									</div>
								</div>
								<div class="am-form-group">
									<label for="doc-vld-name-2" class="am-u-sm-3 am-form-label">商品详情：<span
										class="tpl-form-line-small-title">Detail</span></label> <br>
									<div class="am-u-sm-9">
										<textarea id="myEditor">${goods.detail}</textarea>
									</div>
								</div>
								<input type="hidden" name="id" value="${goods.id}"> <input
									type="hidden" id="coverimg" name="coverimg"
									value="${goods.coverimg}">

								<div class="am-form-group">
									<div class="am-u-sm-9 am-u-sm-push-6">
										<button id="addbut" type="button"
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
		$(function() {
			var editor = new UE.ui.Editor({
				initialFrameHeight : 300
			}, {
				initialFrameWidth : 600
			});
			editor.render('myEditor');
			UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;
			UE.Editor.prototype.getActionUrl = function(action) {
				if (action == 'uploadimage') {
					return webPath + '/news/uploadimage';
				} else {
					return this._bkGetActionUrl.call(this, action);
				}
			}
		});
	</script>

</body>

</html>
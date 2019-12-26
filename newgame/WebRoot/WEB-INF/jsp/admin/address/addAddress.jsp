<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Amaze UI Admin index Examples</title>
<meta name="description" content="这是一个 index 页面">
<meta name="keywords" content="index">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png" href="${webPath}/assets/i/favicon.png">
<link rel="apple-touch-icon-precomposed"
	href="${webPath}/assets/i/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<script src="${webPath}/assets/js/echarts.min.js"></script>
<link rel="stylesheet" href="${webPath}/assets/css/amazeui.min.css" />
<link rel="stylesheet"
	href="${webPath}/assets/css/amazeui.datatables.min.css" />
<link rel="stylesheet" href="${webPath}/assets/css/app.css">
<script src="${webPath}/assets/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${webPath}/admin/address/distpicker.data.js"></script>
<script type="text/javascript"
	src="${webPath}/admin/address/distpicker.js"></script>
<script type="text/javascript" src="${webPath}/admin/address/main.js"></script>
<script type="text/javascript">
	layui.config({
		  base: '${webPath}/admin/address/' //你存放新模块的目录，注意，不是layui的模块目录
		}).use('saveaddress'); //加载入口
</script>
</head>
<body class="theme-black">
	<div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
		<div class="widget am-cf">
			
			<div class="widget-body am-fr">

				<form class="am-form tpl-form-border-form" style="width: 800px;" id="addressForm">
				<input type="hidden" name="id" value="${address.id}">
					<div class="am-form-group" style="width: 200px;">
						<label for="user-name"
							class="am-u-sm-12 am-form-label am-text-left">收货人: <span
							class="tpl-form-line-small-title">Send</span>
						</label>
						<div class="am-u-sm-12" >
							<input type="text" class="tpl-form-input am-margin-top-xs"
							name="receivePersonName"	id="user-name" placeholder="请输入收货人姓名" value="${address.receivePersonName}">
						</div>
						<div style="float: right;  margin-left: 200px; position: absolute;">
							<label for="user-name"
							class="am-u-sm-12 am-form-label am-text-left">收货人电话: <span
							class="tpl-form-line-small-title">Telphone</span></label>
						<div class="am-u-sm-12" >
							<input type="text" class="tpl-form-input am-margin-top-xs"
							name="receivePersonPhone"	id="phone" placeholder="请输入收货人电话" value="${address.receivePersonPhone}">
						</div>
						</div>
						<div style="float: right;  margin-left: 510px; position: absolute;">
						<label for="user-intro"
							class="am-u-sm-12 am-form-label  am-text-left">默认地址:<span
							class="tpl-form-line-small-title">Default</span></label>
						<div class="am-u-sm-12">
							<div class="tpl-switch">
								<input type="checkbox"
									class="ios-switch bigswitch tpl-switch-btn am-margin-top-xs"
								name="isDefault"	checked="" value="1">
								<div class="tpl-switch-btn-view">
									<div></div>
								</div>
							</div>

						</div>
						</div>
						
					
					</div>
					
					
					<div data-toggle="distpicker">
						<div class="am-form-group">
							<label for="user-phone"
								class="am-u-sm-12 am-form-label am-text-left">省份:<span
								class="tpl-form-line-small-title">Province</span></label>
							<div class="am-u-sm-12  am-margin-top-xs">
								<select data-am-selected="{searchBox: 1}" style="display: none;" name="province" value="${address.province}">

								</select>

							</div>
							<div style="float: right;  margin-left: 200px; position: absolute;">
							<label for="user-phone"
								class="am-u-sm-12 am-form-label am-text-left">城市:<span
								class="tpl-form-line-small-title">City</span></label>
							<div class="am-u-sm-12  am-margin-top-xs">
								<select data-am-selected="{searchBox: 1}" style="display: none;" name="city" value="${address.city}">

								</select>

							</div>
							</div>
							<div style="float: right;  margin-left: 400px; position: absolute;">
							<label for="user-phone"
								class="am-u-sm-12 am-form-label am-text-left">区域:<span
								class="tpl-form-line-small-title">District</span></label>
							<div class="am-u-sm-12  am-margin-top-xs">
								<select data-am-selected="{searchBox: 1}" style="display: none;" name="area" value="${address.area}">

								</select>

							</div>
							</div>
						</div>
						
					</div>
					<div class="am-form-group" style="width: 200px;">
						<label for="user-name"
							class="am-u-sm-12 am-form-label am-text-left">省编码: <span
							class="tpl-form-line-small-title">Rcode</span></label>
						<div class="am-u-sm-12">
							<input type="text" class="tpl-form-input am-margin-top-xs"
							name="provinceCode"	id="Rcode" placeholder="请输入省编码" value="${address.provinceCode}">
						</div>
						<div style="float: right;  margin-left: 200px; position: absolute;">
						
						<label for="user-name"
							class="am-u-sm-12 am-form-label am-text-left">市编码:<span
							class="tpl-form-line-small-title">Rcitycode</span></label>
						<div class="am-u-sm-12" style="align-content:200px;">
							<input type="text" class="tpl-form-input am-margin-top-xs"
							name="cityCode"	id="Rcitycode" placeholder="请输入市编码" value="${address.cityCode}">
						</div>
						</div>
						<div style="float: right;  margin-left: 485px; position: absolute;">
						<label for="user-name"
							class="am-u-sm-12 am-form-label am-text-left">区域编码: <span
							class="tpl-form-line-small-title">Rareacode</span></label>
						<div class="am-u-sm-12">
							<input type="text" class="tpl-form-input am-margin-top-xs"
							name="areaCode"	id="Rareacode" placeholder="请输入区域编码" value="${address.areaCode}">
						</div>
						</div>
						
					</div>
					<div class="am-form-group">
						<label for="user-name"
							class="am-u-sm-12 am-form-label am-text-left">详细地址: <span
							class="tpl-form-line-small-title">raddress</span></label>
						<div class="am-u-sm-12">
							<input type="text" class="tpl-form-input am-margin-top-xs"
							name="address"	id="raddress" placeholder="请输入详细地址" value="${address.address}">
						</div>
					</div>

					<div class="am-form-group">
						<div class="am-u-sm-12 am-u-sm-push-12">
							<button type="button"
								class="am-btn am-btn-primary tpl-btn-bg-color-success " id="addbut">提交</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="${webPath}/assets/js/amazeui.min.js"></script>
	<script src="${webPath}/assets/js/amazeui.datatables.min.js"></script>
	<script src="${webPath}/assets/js/dataTables.responsive.min.js"></script>
	<script src="${webPath}/assets/js/app.js"></script>


</body>
</html>
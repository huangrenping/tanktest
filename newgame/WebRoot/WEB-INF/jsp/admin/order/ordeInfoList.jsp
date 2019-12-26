<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>商品管理界面</title>
		<meta name="description" content="这是一个 index 页面">
		<meta name="keywords" content="index">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<link rel="icon" type="image/png" href="${webPath}/assets/i/favicon.png">
		<link rel="apple-touch-icon-precomposed" href="${webPath}/assets/i/app-icon72x72@2x.png">
		<meta name="apple-mobile-web-app-title" content="Amaze UI" />
		<script src="${webPath}/assets/js/echarts.min.js"></script>
		<link rel="stylesheet" href="${webPath}/assets/css/amazeui.min.css" />
		<link rel="stylesheet" href="${webPath}/assets/css/amazeui.datatables.min.css" />
		<link rel="stylesheet" href="${webPath}/assets/css/app.css">
		<script src="${webPath}/assets/js/jquery.min.js"></script>
    	<script src="${webPath}/assets/js/amazeui-pagination.js"></script>
	</head>
	<script type="text/javascript">
	layui.config({
		  base: '${webPath}/admin/order/' //你存放新模块的目录，注意，不是layui的模块目录
		}).use('OderInfoList'); //加载入口
</script>
	<body class="theme-black">
			<div class="row-content am-cf">
				<div class="row">
					<div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
						<div class="widget am-cf">
							<div class="widget-head am-cf">
								<div class="widget-title  am-cf">显示订单列表</div>
							</div>
							<div class="widget-body  am-fr">

								<div class="am-u-sm-12 am-u-md-6 am-u-lg-6">
									<div class="am-form-group">
										<div class="am-btn-toolbar">
											<div class="am-btn-group am-btn-group-xs">
											
											</div>
										</div>
									</div>
								</div>
								<div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
									<div class="am-form-group tpl-table-list-select">
										<select data-am-selected="{btnSize: 'sm'}" id="state">
										   <option value=""></option>
							              <option value="0">全部</option>
							              <option value="1">未付款</option>
							              <option value="2">待发货</option>
							              <option value="3">已发货</option>
							              <option value="4">已签收</option>
										</select>
									</div>
								</div>
								<div class="am-u-sm-12 am-u-md-12 am-u-lg-3">
									<div class="am-input-group am-input-group-sm tpl-form-border-form cl-p">
										<input type="text" class="am-form-field " id="titleName">
										<span class="am-input-group-btn">
            <button class="am-btn  am-btn-default am-btn-success tpl-table-list-field am-icon-search" id="search-goods-btn" type="button"></button>
          </span>
									</div>
								</div>

								<div class="am-u-sm-12">
									<table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black ">
										<thead>
											<tr>
												<th>订单号</th>
												<th>支付方式</th>
												<th>运费</th>
												<th>订单金额</th>
												<th>状态</th>
												<th>付款时间</th>
												<th>发货时间</th>
												<th>收货时间</th>
												<th>是否评价</th>
												<th>用户</th>
												<th>收货地址</th>
												<th>订单创建时间</th>
												<th>操作</th>
											</tr>
										</thead>
										<tbody  id="content">
										</tbody>
									</table>
									<div class="am-u-lg-12 am-cf">

		                                <div class="am-fr">
		                                    <ul class="am-pagination tpl-pagination">
		                                       
		                                    </ul>
		                                </div>
                                	</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	</body>
	<script src="${webPath }/assets/js/amazeui.min.js"></script>
	<script src="${webPath }/assets/js/amazeui.datatables.min.js"></script>
	<script src="${webPath }/assets/js/dataTables.responsive.min.js"></script>

</html>
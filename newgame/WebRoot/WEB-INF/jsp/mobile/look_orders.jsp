<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsMobilePage.jsp"></jsp:include>
<html>
<head>
<title>查看全部订单</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.
">
</head>
<body ontouchstart>
<header class="wy-header" style="position:fixed; top:0; left:0; right:0; z-index:200;">
  <div class="wy-header-icon-back"><span></span></div>
  <div class="wy-header-title">订单管理</div>
</header>
<div class='weui-content'>
  <div class="weui-tab">
   <input type="hidden" name="state" id="mystate" value="${state }" />
    <div class="weui-navbar" style="position:fixed; top:44px; left:0; right:0; height:44px; background:#fff;">
      <a id="orderBtn" class="weui-navbar__item proinfo-tab-tit font-14 weui-bar__item--on" href="#tab1" orderState="">全部</a>
      <a id="orderBtn1" class="weui-navbar__item proinfo-tab-tit font-14" href="#tab2" orderState="1">待付款</a>
      <a id="orderBtn2" class="weui-navbar__item proinfo-tab-tit font-14" href="#tab3" orderState="2">待发货</a>
      <a id="orderBtn3" class="weui-navbar__item proinfo-tab-tit font-14" href="#tab4" orderState="3">待收货</a>
      <a id="orderBtn4" class="weui-navbar__item proinfo-tab-tit font-14" href="#tab5" orderState="4">待评价</a>
       <a id="orderBtn5" class="weui-navbar__item proinfo-tab-tit font-14" href="#tab6" orderState="5">已评价</a>
    </div>
    <div class="weui-tab__bd proinfo-tab-con" style="padding-top:87px;">
      <div id="tab1" class="weui-tab__bd-item weui-tab__bd-item--active">
      </div>
      <div id="tab2" class="weui-tab__bd-item">
        
      </div>
      <div id="tab3" class="weui-tab__bd-item">
      </div>
      <div id="tab4" class="weui-tab__bd-item">
      </div>
      <div id="tab5" class="weui-tab__bd-item">
      </div>
        <div id="tab6" class="weui-tab__bd-item">
      </div>
    </div>
  </div>
</div>
<script src="${webPath }/mobile/pageJs/look_orders.js"></script>
</body>
</html>
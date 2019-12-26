<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsMobilePage.jsp"></jsp:include>
<html>
<head>
<title>订单详情</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.
">
<script type="text/javascript" src="${webPath }/mobile/pageJs/order_info.js"></script>
</head>
<body ontouchstart>
<!--主体-->
<header class="wy-header">
  <div class="wy-header-icon-back"><span></span></div>
  <div class="wy-header-title">订单详情</div>
</header>
<div class="weui-content">
<input type="hidden" id="payno" value="${order.id}">
  <div class="wy-media-box weui-media-box_text address-select">
    <div class="weui-media-box_appmsg">
      <div class="weui-media-box__hd proinfo-txt-l" style="width:35px;"><span class="promotion-label-tit"><img src="${webPath}/mobile/upload/maps.png" /></span></div>
      <div class="weui-media-box__bd">
        <a href="${webPath}/mobile/toAddress" class="weui-cell_access">
          <h4 class="address-name"><span>${order.user.username}</span><span>${order.user.phone}</span></h4>
          <div class="address-txt" id="myaddress">${order.address.address}</div>
          <input type="hidden"  id="addressId" >
        </a>
      </div>
      <div class="weui-media-box__hd proinfo-txt-l" style="width:16px;"><div class="weui-cell_access"><span class="weui-cell__ft"></span></div></div>
    </div>
  </div>
  <div class="wy-media-box weui-media-box_text">
    <div class="weui-media-box__bd">
    <c:forEach var="item" items="${order.orderDetailList}">
     <div class="weui-media-box_appmsg ord-pro-list">
        <div class="weui-media-box__hd"><a href="pro_info.html"><img class="weui-media-box__thumb" src="${webPath}/${item.goodsImg}" alt=""></a></div>
        <div class="weui-media-box__bd">
          <h1 class="weui-media-box__desc"><a href="pro_info.html" class="ord-pro-link">${item.title}</a></h1>
          <p class="weui-media-box__desc">${item.specificationsInfo }</p>
          <div class="clear mg-t-10">
            <div class="wy-pro-pri fl">¥<em class="num font-15">${item.countMoney}</em></div>
            <div class="pro-amount fr"><span class="font-13">数量×<em class="name">${item.num}</em></span></div>
          </div>
        </div>
      </div>
     </c:forEach>
    </div>
  </div>
  
  <div class="weui-panel">
    <div class="weui-panel__bd">
      <div class="weui-media-box weui-media-box_small-appmsg">
        <div class="weui-cells">
          <div class="weui-cell weui-cell_access" href="javascript:;">
            <div class="weui-cell__bd weui-cell_primary">
              <p class="font-14"><span class="mg-r-10">运费</span><span class="fr txt-color-red">￥<em class="num">${order.freight}</em></span></p>
            </div>
          </div>
          <a class="weui-cell weui-cell_access" href="coupon.html">
            <div class="weui-cell__bd weui-cell_primary">
              <p class="font-14"><span class="mg-r-10">折扣券</span><span class="sitem-tip"><em class="num">0</em>张可用</span></p>
            </div>
            <span class="weui-cell__ft"></span>
          </a>
        </div>
      </div>
    </div>
  </div>
  <div class="wy-media-box weui-media-box_text">
    <div class="mg10-0 t-c">总金额：<span class="wy-pro-pri mg-tb-5">¥<em class="num font-20">${order.money}</em></span></div>

   <div>
   	<div class="weui-cell weui-cell_access"> 
   	    	<div class="weui-cell__bd"><img style="width: 40px;height: 40px;" src="${webPath}/mobile/upload/wxPay.png" /><span style="margin-left: 18px;">微信支付</span></div>
          <div class="weui-media-box__hd check-w weui-cells_checkbox">
          <label class="weui-check__label" for="cart-pto3">
            <div class="weui-cell__hd "><input type="radio" data-pay="0" class="weui-check pay" name="cartpro" id="cart-pto3"><i class="weui-icon-checked"></i></div>
          </label>
        </div>
   	</div>
   
   	<div class="weui-cell weui-cell_access"> 
   	    	<div class="weui-cell__bd"><img style="width: 40px;height: 40px;" src="${webPath}/mobile/upload/zfbPay.png" /><span style="margin-left: 18px;">支付宝支付</span></div>
          <div class="weui-media-box__hd check-w weui-cells_checkbox" >
          <label class="weui-check__label" for="cart-pto4">
            <div class="weui-cell__hd "><input type="radio" data-pay="1"  class="weui-check pay" name="cartpro" id="cart-pto4"><i class="weui-icon-checked"></i></div>
          </label>
        </div>
   	</div>
  </div>
   <div class="mg10-0"><a id="payBtn" href="javascript:;" class="weui-btn weui-btn_primary" style="background-color: #EA869A;">确认支付</a></div>
</div>
<!--底部导航-->
<div class="foot-black"></div>
<div class="weui-tabbar wy-foot-menu">
  <a href="${webPath }/mobile" class="weui-tabbar__item ">
    <div class="weui-tabbar__icon foot-menu-home"></div>
    <p class="weui-tabbar__label">首页</p>
  </a>
  <a href="${webPath }/toClassify" class="weui-tabbar__item">
    <div class="weui-tabbar__icon foot-menu-list"></div>
    <p class="weui-tabbar__label">分类</p>
  </a>
  <a href="${webPath}/shopCat/toCatByUid" class="weui-tabbar__item weui-bar__item--on">
    <div class="weui-tabbar__icon foot-menu-cart"></div>
    <p class="weui-tabbar__label">支付</p>
  </a>
  <c:if test="${loginUser==null }">
  <a href="${webPath }/toMobileLogin" class="weui-tabbar__item">
    <div class="weui-tabbar__icon foot-menu-member"></div>
    <p class="weui-tabbar__label">我的</p>
  </a>
  </c:if>
  <c:if test="${loginUser!=null }">
  	<a href="${webPath }/toUserCenter" class="weui-tabbar__item">
    <div class="weui-tabbar__icon foot-menu-member"></div>
    <p class="weui-tabbar__label">我的</p>
  </a>
  </c:if>
</div>

</body>
</html>

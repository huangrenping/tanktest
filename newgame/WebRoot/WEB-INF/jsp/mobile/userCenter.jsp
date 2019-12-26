<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsMobilePage.jsp"></jsp:include>
<html>
<head>
<title>会员中心</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.
">
<script src="${webPath}/mobile/pageJs/userCenter.js"></script>
</head>
<body ontouchstart>
<!--主体-->
<div class='weui-content'>
  <div class="wy-center-top">
    <div class="weui-media-box weui-media-box_appmsg"   style="margin: 0 auto;width: 220px;">
      <div class="weui-media-box__hd"><img class="weui-media-box__thumb radius" src="${webPath}/mobile/upload/headimg.jpg" alt="" style="margin-left:43px;"> </div>
      <div class="weui-media-box__bd" >
        <h4 class="weui-media-box__title user-name" style=" color: black; margin-left: 35px;">${loginUser.username }</h4>
        <p class="user-grade weui-media-box__title " style="color:black; margin-left: 35px;">${loginUser.userLevel.name }</p>
      </div>
    </div>
  </div>
  <div class="weui-panel weui-panel_access">
    <div class="weui-panel__hd">
      <a href="${webPath }/toLookOrders" class="weui-cell weui-cell_access center-alloder">
        <div class="weui-cell__bd wy-cell">
          <div class="weui-cell__hd"><img src="${webPath}/mobile/images/center-icon-order-all.png" alt="" class="center-list-icon"></div>
          <div class="weui-cell__bd weui-cell_primary"><p class="center-list-txt">全部订单</p></div>
        </div>
        <span class="weui-cell__ft"></span>
      </a>   
    </div>
    
    <div class="weui-panel__bd">
      <div class="weui-flex">
        <div class="weui-flex__item">
          <a href="${webPath }/toLookOrders?state=1" class="center-ordersModule">
            <span class="weui-badge" style="position: absolute;top:5px;right:10px; font-size:10px;display: none;" id="orderNum1"></span>
            <div class="imgicon"><img src="${webPath}/mobile/images/center-icon-order-dfk.png" /></div>
            <div class="name">待付款</div>
          </a>
        </div>
        <div class="weui-flex__item">
          <a href="${webPath }/toLookOrders?state=2" class="center-ordersModule">
            <span class="weui-badge" style="position: absolute;top:5px;right:10px; font-size:10px;display: none;" id="orderNum2"></span>
            <div class="imgicon"><img src="${webPath}/mobile/images/center-icon-order-dfh.png" /></div>
            <div class="name">待发货</div>
          </a>
        </div>
        <div class="weui-flex__item">
          <a href="${webPath }/toLookOrders?state=3" class="center-ordersModule">
          <span class="weui-badge" style="position: absolute;top:5px;right:10px; font-size:10px;display: none;" id="orderNum3"></span>
            <div class="imgicon"><img src="${webPath}/mobile/images/center-icon-order-dsh.png" /></div>
            <div class="name">待收货</div>
          </a>
        </div>
        <div class="weui-flex__item">
          <a href="${webPath }/toLookOrders?state=4" class="center-ordersModule">
            <span class="weui-badge" style="position: absolute;top:5px;right:10px; font-size:10px;display: none;" id="orderNum4"></span>
            <div class="imgicon"><img src="${webPath}/mobile/images/center-icon-order-dpj.png" /></div>
            <div class="name">待评价</div>
          </a>
        </div>
          <div class="weui-flex__item">
          <a href="${webPath }/toLookOrders?state=5" class="center-ordersModule">
            <span class="weui-badge" style="position: absolute;top:5px;right:10px; font-size:10px;display: none;" id="orderNum5"></span>
            <div class="imgicon"><img src="${webPath}/mobile/images/center-icon-order-mmm.png" /></div>
            <div class="name">已评价</div>
          </a>
        </div>
        
      </div>
    </div>
    
    
  </div>
  
  <div class="weui-panel">
        <div class="weui-panel__bd">
          <div class="weui-media-box weui-media-box_small-appmsg">
            <div class="weui-cells">
              <a class="weui-cell weui-cell_access" href="${webPath }/news/showMoreNewsList">
                <div class="weui-cell__hd"><img src="${webPath}/mobile/images/center-icon-sc.png" alt="" class="center-list-icon"></div>
                <div class="weui-cell__bd weui-cell_primary">
                  <p class="center-list-txt">新闻列表</p>
                </div>
                <span class="weui-cell__ft"></span>
              </a>
              <a class="weui-cell weui-cell_access" href="${webPath }/toAddressList">
                <div class="weui-cell__hd"><img src="${webPath}/mobile/images/center-icon-dz.png" alt="" class="center-list-icon"></div>
                <div class="weui-cell__bd weui-cell_primary">
                  <p class="center-list-txt">地址管理</p>
                </div>
                <span class="weui-cell__ft"></span>
              </a>
              <a class="weui-cell weui-cell_access" href="${webPath }/toEditPwd">
                <div class="weui-cell__hd"><img src="${webPath}/mobile/images/center-icon-dlmm.png" alt="" class="center-list-icon"></div>
                <div class="weui-cell__bd weui-cell_primary">
                  <p class="center-list-txt">密码修改</p>
                </div>
                <span class="weui-cell__ft"></span>
              </a>
              <a class="weui-cell weui-cell_access" href="${webPath }/toExitApp">
                <div class="weui-cell__hd"><img src="${webPath}/mobile/images/center-icon-out.png" alt="" class="center-list-icon"></div>
                <div class="weui-cell__bd weui-cell_primary">
                  <p class="center-list-txt">退出账号</p>
                </div>
                <span class="weui-cell__ft"></span>
              </a>
            </div>
          </div>
        </div>
      </div>
  
  
  
</div>

<!--底部导航-->
<div class="foot-black"></div>
<div class="weui-tabbar wy-foot-menu">
  <a href="${webPath }/mobile" class="weui-tabbar__item">
    <div class="weui-tabbar__icon foot-menu-home"></div>
    <p class="weui-tabbar__label">首页</p>
  </a>
  <a href="${webPath }/toClassify" class="weui-tabbar__item">
    <div class="weui-tabbar__icon foot-menu-list"></div>
    <p class="weui-tabbar__label">分类</p>
  </a>
  <a href="${webPath}/shopCat/toCatByUid" class="weui-tabbar__item">
     <span class="weui-badge" style="position: absolute;top: -.4em;right: 1em;display: none;" id="shopCat"></span>
    <div class="weui-tabbar__icon foot-menu-cart"></div>
    <p class="weui-tabbar__label">购物车</p>
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
<script>
  $(function() {
    FastClick.attach(document.body);
  });
</script> 

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsMobilePage.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">
<head>
<title>商城首页</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.
">
<link rel="stylesheet" href="${webPath}/mobile/css/hpshop.css">
</head>
<body ontouchstart>
<!--顶部搜索-->
<header class='weui-header'>
  <div class="weui-search-bar" id="searchBar">
    <form class="weui-search-bar__form">
     	<input type="hidden" name="flag" value="3">
      <div class="weui-search-bar__box">
        <i class="weui-icon-search"></i>
        <input type="search" class="weui-search-bar__input" id="searchInput" placeholder="搜索您想要的商品" required>
        <a href="javascript:" class="weui-icon-clear" id="searchClear"></a>
      </div>
      <label class="weui-search-bar__label" id="searchText" style="transform-origin: 0px 0px 0px; opacity: 1; transform: scale(1, 1);">
        <i class="weui-icon-search"></i>
        <span>搜索您想要的商品</span>
      </label>
    </form>
    <a href="javascript:" class="weui-search-bar__cancel-btn" id="searchCancel">取消</a>
  </div>
</header>
<!--主体-->
<div class='weui-content'>
  <!--顶部轮播-->
  <div class="swiper-container swiper-banner">
    <div class="swiper-wrapper"></div> 
    <div class="swiper-pagination"></div>
  </div>
  <!--图标分类-->
  <div class="weui-flex wy-iconlist-box">
    <div class="weui-flex__item"><a href="${webPath }/goods/showMoreGoodsList?flag=1-1" class="wy-links-iconlist"><div class="img"><img src="${webPath}/mobile/images/menu/1.png"></div><p>销量卖出</p></a></div>
    <div class="weui-flex__item"><a href="${webPath }/goods/showMoreGoodsList?flag=2" class="wy-links-iconlist"><div class="img"><img src="${webPath}/mobile/images/menu/2.png"></div><p>人气收藏</p></a></div>
    <div class="weui-flex__item"><a href="" class="wy-links-iconlist"><div class="img"><img src="${webPath}/mobile/images/menu/5.png"></div><p>限时秒杀</p></a></div>
    <div class="weui-flex__item"><a href="${webPath }/toLookOrders" class="wy-links-iconlist"><div class="img"><img src="${webPath}/mobile/images/menu/4.png"></div><p>订单管理</p></a></div>
  </div>
  <!--新闻切换-->
  <div class="wy-ind-news">
    <i class="news-icon-laba"></i>
    <div class="swiper-container swiper-news">
      <div class="swiper-wrapper"></div> 
      <div class="swiper-pagination"></div>
    </div>
    <a href="${webPath }/news/showMoreNewsList" class="newsmore"><i class="news-icon-more"></i></a>
  </div>
  <!--销量卖出-->
  <div class="wy-Module">
    <div class="wy-Module-tit"><span>销量卖出</span></div>
    <div class="wy-Module-con">
      <div class="swiper-container swiper-xlmc" style="padding-top:34px;"> 
        <div class="swiper-wrapper">
        </div>
        <div class="swiper-pagination jingxuan-pagination"></div>
      </div>
    </div>
  </div>
  
    <!--人气收藏-->
  <div class="wy-Module">
    <div class="wy-Module-tit"><span>人气收藏</span></div>
    <div class="wy-Module-con">
      <div class="swiper-container swiper-rqsc" style="padding-top:34px;">
        <div class="swiper-wrapper"></div> 
        <div class="swiper-pagination jingxuan-pagination"></div>
      </div>
    </div>
  </div>
  
  <!--为你推荐-->
  <div class="wy-Module">
    <div class="wy-Module-tit-line"><span>为你推荐</span></div>
    <div class="wy-Module-con">
      <ul class="wy-pro-list clear" id=wntj-goods>
       <%--  <li>
          <a href="pro_info.html">
            <div class="proimg"><img src="${webPath}/mobile/images/wntj/1.jpg"></div>
            <div class="protxt">
              <div class="name"> 春装2017新款女装韩版长袖衬衫女修身显瘦上衣蝴蝶结收腰衬衣 </div>
              <div class="wy-pro-pri">¥<span>296.00</span></div>
            </div>
          </a>
        </li> --%>
      </ul>
      <div class="morelinks"><a href="${webPath }/goods/showMoreGoodsList?flag=3">查看更多 >></a></div>
    </div>
  </div>
</div>

<!--底部导航-->
<div class="foot-black"></div>
<div class="weui-tabbar wy-foot-menu">
  <a href="${webPath }/mobile" class="weui-tabbar__item weui-bar__item--on">
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
<script src="${webPath }/mobile/pageJs/index.js"></script>
</body>
</html>

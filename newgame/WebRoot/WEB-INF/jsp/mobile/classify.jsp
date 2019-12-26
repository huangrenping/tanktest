<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsMobilePage.jsp"></jsp:include>
<html >
<head>
<title>商城分类</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.
">
<link rel="stylesheet" href="${webPath}/mobile/css/hpshop.css">	
</head>
<body ontouchstart>
<!--顶部搜索-->
<!--主体-->
	 
<div class="wy-content">
  <div class="category-top">
    <header class='weui-header'>
  <div class="weui-search-bar" id="searchBar">
  <div class="wy-header-icon-back" > <span></span></div>
    <form class="weui-search-bar__form">
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
  </div>
  <aside>
    <div class="menu-left scrollbar-none" id="sidebar">
      <ul>
<!--         <li class="active">新品女装</li>
        <li>品牌男装</li> -->
      </ul>
    </div>
  </aside>
  <section class="menu-right padding-all j-content">
    <h5 id="classifyName">新品男装</h5>
    <ul id="content">

    </ul>
  </section>
</div>
<!--底部导航-->
<div class="foot-black"></div>
<div class="weui-tabbar wy-foot-menu">
  <a href="${webPath }/mobile" class="weui-tabbar__item ">
    <div class="weui-tabbar__icon foot-menu-home"></div>
    <p class="weui-tabbar__label">首页</p>
  </a>
  <a href="${webPath }/toClassify" class="weui-tabbar__item weui-bar__item--on">
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
<script src="${webPath}/mobile/pageJs/classify.js"></script>
</body>
</html>
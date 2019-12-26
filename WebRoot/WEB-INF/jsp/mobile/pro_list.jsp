<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsMobilePage.jsp"></jsp:include>
<html>
<head>
<title>产品列表</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.
">
<link rel="stylesheet" href="${webPath}/mobile/css/hpshop.css">

<style type="text/css">
	.myheader{
		background-color: #F5F5F5;
	}
	.myheader1{
		background-color: #ffffff;
	}
</style>
</head>
<body ontouchstart>
<script>
	var webPath="${webPath}";
</script>


<!--顶部搜索-->
<header class='weui-header fixed-top'>
  <div class="weui-search-bar" id="searchBar">
  	  <div class="wy-header-icon-back" > <span></span></div>
    <form class="weui-search-bar__form" method="post">
    	<input type="hidden" name="flag" id="flag" value="${flag}" >
    	<input type="hidden" name="smail_id" id="sid" value="${sid }">
    	<input type="hidden" id="sname" value="${sname }"/>
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
  <div class="pro-sort">
    <div class="weui-flex">
      <div class="weui-flex__item myheader1" id="id_desc" ><div  class="placeholder NormalCss myfontcolor" id="id_desc_class">综合</div></div>
      <div class="weui-flex__item myheader1"  id="collectionNum"><div  class="placeholder SortAscCss myfontcolor">人气</div></div>
      <div class="weui-flex__item myheader1" id="saleNum"><div  class="placeholder SortAscCss myfontcolor">销量</div></div>
      <div class="weui-flex__item myheader1" id="price"><div class="placeholder SortAscCss myfontcolor">价格</i></div></div>
    </div>
    
  </div>
</header>
<!--主体-->
<div class="weui-content" style="padding-top:85px;" id="loadfrom">
  <!--产品列表--滑动加载-->
  <div class="weui-pull-to-refresh__layer">
    <div class='weui-pull-to-refresh__arrow'></div>
    <div class='weui-pull-to-refresh__preloader'></div>
    <div class="down">下拉刷新</div>
    <div class="up">释放刷新</div>
    <div class="refresh">正在刷新</div>
  </div>
  <div id="list" class='demos-content-padded proListWrap'>
    

  </div>
  <div class="weui-loadmore" id="loadlist">
    <i class="weui-loading"></i>
    <span class="weui-loadmore__tips">正在加载</span>
  </div>
 	<div class="weui-loadmore__tips" style="height:45px;width:100%;color:#F5F5F5;text-align: center;display: none;" id="notfoundList">
 		<span style="color:#45454A;position: relative;bottom: -20px;">没有更多数据</span>
 	</div>
  
</div>
<script type="text/javascript" src="${webPath }/mobile/pageJs/pro_list.js"></script>
</body>
</html>

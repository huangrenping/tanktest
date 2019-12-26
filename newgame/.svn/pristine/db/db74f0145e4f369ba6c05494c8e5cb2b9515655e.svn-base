<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsMobilePage.jsp"></jsp:include>
<html>
<head>
<title>新闻列表</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.">
</head>
<body ontouchstart>
<!--主体-->
<header class="wy-header">
  <div class="wy-header-icon-back"><span></span></div>
  <div class="wy-header-title">新闻列表</div>
</header>
<div class="weui-content">
  <div class="weui-cells wy-news-list">
  
  	<c:forEach items="${newsList }" var="news">
  			<a class="weui-cell weui-cell_access" href="${webPath }/showDetail/${news.id }">
			      <div class="weui-cell__bd">
			        <p>${news.title }</p>
			      </div>
			      <div class="weui-cell__ft"></div>
    		 </a>
  	</c:forEach>
  </div>
</div>
<script type="text/javascript">
$(function() {
    FastClick.attach(document.body);
             $(".wy-header-icon-back").click(function(){
     	window.history.back();
     }); 
  });
</script>

</body>
</html>

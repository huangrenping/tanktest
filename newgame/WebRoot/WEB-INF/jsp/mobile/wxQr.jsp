<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsMobilePage.jsp"></jsp:include>
<html>
<head>
<title>编辑地址</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.
">
</head>
<body ontouchstart>
<!--主体-->
<header class="wy-header">
  <div class="wy-header-icon-back"><span></span></div>
  <div class="wy-header-title">微信扫码支付</div>
</header>
<div align="center"  style="margin-top: 50px;">
	 <img src="${webPath}/mobile/upload/wxQr.png" />
</div>
<div class="mg10-0 t-c">金额：<span class="wy-pro-pri mg-tb-5">¥<em class="num font-20">296.00</em></span></div>


<script>
  $(function() {
    FastClick.attach(document.body);
         $(".wy-header-icon-back").click(function(){
     	window.history.back();
     });
  });
</script>
<script src="${webPath}/mobile/js/city-picker.js"></script>
</body>
</html>

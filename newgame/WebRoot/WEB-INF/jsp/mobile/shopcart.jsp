<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsMobilePage.jsp"></jsp:include>

<html>
<head>
<title>购物车</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.
">
<script type="text/javascript" src="${webPath}/mobile/fly/jquery.fly.min.js"></script>
<script type="text/javascript" src="${webPath}/mobile/fly/requestAnimationFrame.js"></script>
<script src="${webPath}/mobile/pageJs/shopcat.js"></script>
</head>
<body ontouchstart>

<!--主体-->
<header class="wy-header" >
  <div class="wy-header-icon-back"><span></span></div>
  <div class="wy-header-title">购物车</div>
  <input type="hidden" value="${loginUser.id}" id="uid">
</header>
<div class="weui-content" id="div1">
  
 
</div>
<!--底部导航-->
<div class="foot-black"></div>
<div class="weui-tabbar wy-foot-menu">
  <div class="npd cart-foot-check-item weui-cells_checkbox allselect">
    <label class="weui-cell allsec-well weui-check__label" for="all">
        <div class="weui-cell__hd">
          <input type="checkbox" class="weui-check" name="all-sec" id="all">
          <i class="weui-icon-checked"></i>
        </div>
        <div class="weui-cell__bd">
          <p class="font-14">全选</p>
        </div>
    </label>
  </div>
  <div class="weui-tabbar__item  npd">
    <p class="cart-total-txt">合计：<i>￥</i><em class="num font-16" id="priceshop">0</em></p>
  </div>
   <a href="#" class="red-color npd w-90 t-c" id="delete" style="background-color: blue;">
    	<p class="promotion-foot-menu-label">删除</p>
	</a>
  <a href="#" class="red-color npd w-90 t-c" id="balancef">
    <p class="promotion-foot-menu-label">去结算</p>
  </a>

</div>


<script>
  $(function() {
    FastClick.attach(document.body);
        $(".wy-header-icon-back").click(function(e){
     	   window.history.back();
     	   e.stopPropagation();
           });
  });
</script>
<script type="text/javascript">
$(function(){
	$(".Spinner").Spinner({value:1, len:3, max:999});
});
</script>
<script src="${webPath}/mobile/js/jquery-weui.js"></script>
<!---全选按钮-->

<script type="text/javascript">
$(document).ready(function () {      
	$(".allselect").click(function () {
		if($(this).find("input[name=all-sec]").prop("checked")){
			$("input[name=cartpro]").each(function () {
				$(this).prop("checked", true);
			});
		
		}
		else
   		{
			$("input[name=cartpro]").each(function () {
				if ($(this).prop("checked")) {
					$(this).prop("checked", false);
				} else {
					$(this).prop("checked", true);
				} 
			});
    
   		}
		
	});

});
</script>
<script>
      $(document).on("click", ".wy-dele", function() {
        $.confirm("您确定要把此商品从购物车删除吗?", "确认删除?", function() {
          $.toast("商品已经删除!");
        }, function() {
          //取消操作
        });
      });

    </script>

</body>
</html>

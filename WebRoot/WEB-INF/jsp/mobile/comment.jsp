<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsMobilePage.jsp"></jsp:include>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>发表评价</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.">


<link rel="stylesheet" href="${webPath}/mobile/css/hpshop.css">
<link rel="stylesheet" href="${webPath}/hpUpload/css/hpUpload.css">
<link rel="stylesheet" href="${webPath}/assets/js/amazeui.datetimepicker-se.min.css">

<script type="text/javascript" src="${webPath}/js/layer.js"></script>

<script type="text/javascript" src="${webPath}/assets/js/moment-with-locales.min.js"></script>
<script type="text/javascript" src="${webPath}/assets/js/amazeui.datetimepicker-se.js"></script>
<script type="text/javascript" src="${webPath}/assets/js/moment.min.js"></script>
<script type="text/javascript" src="${webPath}/hpUpload/hpUpload.js"></script>
<script type="text/javascript" src="${webPath}/assets/js/common.js"></script>

<script type="text/javascript" src="${webPath}/mobile/pageJs/comment.js"></script>
</head>
<body ontouchstart>
<!--主体-->
<header class="wy-header">
  <div class="wy-header-icon-back" style="margin-left: 5px; margin-top: 6px; float: left"><span></span></div>
  <div class="wy-header-title">发表评价</div>
</header>
<div class="weui-content clear">

 <c:forEach var="item" items="${list}">
 <div class="mycomment">
   

     <div class="weui-media-box_appmsg ord-pro-list">
        <div class="weui-media-box__hd"><a href="pro_info.html"><img class="weui-media-box__thumb" src="${webPath}/${item.goodsImg}" alt=""></a></div>
        <div class="weui-media-box__bd">
          <h1 class="weui-media-box__desc"><a href="pro_info.html" class="ord-pro-link">${item.title}</a></h1>
          <p class="weui-media-box__desc" goodsId="${item.goodsId}">${item.specificationsInfo }</p>
          <div class="clear mg-t-10">
            <div class="wy-pro-pri fl">¥<em class="num font-15">${item.countMoney}</em></div>
            <div class="pro-amount fr"><span class="font-13">数量×<em class="name">${item.num}</em></span></div>
          </div>
        </div>
      </div>
     
  <div class="order-list-Below clear">
    <h1>商品评价</h1>
    <ul>
      <li class="on"></li>
      <li class="on"></li>
      <li class="on"></li>
      <li class="on"></li>
      <li class="on"></li>
    </ul>
  </div>
  <div class="weui-cells weui-cells_form com-txt-area">
    <div class="weui-cell">
      <div class="weui-cell__bd">
        <textarea id="mark"  class="weui-textarea txt-area" placeholder="这个商品满足你的期待吗？说说你的使用心得，分享给想买的他们吧" rows="3"></textarea>
        <div class="weui-textarea-counter font-12 num"><span>0</span>/200</div>
      </div>
    </div>
  </div>
  <div class="weui-cells weui-cells_checkbox commg">
    <label class="weui-cell weui-check__label" for="s11">
      <div class="weui-cell__hd">
        <input type="checkbox" class="weui-check" name="checkbox1" id="s11" checked="checked">
        <i class="weui-icon-checked"></i>
      </div>
      <div class="weui-cell__bd"><p>匿名评价</p></div>
    </label>
  </div>
  <div class="weui-cells weui-cells_form">
      <div class="weui-cell">
        <div class="weui-cell__bd">
          <div class="weui-uploader">
            <div class="weui-uploader__hd">
              <p class="weui-uploader__title font-14">图片上传</p>
              <div class="weui-uploader__info font-12">0/2</div>
            </div>
            <div  class="weui-uploader__bd">
              <ul class="weui-uploader__files" id="uploaderFiles">
              </ul>
               <div class="weui-uploader__input-box">
                <input id="kdUploadSelect" class="weui-uploader__input"  type="button" accept="image/*" >
              </div>
            </div>
          </div>
        </div>
      </div>
  </div>
  </div>
  <input type="hidden" value="${item.orderInfoId }" id="orderInfoId">
  </c:forEach>

  <div class="com-button"><a href="javascript:void(0);" id="btn">发表评价</a></div>
</div>

<script>
  $(function() {
    FastClick.attach(document.body);
             $(".wy-header-icon-back").click(function(){
     	window.history.back();
     });
  });
  
//初始化hpUpload上传组件
	$.hpUpload("${webPath}/comment/uploadFile", {
		"path" : "tzwx/comment"
	}, function(imgPath) {
		console.log(imgPath);
		var $img='';
	$.each(imgPath,function(index,img){
		console.log(img);
		$img += '<li class="weui-uploader__file"><img class="upload-img"  class="am-circle" xxx="'+img+'" src="${webPath}/'+img+'" /></li>';
	});	
	$("#uploaderFiles").append($img);
	$('#flagimgurl').val(imgPath);
	},true);
	
</script>





</body>
</html>

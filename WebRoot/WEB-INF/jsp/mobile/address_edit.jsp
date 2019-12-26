<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsMobilePage.jsp"></jsp:include>
<!DOCTYPE html>
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
  <div class="wy-header-title">编辑地址</div>
</header>
<form method="post" id="addressForm">
<input type="hidden" name="userId" id="uid" value="${loginUser.id}">
<input type="hidden" name="id" id="id" value="${rd.id }">
<div class="weui-content">
  <div class="weui-cells weui-cells_form wy-address-edit">
    <div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label wy-lab">收货人</label></div>
      <div class="weui-cell__bd"><input class="weui-input" type="text"  name="receivePersonName"  value="${rd.receivePersonName }"  pattern="[0-9]*" placeholder="请填写收货人"></div> 
    </div>
    <div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label wy-lab">手机号</label></div>
      <div class="weui-cell__bd"><input class="weui-input" type="text"  name="receivePersonPhone" value="${rd.receivePersonPhone }" pattern="[0-9]*" placeholder="请填写手机号"></div>
    </div>

    <div class="weui-cell">
      <div class="weui-cell__hd"><label for="name" class="weui-label wy-lab">所在地区</label></div>
          <div class="weui-cell__bd">
    	  <input class="weui-input" id="address" type="text" name="detailAddress" value="${pca}">
    </div>
      
    </div>
    <div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label wy-lab">详细地址</label></div>
      <div class="weui-cell__bd" style="margin-top: 15px;">
        <textarea class="weui-textarea" placeholder="请填写详细地址" name="address">${rd.address }</textarea>
      </div>
    </div>
    <div class="weui-cell weui-cell_switch">
      <div class="weui-cell__bd">设为默认地址</div>
      <div class="weui-cell__ft"><input class="weui-switch" name="isDefault2" id="isDefaultCheck" type="checkbox"></div>
      <input type="hidden" name="isDefault" id="isDefault"  value="0">
    </div>
  </div> 
  <div class="weui-btn-area">
    <a class="weui-btn weui-btn_primary" href="javascript:" id="showTooltips" >保存此地址</a>
    <c:if test="${rd.id!=null }">
    	<a href="javascript:;" class="weui-btn weui-btn_warn"  id="delbtu">删除此地址</a>
    </c:if>
  </div>
</div>
</form>
<script src="${webPath}/mobile/js/city-picker.js"></script>
<script src="${webPath}/mobile/pageJs/address_edit.js"></script>
</body>
</html>
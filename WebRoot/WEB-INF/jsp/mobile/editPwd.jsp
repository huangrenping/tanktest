<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsMobilePage.jsp"></jsp:include>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>密码修改</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.">
<script type="text/javascript" src="${webPath}/mobile/pageJs/editPwd.js"></script>
<script type="text/javascript" src="${webPath}/js/layer.js"></script>
</head>
<body ontouchstart>
<!--主体-->
<header class="wy-header">
  <div class="wy-header-icon-back"><span></span></div>
  <div class="wy-header-title">密码修改</div>
</header>
<div class="weui-content">
  <div class="weui-cells cardlist">
<div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label wy-lab">旧密码</label></div>
      <div class="weui-cell__bd"><input class="weui-input" type="password" id="oldpassword"  placeholder="请输入旧密码"></div>
      <div class="weui-cell__bd"><input class="weui-input" style="display: none;color: red;" readonly="readonly" value="" id="jieguo"  ></div>

      		<div class="weui-cell__bd"><input class="weui-input" type="hidden" name="loginpwd" id="loginpwd" value="${loginUser.loginpwd }"  ></div>
      		<div class="weui-cell__bd"><input class="weui-input" type="hidden" name="loginname" id="loginname" value="${loginUser.loginname }"  ></div>
      
    </div>
<div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label wy-lab">新密码</label></div>
      <div class="weui-cell__bd"><input class="weui-input" type="password" id="password2"  placeholder="请输入新密码"></div>
    </div>
<div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label wy-lab">确认密码</label></div>
      <div class="weui-cell__bd"><input class="weui-input" type="password" id="password3"  placeholder="请确认新密码"></div>
    </div>
  </div>
         <div class="mg10-0"><a id="payBtn" href="javascript:;" class="weui-btn weui-btn_primary" style="background-color: #EA869A;">确认修改</a></div>
</div>
<script>
  $(function() {
  	     $(".wy-header-icon-back").click(function(){
     	window.history.back();
     });
  });
</script>
</body>
</html>
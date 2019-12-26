<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsMobilePage.jsp"></jsp:include>
<html>
<head>
<title>手机注册</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.
">
<script type="text/javascript" src="${webPath}/mobile/pageJs/regist.js"></script>
<script type="text/javascript" src="${webPath}/js/layer.js"></script>


</head>
<body ontouchstart>
<!--主体-->
<header class="wy-header">
  <div class="wy-header-icon-back"><span></span></div>
  <div class="wy-header-title">用户注册</div>
</header>
<div class="weui-content">
  <div class="weui-cells weui-cells_form wy-address-edit">
    <div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label wy-lab">邮箱</label></div>
      <div class="weui-cell__bd"><input class="weui-input" type="text" id="email" placeholder="请输入邮箱"></div>
         <div class="weui-cell__bd"><input class="weui-input" style="display: none;color: red;" value="" id="isemail"  ></div>
    </div>
    <div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label wy-lab">用户名</label></div>
      <div class="weui-cell__bd"><input class="weui-input" type="text"  id="username" placeholder="请输入用户名"></div>
      <div class="weui-cell__bd"><input class="weui-input" style="display: none;color: red;" value="" id="ischunzai"  ></div>
    </div>
    <div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label wy-lab">用户昵称</label></div>
      <div class="weui-cell__bd"><input class="weui-input" type="text"  id="username2" placeholder="请输入用户昵称"></div>
    </div>
    <div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label wy-lab">设置密码</label></div>
      <div class="weui-cell__bd"><input class="weui-input" type="password"  id="userpwd" placeholder="请输入新密码"></div>
    </div>
    <div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label wy-lab">确认密码</label></div>
      <div class="weui-cell__bd"><input class="weui-input" type="password"  id="userpwd2" placeholder="请再次输入新密码"></div>
    </div>
  </div>
  <label for="weuiAgree" class="weui-agree">
    <input id="weuiAgree" type="checkbox" class="weui-agree__checkbox" checked="checked">
    <span class="weui-agree__text">阅读并同意<a href="javascript:void(0);">《注册协议》</a></span>
  </label>
  <div class="weui-btn-area"><a href="javascript:;" class="weui-btn weui-btn_warn" id="zhuce">注册并登陆</a></div>
  <div class="weui-cells__tips t-c font-12">登陆账号为您输入的手机号码</div>
  <div class="weui-cells__tips t-c pd-10"><a href="xieyi.html" class="weui-cell_link font-12">查看注册协议</a></div>
  
</div>


<script>
  $(function() {
    FastClick.attach(document.body);
     $(".wy-header-icon-back").click(function(){
     	window.history.back();
     });
  });
</script>

</body>
</html>

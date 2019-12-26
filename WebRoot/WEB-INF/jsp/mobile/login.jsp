<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsMobilePage.jsp"></jsp:include>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>登陆</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.
">

<link rel="stylesheet" href="${webPath}/mobile/css/hpshop.css">
<link rel="stylesheet" href="${webPath}/hpUpload/css/hpUpload.css">
<link rel="stylesheet" href="${webPath}/assets/js/amazeui.datetimepicker-se.min.css">


<script type="text/javascript" src="${webPath}/assets/js/moment-with-locales.min.js"></script>
<script type="text/javascript" src="${webPath}/assets/js/amazeui.datetimepicker-se.js"></script>
<script type="text/javascript" src="${webPath}/assets/js/moment.min.js"></script>
<script type="text/javascript" src="${webPath}/assets/js/common.js"></script>


<script type="text/javascript" src="${webPath}/js/layer.js"></script>
</head>
<body ontouchstart style="background:#323542;">
<!--主体-->
<div class="wy-header-icon-back"><span></span></div>
<div class="login-box">
<input type="hidden" value="${preurl}" id="preurl">
  	<div style="width: 80px;margin: 0 auto;margin-top: 10px;">
    <img class="radius" style="width:80px;height: 80px;" src="${webPath}/mobile/upload/person_head.jpg" alt="">		 
  	</div>
    <div class="login-form">
    	<form action="#" id="myform">
        	<div class="login-user-name common-div">
            	<span class="eamil-icon common-icon">
                	<img src="${webPath}/mobile/images/eamil.png" />
                </span>
                <input type="email" name="username" id="loginName" value="" placeholder="请输入您的手机号" />        
            </div>
            <div class="login-user-pasw common-div">
            	<span class="pasw-icon common-icon">
                	<img src="${webPath}/mobile/images/password.png" />
                </span>
                <input type="password" name="password" id="loginPwd" value="" placeholder="请输入您的密码" />        
            </div>
            <a href="javascript:;" class="login-btn common-div" id="mybut">登陆</a>
            <a href="javascript:;" class="login-oth-btn common-div">微信登陆</a>
        </form>
    </div>
    <div class="forgets">
    	<a href="psd_chage.html">忘记密码？</a>
        <a href="${webPath }/toRegist">免费注册</a>
    </div>
    
    <div style="width: 180px;margin: 0 auto;margin-top: 50px;">
    	<img src="${webPath}/mobile/upload/logo2.png" />
    </div>
    
</div>
<script>
  $(function() {
  	     $(".wy-header-icon-back").click(function(){
     	   window.history.back();
           });
  });
</script>
<script type="text/javascript" src="${webPath}/mobile/pageJs/login.js"></script>

</body>
</html>

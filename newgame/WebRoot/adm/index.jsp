<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
String type=request.getParameter("type");
String serveruid=request.getParameter("serveruid");
String action=request.getParameter("action");
String sign=request.getParameter("sign");
%>



<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-title" content="Amaze UI" />
   
    <title>欢迎登入坦克后台</title>
    <link rel="icon" type="image/png" href="<%=path %>/assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="<%=path %>/assets/i/app-icon72x72@2x.png">
    <link rel="stylesheet" href="<%=path %>/assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="<%=path %>/assets/css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="<%=path %>/assets/css/app.css">
    <script src="<%=path %>/assets/js/jquery.min.js"></script>
	<script src="<%=path %>/assets/js/amazeui.min.js"></script>
    <script src="<%=path %>/assets/js/app.js"></script>
    <%
	    	String error=request.getParameter("error");
	    	if(error!=null){
	    		request.setAttribute("mrgss", "账号或密码错误");
	    	}
     %>
    <script language="javascript" type="text/javascript">
    layui.define(['form','layer','laypage','laydate'], function(exports){
	var $ = layui.jquery, 
	form = layui.form(),
	layer = layui.layer,
	laypage = layui.laypage;
	});
    	function checkUser(){
		   var loginName = document.getElementById("loginName").value;
		   var loginPwd = document.getElementById("loginPwd").value;
		   if(loginName == ""  ){
		     layer.msg("用户名不能为空");
		     return false;
		   }else if(loginPwd == ""  ){
		    layer.msg("密码不能为空");
		     return false;
		   }else{
		   return true;
		   }
		}
    </script>

</head>

<body data-type="login">
    <script src="<%=path %>/assets/js/theme.js"></script>
    <div class="am-g tpl-g">
         <!-- 风格切换 -->
        <div class="tpl-skiner">
            <div class="tpl-skiner-toggle am-icon-cog">
            </div>
            <div class="tpl-skiner-content">
                <div class="tpl-skiner-content-title">
                 		   选择主题
                </div>
                <div class="tpl-skiner-content-bar">
                    <span class="skiner-color skiner-white" data-color="theme-white"></span>
                    <span class="skiner-color skiner-black" data-color="theme-black"></span>
                </div>
            </div>
        </div>
        <div class="tpl-login">
            <div class="tpl-login-content">
                <div class="tpl-login-logo">

                </div>

               <form  action="<%=path %>/adm/login/login.jsp" class="am-form tpl-form-line-form" id="formid" method="post"> 
             	<%-- 	<form  action="<%=path %>/admin/login" class="am-form tpl-form-line-form" id="formid" method="post"> --%>
                    <div class="am-form-group">
                        <input type="text" class="tpl-form-input" id="loginName" name="loginName" placeholder="请输入账号">
                    </div>
                    <div class="am-form-group">
                        <input type="password" class="tpl-form-input" id="loginPwd" name="loginPwd" placeholder="请输入密码">
                    </div>
                    <div class="am-form-group tpl-login-remember-me">
                        <input id="remember-me" type="checkbox">
                        <label for="remember-me">
                        	记住密码
                         </label>
                    </div>
                    
                    <div id="mydiv" >
                    	<label for="remember-me" style="color: red;" >
                        	${mrgss }
                        	<!-- <input type=""> -->
                         </label>
                    </div>
                    
                    <div class="am-form-group">
                       <!--  <button type="button" onclick="return checkUser();" class="am-btn am-btn-primary  am-btn-block tpl-btn-bg-color-success  tpl-login-btn" id="mybtn">提交</button> -->
                        <button type="submit" onclick="return;" class="am-btn am-btn-primary  am-btn-block tpl-btn-bg-color-success  tpl-login-btn" id="mybtn">提交</button>
                    </div>
                </form>
            </div>
        </div>
    </div>


</body>

</html>
<%
%>
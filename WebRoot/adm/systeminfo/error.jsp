<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="<%=path %>/assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="<%=path %>/assets/i/app-icon72x72@2x.png">
    <link rel="stylesheet" href="<%=path %>/assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="<%=path %>/assets/css/amazeui.datetimepicker.css" />
    <link rel="stylesheet" href="<%=path %>/assets/css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="<%=path %>/assets/css/app.css">
    <script src="<%=path %>/assets/js/jquery.min.js"></script>
    <script src="<%=path %>/assets/js/amazeui.min.js"></script>
    <script src="<%=path %>/assets/js/moment-with-locales.min.js"></script>
    
    <script src="<%=path %>/assets/js/app.js"></script>
    <script src="<%=path %>/assets/js/theme.js"></script>
    <script src="<%=path %>/assets/js/amazeui-pagination.js"></script>
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
      <script type="text/javascript">
		layui.define(['form','layer','laypage','laydate'], function(exports){
			var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;
			showmessage();
		});
		function showmessage(){
			layer.confirm('您的session过期，请重新登入!', {}, function(index){
			  	var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
           	  	//parent.location.reload();
           	  	//parent.location.href=webPath+'/adm/index.jsp';
           	  	top.location.href = webPath+'/adm/index.jsp';
           	  	//location.href = webPath+'/adm/index.jsp';
			});
		}
		//操作
</script>
</head>

<body class="theme-black">
        <!-- 内容区域 -->
    <script src="<%=path %>/assets/js/amazeui.datetimepicker.min.js"></script>
</body>

</html>
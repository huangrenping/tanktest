<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="web.webSocket.player.PlayerManager,
    java.util.*,
    web.webSocket.util.Util,
    web.webSocket.message.Messagepush,
    web.webSocket.activity.ActivityManager,
    web.webSocket.pojo.WgMain,
    web.webSocket.pojo.WgMain2,
    web.webSocket.pojo.WgActivity"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jstl/core_rt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>  
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="icon" type="image/png" href="<%=path %>/assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="<%=path %>/assets/i/app-icon72x72@2x.png">
    <link rel="stylesheet" href="<%=path %>/assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="<%=path %>/assets/css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="<%=path %>/assets/css/app.css">
    <link rel="stylesheet" href="<%=path %>/assets/css/amazeui.datetimepicker-se.min.css" />
    <script src="<%=path %>/assets/js/moment-with-locales.min.js"></script> 
    <!-- <script src="http://code.jquery.com/jquery-2.1.3.min.js"></script> -->
	<!-- <script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script> -->
	<script src="<%=path %>/assets/js/jquery.min.js"></script>
    <script src="<%=path %>/assets/js/amazeui.min.js"></script>
    <script src="<%=path %>/assets/js/app.js"></script>
    <script src="<%=path %>/assets/js/theme.js"></script>
    <script src="<%=path %>/assets/js/amazeui-pagination.js"></script>
		<%	
			List<Messagepush> listthree=(List<Messagepush>)session.getAttribute("listthree");
		 	int num=0;
		 	//检查账号是否有该权限
			for(Messagepush messagepush:listthree){
				if(messagepush.getType()==100801){
					num++;
					break;
				}
			}
			if(num<1){
				response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
				return ;
			}
			ActivityManager activityManager=ActivityManager.getInstance();
			String radio1=request.getParameter("radio1");
			WgMain2 wgMain2=activityManager.getWgMain2();
			if(radio1!=null && !radio1.equals("")){
			   if(wgMain2.getLoveshopping()==Integer.valueOf(radio1)){
			   }else{
				   wgMain2.setLoveshopping(Integer.valueOf(radio1));
				   activityManager.updatewgmain2(wgMain2);
			   }
			}
			int rechargeopen=wgMain2.getLoveshopping();
			request.setAttribute("radio1", rechargeopen);
		%>

<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
    <script type="text/javascript">
		layui.define(['form','layer','laypage','laydate'], function(exports){
		var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;
		}); 
		
		/* $(function() {
		    $('#datetimepicker1').datetimepicker()({ format: 'yyyy-mm-dd' });
		  });
		  
		  $(function() {
		    $('#datetimepicker2').datetimepicker()({ format: 'yyyy-mm-dd' });
		  }); */

	//表单校验
	function validate_form(thisform){
		$("#hp_form").submit();
		//parent.layer.msg("保存成功!");
		var index = parent.layer.getFrameIndex(window.name); //获取当前窗体索引
		parent.layer.close(index); //执行关闭  这两句的意思是关闭当前窗口
	}
	

</script>
</head>
<body class="theme-black">

	<!-- 内容区域 -->
	<form action="uploveshoppingopen.jsp" method="post" id="hp_form" name="hp_form" data-am-validator
							class="am-form tpl-form-line-form">
		<div class="theme-black">
				<div class="am-btn-group am-btn-group-xs" style="margin-top: 10px">
					<button id="saveBtn" type="submit" onclick="return validate_form(this);"
						class="am-btn am-btn-default am-btn-secondary">
						<span class="am-icon-save"></span> 保存
					</button>
				</div>
			</div>
			<div class="row">
				<div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
					<div class="widget am-cf">
					
	

							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">状态
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<s:if test="${radio1==0 }">
										<label class="am-radio">
							     	 <input type="radio" name="radio1" id="radio1" value="1" data-am-ucheck>
							      		开启
							    	</label>
							    	<label class="am-radio">
							     	 <input type="radio" name="radio1" id="radio1" value="0" data-am-ucheck checked="checked">
							      		关闭
							    	</label>
									</s:if>
									
									<s:if test="${radio1!=0 }">
										<label class="am-radio">
							     	 <input type="radio" name="radio1" id="radio1" value="1" data-am-ucheck checked="checked">
							      		开启
							    	</label>
							    	<label class="am-radio">
							     	 <input type="radio" name="radio1" id="radio1" value="0" data-am-ucheck >
							      		关闭
							    	</label>
									</s:if>
								</div>
							</div>							
				</div>							
						</form>
					</div>
				</div>
		</div>
		<script src="<%=path %>/assets/js/amazeui.datetimepicker-se.min.js"></script>
</body>
</html>
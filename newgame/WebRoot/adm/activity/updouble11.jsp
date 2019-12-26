<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="web.webSocket.player.PlayerManager,
    java.util.*,
    web.webSocket.util.Util,
    web.webSocket.message.Messagepush,
    web.webSocket.activity.ActivityManager,
    web.webSocket.pojo.WgMain,
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
				if(messagepush.getType()==101501){
					num++;
					break;
				}
			}
			if(num<1){
				response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
				return ;
			}
			String parameter=request.getParameter("parameter");
			//重置
			if(parameter!=null && !parameter.equals("")){
				if(parameter.equals("1")){
					ActivityManager.getInstance().resetsevenday();
					response.getWriter().write("<script>window.location.href='../activity/sevendays.jsp'</script>");
					//out.println("重置成功");
					return;
				}
				
			}
			ActivityManager activityManager=ActivityManager.getInstance();
			String datetimepicker1=request.getParameter("datetimepicker1");
			String datetimepicker2=request.getParameter("datetimepicker2");
			String radio1=request.getParameter("radio1");
			//String radio2=request.getParameter("radio2");
			if(datetimepicker1!=null && !datetimepicker1.equals("") &&
			   datetimepicker2!=null && !datetimepicker2.equals("") &&
			   radio1!=null && !radio1.equals("")){
			   long time1=Util.dateTimeStamp2(datetimepicker1, "yyyy-MM-dd");
			   long time2=Util.dateTimeStamp2(datetimepicker2, "yyyy-MM-dd");
			   String huodongstr2=activityManager.getHuodong();
			   String[] huodongstr3=huodongstr2.split(",");
			   for(int i=0; i<huodongstr3.length; i++){
			   		String[] huodongstr4=huodongstr3[i].split("@");
			   		if(Integer.valueOf(huodongstr4[0])==15){
			   			huodongstr3[i]="15@"+radio1+"@"+time1+"@"+time2+"@"+0;
			   			WgMain wgMain=activityManager.getWgMain();
			   			activityManager.upWgmainhuodong(Util.Join(huodongstr3, ","));
			   			break;
			   		}
			   }
			}
			String huodong=activityManager.getHuodong();
			String[] huodong2=huodong.split(",");
			for(int i=0; i<huodong2.length; i++){
				String[] huodong3=huodong2[i].split("@");
				if(Integer.valueOf(huodong3[0])==15){
					request.setAttribute("id", huodong3[0]);
					request.setAttribute("state", huodong3[1]);
					if(huodong3[2].equals("0")){
						request.setAttribute("startime", "");
					}else{
						request.setAttribute("startime", Util.getDate(Long.valueOf(huodong3[2]), 1));
					}
					if(huodong3[3].equals("0")){
						request.setAttribute("endtime", "");
					}else{
						request.setAttribute("endtime", Util.getDate(Long.valueOf(huodong3[3]), 1));
					}
					break;
				}
			}
	
		%>

<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
    <script type="text/javascript">
		layui.define(['form','layer','laypage','laydate'], function(exports){
		var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;

		}); 
		function send(){
			var datetimepicker1=document.getElementById("datetimepicker1").value;
			var datetimepicker2=document.getElementById("datetimepicker2").value;
			debugger;
			if(datetimepicker1.length<=0){
				layer.msg("开始时间不允许为空!");
				return false;
			}else if(datetimepicker2.length<=0){
				layer.msg("结束时间不允许为空!");
				return false;
			}else{
				document.getElementById("send").submit();
			}
		}
		/* $(function() {
		    $('#datetimepicker1').datetimepicker()({ format: 'yyyy-mm-dd' });
		  });
		  
		  $(function() {
		    $('#datetimepicker2').datetimepicker()({ format: 'yyyy-mm-dd' });
		  }); */

	//表单校验
	/* function validate_form(thisform){
		$("#hp_form").submit();
		//parent.layer.msg("保存成功!");
		var index = parent.layer.getFrameIndex(window.name); //获取当前窗体索引
		parent.layer.close(index); //执行关闭  这两句的意思是关闭当前窗口
	} */	

</script>
</head>
<body class="theme-black">

	<!-- 内容区域 -->
	<form id="send" action="updouble11.jsp" method="post" id="hp_form" name="hp_form" data-am-validator
							class="am-form tpl-form-line-form">
		<div class="theme-black">
				<div class="am-btn-group am-btn-group-xs" style="margin-top: 10px">
					<button id="saveBtn" type="button" onclick="send();"
						class="am-btn am-btn-default am-btn-secondary">
						<span class="am-icon-save"></span> 保存
					</button>
				</div>
			</div>
			<div class="row">
				<div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
					<div class="widget am-cf">
					
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">名称
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="双11" id="name" name="name" type="text"
										class="tpl-form-input" readonly="readonly">
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">开始时间
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<%-- <input value="${startime}" class="am-form-field" id='datetimepicker1' name='datetimepicker1'> --%>
									<input type="text" value="${startime}" id="datetimepicker1" name="datetimepicker1" class="am-form-field" placeholder="日历组件" data-am-datepicker readonly required />
								</div>
							</div>

							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">结束时间
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<%-- <input value="${endtime}" class="am-form-field" id='datetimepicker2' name='datetimepicker2'> --%>
									<input type="text" value="${endtime}" id="datetimepicker2" name="datetimepicker2" class="am-form-field" placeholder="日历组件" data-am-datepicker readonly required />
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">状态
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<s:if test="${state==0 }">
										<label class="am-radio">
							     	 <input type="radio" name="radio1" id="radio1" value="1" data-am-ucheck>
							      		开启
							    	</label>
							    	<label class="am-radio">
							     	 <input type="radio" name="radio1" id="radio1" value="0" data-am-ucheck checked="checked">
							      		关闭
							    	</label>
									</s:if>
									
									<s:if test="${state!=0 }">
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
							<%-- <div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">状态
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<s:if test="${state==0 }">
										<label class="am-radio">
							     	 <input type="radio" name="radio1" id="radio1" value="1" data-am-ucheck>
							      		开启
							    	</label>
							    	<label class="am-radio">
							     	 <input type="radio" name="radio1" id="radio1" value="0" data-am-ucheck checked="checked">
							      		关闭
							    	</label>
									</s:if>
									
									<s:if test="${state!=0 }">
										<label class="am-radio">
							     	 <input type="radio" name="radio1" id="radio1" value="1" data-am-ucheck checked="checked">
							      		是
							    	</label>
							    	<label class="am-radio">
							     	 <input type="radio" name="radio1" id="radio1" value="0" data-am-ucheck >
							      		否
							    	</label>
									</s:if>
								</div>
							</div> --%>
							
							<%-- <div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">是否发送奖励
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<s:if test="${issend==0 }">
										<label class="am-radio">
							     	 <input type="radio" name="radio2" id="radio2" value="0" data-am-ucheck checked="checked">
							      		未发送
							    	</label>
							    	<label class="am-radio">
							     	 <input type="radio" name="radio2" id="radio2" value="1" data-am-ucheck >
							      		已发送
							    	</label>
									</s:if>
									
									<s:if test="${issend!=0 }">
										<label class="am-radio">
							     	 <input type="radio" name="radio2" id="radio2" value="0" data-am-ucheck >
							      		未发送
							    	</label>
							    	<label class="am-radio">
							     	 <input type="radio" name="radio2" id="radio2" value="1" data-am-ucheck checked="checked">
							      		已发送
							    	</label>
									</s:if>
								</div>
							</div> --%>
							
				</div>							
						<input value="${wgActivity.id}" class="am-form-field" name='wgActivityid' id='wgActivityid' type="hidden">
						<input value="${parameter}" class="am-form-field" name='parameter' id='parameter' type="hidden">
						</form>
					</div>
				</div>
		</div>
		<script src="<%=path %>/assets/js/amazeui.datetimepicker-se.min.js"></script>
</body>
</html>
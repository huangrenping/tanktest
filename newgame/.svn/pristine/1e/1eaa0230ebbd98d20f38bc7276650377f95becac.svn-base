<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="web.webSocket.article.ArticleManager,
    java.util.*,
    web.webSocket.util.GameServerManager,
    net.sf.json.JSONArray,
    web.webSocket.activity.ActivityManager,
    net.sf.json.JsonConfig,
    web.webSocket.util.Util,
    web.webSocket.article.ArticleManager,
    web.webSocket.rightdress.Part,
    web.webSocket.pojo.WgMain,
    web.webSocket.message.Messagepush,
    web.webSocket.article.Article"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link rel="stylesheet" href="<%=path %>/assets/js/amazeui.datetimepicker-se.min.css">

<link rel="stylesheet" href="path/to/css/amazeui.min.css"/>
<!-- <script src="http://code.jquery.com/jquery-2.1.3.min.js"></script> -->
<!-- <script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script> -->
<script src="<%=path %>/assets/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/echarts.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/moment-with-locales.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/amazeui.datetimepicker-se.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/moment.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/amazeui-pagination.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/common.js"></script> 
<%
	List<Messagepush> listthree=(List<Messagepush>)session.getAttribute("listthree");
 	int second=0;
 	//检查账号是否有该权限
 	if(listthree!=null && listthree.size()>0){
 		for(Messagepush messagepush:listthree){
			if(messagepush.getType()==100901){
				second++;
				break;
			}
		}
 	}
	if(second<1){
		response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
		return ;
	}
			
	ActivityManager activityManager=ActivityManager.getInstance();
	String level=request.getParameter("level");
	String level2=request.getParameter("level2");
	String level3=request.getParameter("level3");
	String level4=request.getParameter("level4");
	String level5=request.getParameter("level5");
	String level6=request.getParameter("level6");
	String level7=request.getParameter("level7");
	
	String number=request.getParameter("number");
	String number2=request.getParameter("number2");
	String number3=request.getParameter("number3");
	String number4=request.getParameter("number4");
	String number5=request.getParameter("number5");
	String number6=request.getParameter("number6");
	String number7=request.getParameter("number7");
	
	String radio1=request.getParameter("radio1");
	String datetimepicker1=request.getParameter("datetimepicker1");
	String datetimepicker2=request.getParameter("datetimepicker2");
	
	if(level!=null && !level.equals("") &&
		level2!=null && !level2.equals("") &&
		level3!=null && !level3.equals("") &&
		level4!=null && !level4.equals("") &&
		level5!=null && !level5.equals("") &&
		level6!=null && !level6.equals("") &&
		level7!=null && !level7.equals("") &&
		number!=null && !number.equals("") &&
		number2!=null && !number2.equals("") &&
		number3!=null && !number3.equals("") &&
		number4!=null && !number4.equals("") &&
		number5!=null && !number5.equals("") &&
		number6!=null && !number6.equals("") &&
		number7!=null && !number7.equals("") &&
		datetimepicker1!=null && !datetimepicker1.equals("") &&
		datetimepicker2!=null && !datetimepicker2.equals("") &&
		radio1!=null && !radio1.equals("")){
		String newbank=level+":"+number+","+level2+":"+number2+","+level3+":"+number3+","+level4+":"+number4+","+level5+":"+number5+","+level6+":"+number6+","+level7+":"+number7;
		
		WgMain wgMain=activityManager.getWgMain();
		wgMain.setBank(newbank);
		//activityManager.upWgmain(wgMain,1);
		//修改活动
		String[] huodong2new=activityManager.getHuodong().split(",");
		for(int i=0; i<huodong2new.length; i++){
			String [] huodong3new=huodong2new[i].split("@");
			if(huodong3new[0].equals("8")){
				long time1=Util.dateTimeStamp2(datetimepicker1, "yyyy-MM-dd");
				long time2=Util.dateTimeStamp2(datetimepicker2, "yyyy-MM-dd");
				huodong2new[i]="8@"+radio1+"@"+time1+"@"+time2+"@0";
				//activityManager.upWgmainhuodong(Util.Join(huodong2new, ","));
				wgMain.setHuodong(Util.Join(huodong2new, ","));
				activityManager.upWgmain(wgMain,1);
				break;
			}
		}
	}
	WgMain wgMain=activityManager.getWgMain();
	int[] levelnew=new int[7];
	int[] numbernew=new int[7];
	
	if(wgMain!=null){
		String bank=wgMain.getBank();
		if(bank!=null && !bank.equals("")){
			String[] bankarray=bank.split(",");
			for(int i=0; i<bankarray.length; i++){
				String[] bankarray2=bankarray[i].split(":");
				levelnew[i]=Integer.valueOf(bankarray2[0]);
				numbernew[i]=Integer.valueOf(bankarray2[1]);
			}
		}
	}
    request.setAttribute("levelnew", levelnew[0]);
    request.setAttribute("levelnew2", levelnew[1]);
    request.setAttribute("levelnew3", levelnew[2]);
    request.setAttribute("levelnew4", levelnew[3]);
    request.setAttribute("levelnew5", levelnew[4]);
    request.setAttribute("levelnew6", levelnew[5]);
    request.setAttribute("levelnew7", levelnew[6]);
    
    request.setAttribute("numbernew", numbernew[0]);
    request.setAttribute("numbernew2", numbernew[1]);
    request.setAttribute("numbernew3", numbernew[2]);
    request.setAttribute("numbernew4", numbernew[3]);
    request.setAttribute("numbernew5", numbernew[4]);
    request.setAttribute("numbernew6", numbernew[5]);
    request.setAttribute("numbernew7", numbernew[6]);

    String[] huodong2=activityManager.getHuodong().split(",");
	for(int i=0; i<huodong2.length; i++){
		String [] huodong3=huodong2[i].split("@");
		if(Integer.valueOf(huodong3[0])==8){
			
			request.setAttribute("state",huodong3[1]);
			
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
			//send();
		});
		function send(){
			var datetimepicker1=document.getElementById("datetimepicker1").value;
			var datetimepicker2=document.getElementById("datetimepicker2").value;
			var num=document.getElementById("number").value;
			var num2=document.getElementById("number2").value;
			var num3=document.getElementById("number3").value;
			var num4=document.getElementById("number4").value;
			var num5=document.getElementById("number5").value;
			var num6=document.getElementById("number6").value;
			var num7=document.getElementById("number7").value;
			
			var level=document.getElementById("level").value;
			var level2=document.getElementById("level2").value;
			var level3=document.getElementById("level3").value;
			var level4=document.getElementById("level4").value;
			var level5=document.getElementById("level5").value;
			var level6=document.getElementById("level6").value;
			var level7=document.getElementById("level7").value;
			if(datetimepicker1.length<=0){
				layer.msg("开始时间不允许为空!");
				return false;
			}else if(datetimepicker2.length<=0){
				layer.msg("结束时间不允许为空!");
				return false;
			}else if(isNaN(num)){
				layer.msg("请输入数量1!");
				return false;
			}else if(parseInt(num)<=0){
				layer.msg("数量1需要大于0!");
				return false;
			}else if(isNaN(num2)){
				layer.msg("请输入数量2!");
				return false;
			}else if(parseInt(num2)<=0){
				layer.msg("数量2需要大于0!");
				return false;
			}else if(isNaN(num3)){
				layer.msg("请输入数量3!");
				return false;
			}else if(parseInt(num3)<=0){
				layer.msg("数量3需要大于0!");
				return false;
			}else if(isNaN(num4)){
				layer.msg("请输入数量4!");
				return false;
			}else if(parseInt(num4)<=0){
				layer.msg("数量4需要大于0!");
				return false;
			}else if(isNaN(num5)){
				layer.msg("请输入数量5!");
				return false;
			}else if(parseInt(num5)<=0){
				layer.msg("数量5需要大于0!");
				return false;
			}else if(isNaN(num6)){
				layer.msg("请输入数量6!");
				return false;
			}else if(parseInt(num6)<=0){
				layer.msg("数量6需要大于0!");
				return false;
			}else if(isNaN(num7)){
				layer.msg("请输入数量7!");
				return false;
			}else if(parseInt(num7)<=0){
				layer.msg("数量7需要大于0!");
				return false;
			}else if(isNaN(level)){
				layer.msg("请输入等级1!");
				return false;
			}else if(parseInt(level)<0 && parseInt(level)>60){
				layer.msg("等级1(1-60)!");
				return false;
			}else if(isNaN(level2)){
				layer.msg("请输入等级2!");
				return false;
			}else if(parseInt(level2)<0 && parseInt(level2)>60){
				layer.msg("等级2(1-60)!");
				return false;
			}else if(isNaN(level3)){
				layer.msg("请输入等级3!");
				return false;
			}else if(parseInt(level3)<0 && parseInt(level3)>60){
				layer.msg("等级3(1-60)!");
				return false;
			}else if(isNaN(level4)){
				layer.msg("请输入等级4!");
				return false;
			}else if(parseInt(level4)<0 && parseInt(level4)>60){
				layer.msg("等级4(1-60)!");
				return false;
			}else if(isNaN(level5)){
				layer.msg("请输入等级5!");
				return false;
			}else if(parseInt(level5)<0 && parseInt(level5)>60){
				layer.msg("等级5(1-60)!");
				return false;
			}else if(isNaN(level6)){
				layer.msg("请输入等级6!");
				return false;
			}else if(parseInt(level6)<0 && parseInt(level6)>60){
				layer.msg("等级6(1-60)!");
				return false;
			}else if(isNaN(level7)){
				layer.msg("请输入等级7!");
				return false;
			}else if(parseInt(level7)<0 && parseInt(level7)>60){
				layer.msg("等级7(1-60)!");
				return false;
			}else{
				document.getElementById("send").submit();
			}
		}
</script>
</head>
<body class="theme-black">
	<form id="send" action="upbank.jsp" method="post" data-am-validator
							class="am-form tpl-form-line-form">
	<!-- 内容区域 -->
		<div class="theme-black">
				<div class="am-btn-group am-btn-group-xs" style="margin-top: 10px">
					<button id="saveBtn" type="button" onclick="send();"
						class="am-btn am-btn-default am-btn-secondary">
						<span class="am-icon-save"></span> 保存
					</button>
					<button onclick="window.history.go(-1)" type="button"
						class="am-btn am-btn-default am-btn-warning">
						<span class="am-icon-reply"></span> 返回
					</button>
				</div>
			</div>

			<div class="row">

				<div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
					<div class="widget am-cf">
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">活动名称:
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="聚宝钱庄" id="suiname" name="suiname" type="text" readonly="readonly"
										class="tpl-form-input">
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
									<c:if test="${state==0 }">
										<label class="am-radio">
							     	 <input type="radio" name="radio1" id="radio1" value="1" data-am-ucheck>
							      		开启
							    	</label>
							    	<label class="am-radio">
							     	 <input type="radio" name="radio1" id="radio1" value="0" data-am-ucheck checked="checked">
							      		关闭
							    	</label>
									</c:if>
									
									<c:if test="${state!=0 }">
									<label class="am-radio">
							     	 <input type="radio" name="radio1" id="radio1" value="1" data-am-ucheck checked="checked">
							      		开启
							    	</label>
							    	<label class="am-radio">
							     	 <input type="radio" name="radio1" id="radio1" value="0" data-am-ucheck >
							      		关闭
							    	</label>
									</c:if>
								</div>
							</div>
						
							<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">
								</label>
								<div class="am-u-sm-9">
								<table>
									<tr>
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label" style="width: 100px">等级1:
													<span class="tpl-form-line-small-"></span>
												</label>
												<label for="user-name" class="am-u-sm-3 am-form-label" style="width: 100px">
													<input value="${levelnew}" name="level" type="text"
														class="tpl-form-input" id="level">
												</label>
											</div>
										</td>
									
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label" style="width: 100px">钻石数量1:
													<span class="tpl-form-line-small-"></span>
												</label>
												<label for="user-name" class="am-u-sm-3 am-form-label" style="width: 100px">
													<input value="${numbernew}" name="number" type="text"
														class="tpl-form-input" id="number">
												</label>
											</div>
										</td>
								</tr>
								
								<tr>
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label" style="width: 100px">等级2:
													<span class="tpl-form-line-small-"></span>
												</label>
												<label for="user-name" class="am-u-sm-3 am-form-label" style="width: 100px">
													<input value="${levelnew2}" name="level2" type="text"
														class="tpl-form-input" id="level2">
												</label>
											</div>
										</td>
									
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label" style="width: 100px">钻石数量2:
													<span class="tpl-form-line-small-"></span>
												</label>
												<label for="user-name" class="am-u-sm-3 am-form-label" style="width: 100px">
													<input value="${numbernew2}" name="number2" type="text"
														class="tpl-form-input" id="number2">
												</label>
											</div>
										</td>
								</tr>
								
								<tr>
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label" style="width: 100px">等级3:
													<span class="tpl-form-line-small-"></span>
												</label>
												<label for="user-name" class="am-u-sm-3 am-form-label" style="width: 100px">
													<input value="${levelnew3}" name="level3" type="text"
														class="tpl-form-input" id="level3">
												</label>
											</div>
										</td>
									
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label" style="width: 100px">钻石数量3:
													<span class="tpl-form-line-small-"></span>
												</label>
												<label for="user-name" class="am-u-sm-3 am-form-label" style="width: 100px">
													<input value="${numbernew3}" name="number3" type="text"
														class="tpl-form-input" id="number3">
												</label>
											</div>
										</td>
								</tr>
								
								<tr>
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label" style="width: 100px">等级4:
													<span class="tpl-form-line-small-"></span>
												</label>
												<label for="user-name" class="am-u-sm-3 am-form-label" style="width: 100px">
													<input value="${levelnew4}" name="level4" type="text"
														class="tpl-form-input" id="level4">
												</label>
											</div>
										</td>
									
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label" style="width: 100px">钻石数量4:
													<span class="tpl-form-line-small-"></span>
												</label>
												<label for="user-name" class="am-u-sm-3 am-form-label" style="width: 100px">
													<input value="${numbernew4}" name="number4" type="text"
														class="tpl-form-input" id="number4">
												</label>
											</div>
										</td>
								</tr>
								
								
								<tr>
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label" style="width: 100px">等级5:
													<span class="tpl-form-line-small-"></span>
												</label>
												<label for="user-name" class="am-u-sm-3 am-form-label" style="width: 100px">
													<input value="${levelnew5}" name="level5" type="text"
														class="tpl-form-input" id="level5">
												</label>
											</div>
										</td>
									
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label" style="width: 100px">钻石数量5:
													<span class="tpl-form-line-small-"></span>
												</label>
												<label for="user-name" class="am-u-sm-3 am-form-label" style="width: 100px">
													<input value="${numbernew5}" name="number5" type="text"
														class="tpl-form-input" id="number5">
												</label>
											</div>
										</td>
								</tr>
								
								<tr>
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label" style="width: 100px">等级6:
													<span class="tpl-form-line-small-"></span>
												</label>
												<label for="user-name" class="am-u-sm-3 am-form-label" style="width: 100px">
													<input value="${levelnew6}" name="level6" type="text"
														class="tpl-form-input" id="level6">
												</label>
											</div>
										</td>
									
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label" style="width: 100px">钻石数量6:
													<span class="tpl-form-line-small-"></span>
												</label>
												<label for="user-name" class="am-u-sm-3 am-form-label" style="width: 100px">
													<input value="${numbernew6}" name="number6" type="text"
														class="tpl-form-input" id="number6">
												</label>
											</div>
										</td>
								</tr>
								
								
								<tr>
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label" style="width: 100px">等级7:
													<span class="tpl-form-line-small-"></span>
												</label>
												<label for="user-name" class="am-u-sm-3 am-form-label" style="width: 100px">
													<input value="${levelnew7}" name="level7" type="text"
														class="tpl-form-input" id="level7">
												</label>
											</div>
										</td>
									
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label" style="width: 100px">钻石数量7:
													<span class="tpl-form-line-small-"></span>
												</label>
												<label for="user-name" class="am-u-sm-3 am-form-label" style="width: 100px">
													<input value="${numbernew7}" name="number7" type="text"
														class="tpl-form-input" id="number7">
												</label>
											</div>
										</td>
								</tr>
								
								
							</table>
							</div>
						</div>
		



						<!-- 表单体  end-->
						<input type="text" id="usernametext" name="usernametext"  type="hidden"></input>
					</div>
				</div>
		</div>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="web.webSocket.player.PlayerManager,
    java.util.*,
    java.util.regex.Pattern,
    java.util.regex.Matcher,
    web.webSocket.util.BillingCenter,
    web.webSocket.pojo.WgPlayerserver4,
    web.webSocket.pojo.WgPlayerserverClient,
    web.webSocket.message.Messagepush,
    web.webSocket.pojo.WgPlayerserver"%>
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
<link rel="stylesheet" href="<%=path %>/assets/js/amazeui.datetimepicker-se.min.css">

<script type="text/javascript" src="<%=path %>/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/echarts.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/moment-with-locales.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/amazeui.datetimepicker-se.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/moment.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/amazeui-pagination.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/common.js"></script> 
		<%	
			List<Messagepush> listthree=(List<Messagepush>)session.getAttribute("listthree");
		 	int num=0;
		 	//检查账号是否有该权限
			for(Messagepush messagepush:listthree){
				if(messagepush.getType()==20101){
					num++;
					break;
				}
			}
			if(num<1){
				response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
				return ;
			}
	
			String serveruid=request.getParameter("serveruid");
			long seruid=Long.parseLong(serveruid);
			String newusername=request.getParameter("username");
			String gold=request.getParameter("gold");
			String diamond=request.getParameter("diamond");
			String level=request.getParameter("level");
			String physical=request.getParameter("physical");
			String bean=request.getParameter("bean");
			String totalrmbdiamond=request.getParameter("totalrmbdiamond");
			String arenagold=request.getParameter("arenagold");
			String lovecurrency=request.getParameter("lovecurrency");
			String shutup=request.getParameter("radio2");
			String signin=request.getParameter("radio1");
			PlayerManager playerManager=PlayerManager.getInstance();
			WgPlayerserver wg=playerManager.getplayer(seruid);
			request.setAttribute("wg", wg);
			WgPlayerserver4 wg4=wg.getWgPlayerserver4();
			request.setAttribute("wg4", wg4);
			request.setAttribute("lovecurrency", wg.getLovecurrency());
			request.setAttribute("maxlevel", PlayerManager.getInstance().getAddviplv().length);
			
			if(gold!=null && !gold.equals("") &&
			   diamond!=null && !diamond.equals("") &&
			   physical!=null && !physical.equals("") &&
			   bean!=null && !bean.equals("") &&
			   totalrmbdiamond!=null && !totalrmbdiamond.equals("") &&
			   newusername!=null && !newusername.equals("") &&
			   arenagold!=null && !arenagold.equals("") &&
			   level!=null && !level.equals("") &&
			   lovecurrency!=null && !lovecurrency.equals("")){
				Pattern pattern = Pattern.compile("[0-9]*"); 
				Matcher isgold = pattern.matcher(gold);
				Matcher isdiamond = pattern.matcher(diamond);
				Matcher isphysical = pattern.matcher(physical);
				Matcher isbean = pattern.matcher(bean);
				Matcher istotalrmbdiamond = pattern.matcher(totalrmbdiamond);
				Matcher isarenagold = pattern.matcher(arenagold);
				Matcher islevel = pattern.matcher(level);
				Matcher islovecurrency = pattern.matcher(lovecurrency);
				newusername=newusername.trim();
				int result=0;
				if(wg.getUsername().equals(newusername)){
					//账号一致,不修改
					result=0;
				}else{
					//账号修改
					//判断账号是否存在
					Long serveruid2=playerManager.getNameplayermap().get(newusername);
					if(serveruid2!=null){
						//用户名已经存在，不能修改
						return;
					}else{
						//可以修改
						result=1;
					}
				}
				
				if(isgold.matches() &&
				isdiamond.matches() &&
				isphysical.matches()&& 
				isbean.matches() && 
				istotalrmbdiamond.matches() &&
				isarenagold.matches() &&
				islevel.matches() &&
				islovecurrency.matches()){
					if(result==1){
						playerManager.removetonamemap(wg.getUsername());
						wg.setUsername(newusername);
						//wg.setUpdatesql(1);
						playerManager.addtonamemap(wg);
						playerManager.updateplayer(wg);
						//wg.heartBeat(heartbeatStartTime);
					}
					
					//调用接口
					int addgold=Integer.valueOf(gold)-wg.getGold();
					int adddiamond=Integer.valueOf(diamond)-wg.getDiamond();
					int addarenagold=Integer.valueOf(arenagold)-wg.getArenagold();
					int addphysical=Integer.valueOf(physical)-wg.getPhysical();
					int addbean=Integer.valueOf(bean)-wg.getBean();
					int addtotalrmbdiamond=Integer.valueOf(totalrmbdiamond)-wg.getTotalrmbdiamond();
					int addlovecurrency=Integer.valueOf(lovecurrency)-wg.getLovecurrency();
					
					String userid=(String)session.getAttribute("userid");
					String realname=(String)session.getAttribute("realname");
					//金币
					if(addgold!=0){
						playerManager.giveLog(Integer.valueOf(userid), wg.getUid(),BillingCenter.goldtype,addgold,"");
					}
					if(adddiamond!=0){
						playerManager.giveLog(Integer.valueOf(userid), wg.getUid(),BillingCenter.diamondtype,adddiamond,"");
					}
					if(addarenagold!=0){
						playerManager.giveLog(Integer.valueOf(userid), wg.getUid(),BillingCenter.arenagoldtype,addarenagold,"");
					}
					if(addphysical!=0){
						playerManager.giveLog(Integer.valueOf(userid), wg.getUid(),BillingCenter.physicaltype,addphysical,"");
					}
					if(addbean!=0){
						playerManager.giveLog(Integer.valueOf(userid), wg.getUid(),BillingCenter.beantype,addbean,"");
					}
					if(addtotalrmbdiamond!=0){
						playerManager.giveLog(Integer.valueOf(userid), wg.getUid(),BillingCenter.totalrmbdiamondtype,addtotalrmbdiamond,"");
					}
					if(addlovecurrency!=0){
						playerManager.giveLog(Integer.valueOf(userid), wg.getUid(),BillingCenter.lovecurrencytype,addlovecurrency,"");
					}
					wg.setArenagold(wg.getArenagold()+addarenagold);
					wg.setGold(wg.getGold()+addgold);
					wg.setDiamond(wg.getDiamond()+adddiamond);
					wg.setPhysical(wg.getPhysical()+addphysical);
					wg.setBean(wg.getBean()+addbean);
					wg.setTotalrmbdiamond(Integer.valueOf(totalrmbdiamond));
					wg.setLevel(Integer.valueOf(level));
					wg.setLovecurrency(wg.getLovecurrency()+addlovecurrency);
					request.setAttribute("lovecurrency", wg.getLovecurrency());
					
					wg.pushplayer(PlayerManager.physicalype);
					wg.pushplayer(PlayerManager.diamondtype);
					wg.pushplayer(PlayerManager.goldtype);
					wg.pushplayer(PlayerManager.beantype);
					wg.pushplayer(PlayerManager.leveltype);
					wg.pushplayer(PlayerManager.lovecurrencypush);
			    }	
			}
			//修改wg4是否禁言  禁止登陆shutup  signin
			if(shutup!=null && !shutup.equals("") &&
			   signin!=null && !signin.equals("")){
			   wg4.setShutup(Integer.valueOf(shutup));
			   wg4.setSignin(Integer.valueOf(signin));
			   //下线
			   if(Integer.valueOf(signin)==1){
			   		PlayerManager.getInstance().offline(seruid);
			   } 
			}

		%>

<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
    <script type="text/javascript">
		layui.define(['form','layer','laypage','laydate'], function(exports){
		var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;
		
		}); 
	//表单校验
	function validate_form(thisform){
	var level=$("#level").val();
	var maxlevel=document.getElementById("maxlevel").value;
	 if(level==""||isNaN(level)||parseInt(level)>parseInt(maxlevel)||parseInt(level)<1) {
	 	layer.msg("玩家等级为1~"+maxlevel+"级");
	 	return false;
		}
		$("#hp_form").submit();
	}

</script>
</head>
<body class="theme-black">

	<!-- 内容区域 -->
	<form action="wgupdate.jsp" method="post" id="hp_form" name="hp_form" data-am-validator
							class="am-form tpl-form-line-form">
		<div class="theme-black">
				<div class="am-btn-group am-btn-group-xs" style="margin-top: 10px">
					<!--<button id="saveBtn" type="button" onclick="return save();"
						class="am-btn am-btn-default am-btn-secondary">
						<span class="am-icon-save"></span> 保存
					</button>  -->
					<button id="saveBtn" type="submit" onclick="return validate_form(this);"
						class="am-btn am-btn-default am-btn-secondary">
						<span class="am-icon-save"></span> 保存
					</button>
<%-- 					<button onclick="window.history.go(-1)" type="button"
						class="am-btn am-btn-default am-btn-warning">
						<span class="am-icon-reply"></span> 返回
					</button> --%>
				</div>
			</div>
			<div class="row">
				<div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
					<div class="widget am-cf">
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">昵称
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${wg.playername}" readonly="readonly" id="playername" name="playername" type="text"
										class="tpl-form-input">
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">熊猫id
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${wg.username}" id="username" name="username" type="text"
										class="tpl-form-input">
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">金币
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${wg.gold}" name="gold" id="gold" type="text"
										class="tpl-form-input" placeholder="">
								</div>
							</div>

							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">钻石
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${wg.diamond}" name="diamond" type="text"
										class="tpl-form-input" id="diamond">
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">体力
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${wg.physical}" name="physical" type="text"
										class="tpl-form-input" id="physical">
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">等级
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${wg.level}" name="level" type="text"
										class="tpl-form-input" id="level">
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">相思豆
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${wg.bean}" name="bean" type="text"
										class="tpl-form-input" id="bean">
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">百花勋章
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${wg.arenagold}" name="arenagold" type="text"
										class="tpl-form-input" id="bean">
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">情缘线索
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${lovecurrency}" name="lovecurrency" type="text"
										class="tpl-form-input" id="lovecurrency">
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">获得体力总数
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${wg4.physicalnum}" name="physicalnum" type="text" readonly="sacreadonly"
										class="tpl-form-input" id="physicalnum"><small>不可修改</small>
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">充值总数
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${wg.totalrmbdiamond}" name="totalrmbdiamond" type="text"
										class="tpl-form-input" id="bean">
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">禁言
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<s:if test="${wg4.shutup==0 }">
									<label class="am-radio">
							     	 <input type="radio" name="radio2" id="radio2" value="0" data-am-ucheck checked="checked">
							      		否
							    	</label>
							    	<label class="am-radio">
							      	 <input type="radio" name="radio2" id="radio2" value="1" data-am-ucheck >
							      		是
							    	</label>
									</s:if>
									
									<s:if test="${wg4.shutup!=0 }">
									<label class="am-radio">
							     	 <input type="radio" name="radio2" id="radio2" value="0" data-am-ucheck >
							      		否
							    	</label>
							    	<label class="am-radio">
							     	 <input type="radio" name="radio2" id="radio2" value="1" data-am-ucheck checked="checked">
							      		是
							    	</label>
									</s:if>
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">禁止登陆
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<s:if test="${wg4.signin==0 }">
									<label class="am-radio">
							     	 <input type="radio" name="radio1" id="radio1" value="0" data-am-ucheck checked="checked">
							      		否
							    	</label>
							    	<label class="am-radio">
							    	<input type="radio" name="radio1" id="radio1" value="1" data-am-ucheck >
							      		是
							      	</label>
									</s:if>
									
									<s:if test="${wg4.signin!=0 }">
									<label class="am-radio">
							     	 <input type="radio" name="radio1" id="radio1" value="0" data-am-ucheck >
							      		否
							    	</label>
							    	<label class="am-radio">
							      	 <input type="radio" name="radio1" id="radio1" value="1" data-am-ucheck checked="checked">
							      		是
							    	</label>
									</s:if>
								</div>
							</div>
							
							<!-- 隐藏域-->
 									<input id="serveruid" name="serveruid" type="hidden"
										value="${wg.serveruid}" />
									<input id="maxlevel" name="maxlevel" type="hidden"
										value="${maxlevel}" />  
						</form>
						<!-- 表单体  end-->
					</div>
				</div>
		</div>
</body>
</html>
<%@ page language="java"
	import="java.util.*,
	web.webSocket.player.PlayerManager,
	web.webSocket.pojo.WgPlayerserver,
	web.webSocket.pojo.WgPlayerserverClient,
	web.webSocket.pojo.WgHangup,
	web.webSocket.util.Util"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'selectOnewg.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="<%=path %>/layui/css/layui.css"  media="all">
	
  </head>
  <%
  String userName=request.getParameter("userName");
  String playName=request.getParameter("playName");
  if (userName != null || playName != null) {
		PlayerManager playerManager = PlayerManager.getInstance();
		Collection<WgPlayerserver> wgplaylist = playerManager.getIdplayermap().values();
		WgPlayerserverClient wgPlayerserverClient=null;
		WgPlayerserver wg=null;
		for (WgPlayerserver wgPlayerserver : wgplaylist) {
			if (wgPlayerserver.getUsername().equals("-1") || wgPlayerserver.getUsername().equals("-2")) {
				continue;
			}
			if(userName != null&&!userName.equals("")){
				if(wgPlayerserver.getUsername().equals(userName)){
					wg=wgPlayerserver;
				}
			}else if(playName != null&&!playName.equals("")){
				if(wgPlayerserver.getPlayername().equals(playName)){
					wg=wgPlayerserver;
				}
			}else{
				if(wgPlayerserver.getPlayername().equals(playName)&&wgPlayerserver.getUsername().equals(userName)){
					wg=wgPlayerserver;
				}
			}
		}
		if(wg!=null){
			wgPlayerserverClient=new WgPlayerserverClient();
			wgPlayerserverClient.setId(wg.getId());
			wgPlayerserverClient.setServeruid(wg.getServeruid());
			wgPlayerserverClient.setDiamond(wg.getDiamond());
			wgPlayerserverClient.setGold(wg.getGold());
			wgPlayerserverClient.setLevel(wg.getLevel());
			wgPlayerserverClient.setPhysical(wg.getPhysical());
			wgPlayerserverClient.setPlayername(wg.getPlayername());
			wgPlayerserverClient.setUsername(wg.getUsername());
			wgPlayerserverClient.setBean(wg.getBean());
			wgPlayerserverClient.setTotalrmbdiamond(wg.getTotalrmbdiamond());
			wgPlayerserverClient.setViplevel(wgPlayerserverClient.getTotalrmbdiamond());
			wgPlayerserverClient.setChannel(wg.getChannel());
			wgPlayerserverClient.setMaxcheckpoint(wg.getMaxcheckpoint());
			wgPlayerserverClient.setRecharge(wg.getRecharge());
			WgHangup wgHangup=wg.getWgHangup2().getHangups();
			if(wgHangup!=null){
				wgPlayerserverClient.setHangupnum(wgHangup.getHangupnum());
			}else{
				wgPlayerserverClient.setHangupnum(0);
			}
			wgPlayerserverClient.setOnlinetime(wg.getOnlinetime()/60);
			if(wg.getLastlogintime()==0){
				wgPlayerserverClient.setLastlogintime("");
			}else{
				//wgPlayerserverClient.setLastlogintime(Util.getDate(wg.getLastlogintime()*1000, 1));//改为时间戳
				wgPlayerserverClient.setLastlogintime(String.valueOf(wg.getLastlogintime()));
			}
			wgPlayerserverClient.setLovesection(wg.getLovesection());
			wgPlayerserverClient.setRedthread(wg.getRedthread());
		}
		request.setAttribute("selectUser", wgPlayerserverClient);
	}else{
		request.setAttribute("selectUser", null);
	}
  
  %>
  <body>
      <table class="layui-table">
    <colgroup>
      <col width="150">
      <col width="150">
      <col width="150">
      <col width="150">
      <col width="150">
      <col width="150">
      <col width="150">
      <col width="150">
      <col width="150">
      <col width="150">
      <col>
    </colgroup>
    <thead>
      <tr>
        <th>id</th>
        <th>serveruid</th>
        <th>熊猫id</th>
        <th>昵称</th>
        <th>等级</th>
        <th>金币</th>
        <th>爱心</th>
        <th>钻石</th>
        <th>相思豆</th>
        <th>vip等级</th>
      </tr> 
    </thead>
    <c:if test="${not empty selectUser}">
	<tbody>
      <tr>
        <td>${selectUser.id }</td>
        <td>${selectUser.serveruid }</td>
        <td>${selectUser.username }</td>
        <td>${selectUser.playername }</td>
        <td>${selectUser.level }</td>
        <td>${selectUser.gold }</td>
        <td>${selectUser.physical }</td>
        <td>${selectUser.diamond }</td>
        <td>${selectUser.bean }</td>
        <td>${selectUser.viplevel }</td>
      </tr>
    </tbody>
	</c:if>
  </table>
        <table class="layui-table">
    <colgroup>
      <col width="150">
      <col width="150">
      <col width="150">
      <col width="150">
      <col width="150">
      <col width="150">
      <col width="150">
      <col width="150">
      <col width="150">
      <col width="150">
      <col>
    </colgroup>
    <thead>
      <tr>
        <th>玩家闯过最大关卡</th>
        <th>累计充值</th>
        <th>充值VIP对应领取的钻石</th>
        <th>百花勋章</th>
        <th>渠道</th>
        <th>在线时长(分钟)</th>
        <th>最后登录时间</th>
        <th>游历值</th>
        <th>姻缘节</th>
        <th>红线</th>
      </tr> 
    </thead>
    <c:if test="${not empty selectUser}">
	<tbody>
      <tr>
        <td>${selectUser.maxcheckpoint }</td>
        <td>${selectUser.recharge }</td>
        <td>${selectUser.totalrmbdiamond }</td>
        <td>${selectUser.arenagold }</td>
        <td>${selectUser.channel }</td>
        <td>${selectUser.onlinetime }</td>
        <td>${selectUser.lastlogintime }</td>
        <td>${selectUser.hangupnum }</td>
        <td>${selectUser.lovesection }</td>
        <td>${selectUser.redthread }</td>
      </tr>
    </tbody>
	</c:if>
  </table>
  
   <c:if test="${empty selectUser}">
   <h2 style="text-align: center;">
      	查无此人
   </h2>
   </c:if>
    <script src="<%=path %>/layui/layui.js" charset="utf-8"></script>
  </body>
</html>

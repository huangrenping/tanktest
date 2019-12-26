<%@page import="web.webSocket.plot.PlotManager"%>
<%@ page language="java" import="java.util.*,
web.webSocket.player.PlayerManager,
web.webSocket.pojo.*,
web.webSocket.activity.ActivityManager,
web.webSocket.pojo.WgMain2,
web.webSocket.card.CardManager,
web.webSocket.plot.Chapter,
web.webSocket.plot.PlotManager,
web.webSocket.arena.ArenaManager,
web.webSocket.arena.Arenaplayer,
web.webSocket.player.PlayerManager,
web.webSocket.hangup.WgHangup2,
web.webSocket.hangup.HangupManager,
web.webSocket.mail.MailManager,
web.webSocket.card.Card" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
PlayerManager playerManager = PlayerManager.getInstance();
WgPlayerserver getplayer = playerManager.getplayer(1075400000000007l);
if(getplayer!=null){
	WgPlayerserver7 wg7 = getplayer.getWgPlayerserver7();
	wg7.setTotaldiamondcardnum(0);
	wg7.setTotaldiamondcardrewards(new int [10]);
	wg7.saveTotaldiamondcardreward();
	ActivityManager.adddiamondcard(getplayer, 1);
out.print("执行完毕"+getplayer.getPlayername());
}else{
	out.print("未找到该玩家");
}
%>

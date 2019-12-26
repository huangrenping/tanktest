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
WgPlayerserver getplayer = playerManager.getplayer(1023400000039253l);
if(getplayer!=null){
	getplayer.getWghuodong().setSumchongzhi(getplayer.getWghuodong().getSumchongzhi()+68);
out.print("执行完毕"+getplayer.getPlayername());
}else{
	out.print("未找到该玩家");
}
%>

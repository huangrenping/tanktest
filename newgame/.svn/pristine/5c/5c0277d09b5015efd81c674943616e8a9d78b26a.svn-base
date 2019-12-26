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
web.webSocket.mail.MailManager,
web.webSocket.activity.Huodong,
web.webSocket.util.*,
web.webSocket.common.Publicmain,
web.webSocket.card.Card" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
ActivityManager activityManager = ActivityManager.getInstance();
Map<Integer, Huodong> huodongmap = activityManager.getHuodongmap();
// 每日首充活动
Huodong huodong = huodongmap.get(ActivityManager.areanrightdress);
if (huodong != null) {
	Publicmain.getInstance().resetarenahd(PlayerManager.getInstance().getplayers(), huodong.getNeedarticle());
}
out.print("活动重置完毕");
%>

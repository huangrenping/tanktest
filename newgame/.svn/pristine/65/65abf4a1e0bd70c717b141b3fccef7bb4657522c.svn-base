<%@page import="web.webSocket.plot.PlotManager"%>
<%@ page language="java" import="java.util.*,
java.text.*,
web.webSocket.pojo.*,
web.webSocket.util.*,
web.webSocket.player.PlayerManager,
web.webSocket.activity.ActivityManager,
web.webSocket.pojo.WgMain2,
web.webSocket.card.CardManager,
web.webSocket.plot.Chapter,
web.webSocket.plot.PlotManager,
web.webSocket.arena.ArenaManager,
web.webSocket.arena.Arenaplayer,
web.webSocket.pojo.WgPlayerserver8,
web.webSocket.activity2.Activity2Manager,
web.webSocket.player.PlayerManager,
web.webSocket.common.Game,
web.webSocket.mail.MailManager,
web.webSocket.language.Translate,
com.google.gson.reflect.TypeToken,
com.google.gson.Gson,
web.webSocket.card.Card" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
PlayerManager playerManager = PlayerManager.getInstance();
WgPlayerserver[] getplayers = playerManager.getplayers();
for (WgPlayerserver getplayer : getplayers) {
	if(!getplayer.getPlayername().equals("GM") && !getplayer.getPlayername().equals("系统邮件")){
		if(getplayer.getIsfirst()==2){
			String content= "亲爱的小主，为您补发首充背景“桃花落”，感谢您一直以来对我们游戏的支持与厚爱！";
			MailManager.getInstance().fulisendmail(Translate.systemmessage7, Translate.commonmessage5, content, "80012:1", (long) -1, getplayer.getServeruid(), 1);
		}
	}
}
%>

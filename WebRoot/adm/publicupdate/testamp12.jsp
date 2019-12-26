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
web.webSocket.activity2.Activity2Manager,
web.webSocket.player.PlayerManager,
web.webSocket.common.Game,
web.webSocket.mail.MailManager,
com.google.gson.reflect.TypeToken,
com.google.gson.Gson,
web.webSocket.language.Translate,
web.webSocket.card.Card" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
	PlayerManager playerManager = PlayerManager.getInstance();
		WgPlayerserver[] getplayers = playerManager.getplayers();
		for (WgPlayerserver getplayer : getplayers) {
			if (!getplayer.getPlayername().equals("GM") && !getplayer.getPlayername().equals(Translate.commonmessage5)) {
					if(getplayer.isIslogin()){
					getplayer.getWgPlayerserver4().setActivityonlinetime((int)(System.currentTimeMillis()/1000));
				}else{
					getplayer.getWgPlayerserver4().setActivityonlinetime(null);
				}
				getplayer.getWgPlayerserver4().resetData2();
			}
		}
		out.println("重置在线奖励完毕");
%>

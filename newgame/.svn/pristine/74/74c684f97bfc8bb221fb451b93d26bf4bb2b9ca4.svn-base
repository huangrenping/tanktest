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
	int day = getplayer.myRegisterDay();
	int monthcardid=day/30;
	if(day%30==0){
		monthcardid=monthcardid-1;
	}
	if(monthcardid>0){//不是第一个月的玩家跳过
		continue;
	}
	WgPlayerserver7 wg7 = getplayer.getWgPlayerserver7();
	int[] signtotalstate = wg7.getSigntotalstate();
	if(signtotalstate[2]==2){//累计签到第三个奖励领取了
		String content= "亲爱的小主，由于签到奖励调整，为您补发15天累计签到奖励“齐钰•叶落惊秋碎片*20”，请您尽快领取哦！";
		MailManager.getInstance().fulisendmail(Translate.systemmessage7, Translate.commonmessage5, content, "923001:20", (long) -1, getplayer.getServeruid(), 1);
	}
}
out.print("签到补偿发放");
%>

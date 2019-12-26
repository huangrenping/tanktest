<%@page import="web.webSocket.plot.PlotManager"%>
<%@ page language="java" import="java.util.*,
java.text.*,
web.webSocket.pojo.*,
web.webSocket.util.*,
web.webSocket.pet.*,
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
		int day = getplayer.myRegisterDay();
		int monthcardid=day/30;
		if(day%30==0){
			monthcardid=monthcardid-1;
		}
		if(monthcardid>0){//不是第一个月的玩家跳过
			continue;
		}
		int nowday=0;
		if(day%30==0){
			nowday=30;
		}else{
			nowday=day%30;
		}
		int num=0;
		WgPlayerserver2 wg2 = getplayer.getWgPlayerserver2();
		String signstr=wg2.getSignstr();
		if(signstr==null||signstr.equals("")){//首月没有签到过的玩家没有补偿
			continue;
		}
		String[] strarray=wg2.getSignstr().split(",");
		if(nowday==29){
			if(Integer.valueOf(strarray[2])==1){//第3天签到的补偿10
				num+=10;
			}
			if(Integer.valueOf(strarray[6])==1){//第7天签到的补偿5
				num+=5;
			}
			if(Integer.valueOf(strarray[14])==1){//第15天签到的补偿10
				num+=10;
			}
			if(Integer.valueOf(strarray[24])==1){//第25天签到的补偿20
				num+=20;
			}
		}
		if(num>0){
			String content= Translate.translateString(Translate.commonmessage39, new String[][]{{"@cardnum@", String.valueOf(num)}});
			MailManager.getInstance().fulisendmail(Translate.systemmessage7, Translate.commonmessage5, content, "923001:"+num, (long) -1, getplayer.getServeruid(), 1);
		}
	}
}
out.println("签到奖励补偿已发放");
%>

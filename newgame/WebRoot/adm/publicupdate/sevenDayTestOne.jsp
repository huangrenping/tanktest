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
		WgPlayerserver3 wg3=getplayer.getWgPlayerserver3();
		if(wg3!=null){
			String loginreward=wg3.getLoginreward();
			if(loginreward!=null && !loginreward.equals("")){
				String[] loginrewardarray=loginreward.split(",");
				if(loginrewardarray.length>=6){
					if(Integer.valueOf(loginrewardarray[5])==2){//第六个奖励领取了
						if(loginrewardarray.length>=7){
							if(Integer.valueOf(loginrewardarray[6])==2){
								continue;
							}
						}
						//第7个奖励没有领取
						MailManager.getInstance().fulisendmail(Translate.systemmessage7, Translate.commonmessage5, Translate.commonmessage38, "60004:1", (long) -1, getplayer.getServeruid(), 1);
					}
				}
			}
		}
	}
}
out.print("七日奖励补发完毕");
%>

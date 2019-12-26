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
			if((getplayer.getLogintime()!=null&&getplayer.getLogintime()>1565722800000l)||getplayer.getLastlogintime()>1565722800l){
				//最后上线时间或者最后下线时间超过2019-08-14 03:00:00 奖励重置，时间设置为一个小时在线时长
					System.out.println(getplayer.getPlayername());
				WgPlayerserver4 wg4 = getplayer.getWgPlayerserver4();
				wg4.setActivityonlinetime((int)(System.currentTimeMillis()/1000));
				wg4.setActivityonlinetime2(60*60);
				wg4.setOnlinetime(0);
				wg4.setOnlinetimereward("0,0,0");
				wg4.dirty=true;
			}else{
				//不在3点登陆的玩家直接重置时间
				WgPlayerserver4 wg4 = getplayer.getWgPlayerserver4();
				if(getplayer.isIslogin()){
					wg4.setActivityonlinetime((int)(System.currentTimeMillis()/1000));
				}else{
					wg4.setActivityonlinetime(null);
				}
				wg4.setActivityonlinetime2(0);
				wg4.setOnlinetime(0);
				wg4.setOnlinetimereward("0,0,0");
				wg4.dirty=true;
			}
		}
		out.println("重置在线奖励完毕");
%>

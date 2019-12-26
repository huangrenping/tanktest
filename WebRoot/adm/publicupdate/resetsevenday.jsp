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
com.google.gson.reflect.TypeToken,
com.google.gson.Gson,
web.webSocket.card.Card" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
		GameServerManager servers = GameServerManager.getInstance();
		int sid = servers.getServerid();
		PlayerManager playerManager = PlayerManager.getInstance();
		WgPlayerserver[] getplayers = playerManager.getplayers();
		/*if(sid==745){

		}else{
			for (WgPlayerserver getplayer : getplayers) {
				WgPlayerserver7 wg7 = getplayer.getWgPlayerserver7();
				if(wg7.getTotalloginday()>1){
					wg7.setTotalloginday(0);
					wg7.setLogindayrewards(new int [10]);
					wg7.saveLogindayreward();
					if(getplayer.getLogintime()!=null&&getplayer.getLogintime()>1571166000000l){//大于2019-08-10 03:00:00
						getplayer.getWgPlayerserver7().setIslogintoday(1);
						ActivityManager.addloginday(getplayer, 1);
					}
				}
			}
		}*/
		String s=Util.getDate(System.currentTimeMillis(), 1);
    	long daytime=Util.getLongTime(s, 1);
			for (WgPlayerserver getplayer : getplayers) {
				WgPlayerserver7 wg7 = getplayer.getWgPlayerserver7();
				if(wg7.getTotalloginday()>0){
					wg7.setTotalloginday(0);
					wg7.setLogindayrewards(new int [10]);
					wg7.saveLogindayreward();
					if(getplayer.getLogintime()!=null&&getplayer.getLogintime()>daytime){//大于2019-08-10 03:00:00
						getplayer.getWgPlayerserver7().setIslogintoday(1);
						ActivityManager.addloginday(getplayer, 1);
					}
				}
			}
out.println("执行完毕");
%>

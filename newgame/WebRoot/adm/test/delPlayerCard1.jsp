<%@page import="web.webSocket.plot.PlotManager"%>
<%@ page language="java" import="java.util.*,
java.text.*,
web.webSocket.pojo.*,
web.webSocket.util.*,
web.webSocket.player.PlayerManager,
web.webSocket.activity.ActivityManager,
web.webSocket.pojo.WgMain2,
web.webSocket.card.*,
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
com.google.gson.Gson" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
	PlayerManager playerManager = PlayerManager.getInstance();
WgPlayerserver player = playerManager.getplayer(1072500000001958l);
if(player!=null){
		Wgcard wgcard = player.getCard();
		WgPlayercard getcard = wgcard.getcard(33003);
		if (getcard != null) {
			Card card=CardManager.getInstance().getcardone(getcard.getCardid());
			boolean remove3 = wgcard.getMapidlist().get(card.getType()).remove(Integer.valueOf(33003));
			out.println("remove3==" + remove3);
			if (remove3 == true) {
				boolean remove2 = wgcard.getIdlist().remove(Integer.valueOf(33003));
				out.println("remove2==" + remove2);
				if (remove2 == true) {
					boolean remove = wgcard.getWgcardlist().remove(getcard);
					out.println("remove==" + remove);
					if (remove == true) {
						getcard.setDel(1);
						getcard.setState(1);
						CardManager.getInstance().update(getcard);
						out.println("删除完毕");
					}
				}
			}
		}
	}
%>

<%@page import="web.webSocket.plot.PlotManager"%>
<%@ page language="java" import="java.util.*,
java.text.*,
web.webSocket.pojo.*,
web.webSocket.util.*,
web.webSocket.jiayan.JiayanManager,
web.webSocket.jiayan.Jiayaninfo,
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
web.webSocket.card.Card" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
PlayerManager playerManager = PlayerManager.getInstance();
Long playerid = 1076800000005156l;
List<Jiayaninfo> listjiayan = JiayanManager.getInstance().getListjiayan();
if(playerid!=null){
	WgPlayerserver player = playerManager.getplayer(playerid);
	WgPlayerserver8 wg8 = player.getWgPlayerserver8();
	String[] split = wg8.getJiayancards().split(",");
	List<String> strings=new ArrayList<String>();
	for (String string : split) {
		strings.add(string);
	}
	List<String> nodelStrings=new ArrayList<String>();
	for (Jiayaninfo jiayaninfo : listjiayan) {
		long[] ids=jiayaninfo.getIds();
		int[] cards=jiayaninfo.getCards();
		for (int i = 0; i < ids.length; i++) {
			if(ids[i]>0){
				if(ids[i]==playerid){
					int cardid=cards[i];
					WgPlayercard wgPlayercard=player.getCard().getcard(cardid);
					nodelStrings.add(String.valueOf(wgPlayercard.getLid()));
				}
			}
		}
	}
	for (String string : strings) {
		if(nodelStrings.indexOf(string)>-1){
			continue;
		}
		if(string!=null&&!string.equals("")){
		wg8.delcards(Long.valueOf(string));
		out.print("去除cardlid====="+string);
		}
	}
out.print("重置完毕");
}
%>

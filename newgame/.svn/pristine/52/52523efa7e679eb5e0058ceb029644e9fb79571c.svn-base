<%@page import="web.webSocket.plot.PlotManager"%>
<%@ page language="java" import="java.util.*,
web.webSocket.player.PlayerManager,
web.webSocket.pojo.WgPlayerserver,
web.webSocket.pojo.WgPlayerserver2,
web.webSocket.pojo.WgPlayerserver3,
web.webSocket.activity.ActivityManager,
web.webSocket.pojo.WgMain2,
web.webSocket.card.CardManager,
web.webSocket.plot.Chapter,
web.webSocket.plot.PlotManager,
web.webSocket.arena.ArenaManager,
web.webSocket.arena.Arenaplayer,
web.webSocket.pojo.WgPlayerserver8,
web.webSocket.player.PlayerManager,
web.webSocket.card.Card" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
long [] uids={1076300000002848l,1076300000001736l,1076300000001520l};
for (long uid : uids) {
	WgPlayerserver getplayer = PlayerManager.getInstance().getplayer(uid);
	if(getplayer!=null){
		out.print("衣服排名====="+getplayer.getYifuranking()+"，衣服数量==="+getplayer.getYifunum2());
	}
}
//out.print("chapterlist====="+chapterlist);
%>

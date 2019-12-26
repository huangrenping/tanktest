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
web.webSocket.card.Card" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
ArenaManager arenaManager= ArenaManager.getInstance();
Arenaplayer arenaplayer=arenaManager.getMapplayers().get(3005l);
out.print("playersize====="+arenaManager.getMapplayers().size()+"*****");
if(arenaplayer!=null){
out.print("rang====="+arenaplayer.getRanking()+"*****name==="+arenaplayer.getPlayername()+"*****");
}
Map<Long,Integer> map=new HashMap<Long,Integer>();
String s=arenaManager.getWgMain().getRobot();
			String[] ss=s.split(",");
			long uid=0l;
			int ran=0;
			for (int i = 0; i < ss.length; i++) {
				String[] one=ss[i].split(":");
				
				long pid=Long.valueOf(one[0]);
				int ranking=Integer.valueOf((one[1]));
				if(ranking>ran){
				ran=ranking;
				uid=pid;
				}
				map.put(pid, ranking);
			}
			out.print("ran====="+ran+"*****uid==="+uid+"*****");
			out.print("size====="+map.size());
//PlotManager plotmanager= PlotManager.getInstance();
//List<Chapter> chapterlist=plotmanager.getChapterlistclone();
//out.print("chapterlist====="+chapterlist);
%>

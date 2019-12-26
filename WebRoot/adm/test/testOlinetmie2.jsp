<%@page import="web.webSocket.plot.PlotManager"%>
<%@ page language="java" import="java.util.*,
web.webSocket.player.PlayerManager,
web.webSocket.pojo.*,
web.webSocket.activity.ActivityManager,
web.webSocket.pojo.WgMain2,
web.webSocket.card.CardManager,
web.webSocket.plot.Chapter,
web.webSocket.plot.PlotManager,
web.webSocket.arena.ArenaManager,
web.webSocket.arena.Arenaplayer,
web.webSocket.player.PlayerManager,
web.webSocket.util.GameServerManager,
web.webSocket.util.JacksonManager,
org.codehaus.jackson.node.ObjectNode,
web.webSocket.card.Card" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
GameServerManager gameServerManager=GameServerManager.getInstance();
int sid=gameServerManager.getServerid();
WgPlayerserver players[] = PlayerManager.getInstance().getplayers();
int playercount=0;
int totaltime=0;
int nowtime = (int) (System.currentTimeMillis()/ 1000);
for (WgPlayerserver wgPlayerserver : players) {
	if(!wgPlayerserver.getPlayername().equals("GM") && !wgPlayerserver.getPlayername().equals("系统邮件")){
		WgPlayerserver4 wg4 = wgPlayerserver.getWgPlayerserver4();
		if(wg4.getActivityonlinetime()!=null&&wg4.getActivityonlinetime2()!=null){
			int time =  nowtime - wg4.getActivityonlinetime();
			if(time>86400){
				continue;
			}
		if(wgPlayerserver.isIslogin()){
			totaltime += (wg4.getActivityonlinetime2() + time);
		}else{
			totaltime +=wg4.getActivityonlinetime2();
		}
		playercount++;
		}
	}
}
out.println("总在线时长"+totaltime+"秒");
out.println("今日上线人数"+playercount+"个");
int time=0;
if(playercount>0){
	time=(totaltime/playercount/60);
}
JacksonManager jm = JacksonManager.getInstance();
ObjectNode json = jm.createObjectNode();
json.putPOJO(sid+"", time);
String result2=jm.toJson(json);
out.print(result2);
%>

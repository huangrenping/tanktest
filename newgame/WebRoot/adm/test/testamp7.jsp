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
String weburl=servers.getWeburl();
String gamestr="";
try {
	String url=weburl+"/Test2/xiaohaoinfo?serverid="+sid;
	out.println("xiaohaoinfo---url="+url);
	gamestr=SendgetManager.SendGET(url);
	
} catch (Exception e) {
	out.println("xiaohaoinfo---error");
}
if(gamestr.equals("")||gamestr.equals("null")){
	out.println("xiaohaoinfo---return");
	return;
}
Map<String, String> mapdd = new HashMap<String, String>();
mapdd = Game.getInstance().getGson().fromJson(gamestr, new TypeToken<HashMap<String, String>>() {
}.getType());
PlayerManager playerManager = PlayerManager.getInstance();
if(mapdd!=null&&mapdd.size()>0){
	for (String string : mapdd.keySet()) {
		Long playerid = playerManager.getplayerid(string);
		if(playerid!=null){
	WgPlayerserver getplayer = playerManager.getplayer(playerid);
	if(getplayer!=null){
		out.println(string+"xiaohaoinfo"+"1000024:100,"+mapdd.get(string));
		/*String content = "亲爱的小主，由于上次宴会排行积分未被清除，本次的宴会排行活动我们会重置排名与积分。给您来不便非常的抱歉！我们会把宴会排行活动持续时间延长一天（到7月27日结束），同时为您发放补偿，以及今天（7月20日）消耗的家宴邀请函、官宴邀请函及贺礼。感谢小主一直以来对我们游戏的支持！";
		try {
			if(mapdd.get(string)!=null&&!mapdd.get(string).equals("")){
				//MailManager.getInstance().fulisendmail("系统邮件", "系统邮件", content, "1000024:100,"+mapdd.get(string), (long) -1,playerid, 1);
			}else{
				
			}
		} catch (Exception e) {
			out.println("xiaohaoinfo---Exception");
		}*/
	}
		}
		
	}
}
//Map<String, String> mapdd = new HashMap<String, String>();
//mapdd.put("早上好", "110:5,120:2");
//System.out.println(Game.getInstance().getGson().toJson(mapdd));
//out.print("补发完毕");
%>

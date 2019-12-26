<%@page import="web.webSocket.plot.PlotManager"%>
<%@ page language="java" import="java.util.*,
java.text.*,
web.webSocket.pojo.*,
web.webSocket.util.*,
web.webSocket.player.PlayerManager,
web.webSocket.activity.ActivityManager,
web.webSocket.card.CardManager,
web.webSocket.plot.Chapter,
web.webSocket.plot.PlotManager,
web.webSocket.arena.ArenaManager,
web.webSocket.arena.Arenaplayer,
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
String content = "各位亲爱的小主：\n自《浩天奇缘》H5开测以来，得到各位小主的大力支持和热爱，我们很高兴能够陪伴各位小主将近2个月的时光。\n因业务调整，经协商，我们遗憾宣布《浩天奇缘》H5将在应用宝做停服处理。具体的安排如下：\n2019年10月15日12点关闭游戏注册、游戏充值和新角色创建。"
		+ "\n2019年10月31日12点游戏正式下架，关闭服务器，届时将无法登录。\n游戏服务器关闭后，服务器内有关游戏的所有帐号数据及角色资料等信息将被全部清空。\n感谢各位小主对我们游戏的支持，也敬请期待我们后续新的游戏力作~";
for (WgPlayerserver getplayer : getplayers) {
	if (!getplayer.getPlayername().equals("GM") && !getplayer.getPlayername().equals("系统邮件")) {
		if(getplayer.getChannel()!=null&&getplayer.getChannel().equals("yingyongbao")){
			MailManager.getInstance().fulisendmail(Translate.systemmessage7, Translate.commonmessage5, content, "", (long) -1, getplayer.getServeruid(), 1);
		}
	}
}
out.print("发送完毕");
%>

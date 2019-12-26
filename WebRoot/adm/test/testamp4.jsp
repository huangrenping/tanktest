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
web.webSocket.pojo.WgPlayerserver8,
web.webSocket.activity2.Activity2Manager,
web.webSocket.player.PlayerManager,
web.webSocket.mail.MailManager,
web.webSocket.card.Card" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
WgPlayerserver[] getplayers = PlayerManager.getInstance().getplayers();
for (WgPlayerserver wg : getplayers) {
	WgPlayerserver9 wg9 = wg.getWgPlayerserver9();
	List<Integer> funStatu = wg9.findFunctionStatu(Activity2Manager.functionNumber1);
	if(funStatu.size()>=8){
		if(funStatu.get(7)==2){
			String content = "亲爱的小主，为您补发终身充值10万钻石档奖励，请您尽快领取哦！";
			try {
				MailManager.getInstance().fulisendmail("系统邮件", "系统邮件", content, "1002658:1", (long) -1,
						wg.getServeruid(), 1);
			} catch (Exception e) {
				out.print("error====="+wg.getPlayername()+"错误");
			}
		}
	}
}
out.print("补发完毕");
%>

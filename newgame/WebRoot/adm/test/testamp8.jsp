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
PlayerManager playerManager = PlayerManager.getInstance();
WgPlayerserver[] getplayers = playerManager.getplayers();
for (WgPlayerserver getplayer : getplayers) {
	if(getplayer.isIslogin()){
		List<WgMail> list=getplayer.getMail().getWgMaillist();
	 for (WgMail wgMail : list) {
		 if(wgMail.getContent().equals("亲爱的小主，由于上次宴会排行积分未被清除，本次的宴会排行活动我们会重置排名与积分。给您来不便非常的抱歉！我们会把宴会排行活动持续时间延长一天（到7月27日结束），同时为您发放补偿，以及今天（7月20日）消耗的家宴邀请函、官宴邀请函及贺礼。感谢小主一直以来对我们游戏的支持！")){
				System.out.println(wgMail.getUid()+"==="+wgMail.getContent());
			}
	}
	}
	List<WgMail> maillist = getplayer.getMaillist();
	for (WgMail wgMail : maillist) {
		if(wgMail.getContent().equals("亲爱的小主，由于上次宴会排行积分未被清除，本次的宴会排行活动我们会重置排名与积分。给您来不便非常的抱歉！我们会把宴会排行活动持续时间延长一天（到7月27日结束），同时为您发放补偿，以及今天（7月20日）消耗的家宴邀请函、官宴邀请函及贺礼。感谢小主一直以来对我们游戏的支持！")){
			System.out.println(wgMail.getUid()+"==="+wgMail.getContent());
		}
	}
}
%>

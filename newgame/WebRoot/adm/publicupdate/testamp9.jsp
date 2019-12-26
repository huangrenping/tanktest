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
web.webSocket.hangup.WgHangup2,
web.webSocket.hangup.HangupManager,
web.webSocket.mail.MailManager,
web.webSocket.card.Card" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
WgPlayerserver[] getplayers = PlayerManager.getInstance().getplayers();
		for (WgPlayerserver wgPlayerserver : getplayers) {
			if (wgPlayerserver != null && !wgPlayerserver.getPlayername().equals("GM")
					&& !wgPlayerserver.getPlayername().equals("系统邮件")) {
				WgHangup2 wgHangup2 = wgPlayerserver.getWgHangup2();
				if (wgHangup2 != null) {
					WgHangup wgHangup = wgHangup2.getHangups();
					if (wgHangup != null) {
						if (wgHangup.getUsenum() > 0 && wgHangup.getFirsttime() == 0) {
							wgHangup2.changeVersion(wgPlayerserver.getServeruid());
							int usenum = wgHangup.getUsenum() - HangupManager.dayFreeMaxNum;
							String artids = "1000024:50";
							if (usenum > 0) {
								usenum += 1;
								artids += ","+HangupManager.aid + ":" + usenum;
							}
							wgHangup.setUsenum(0);
							wgHangup.setStatu(0);
							wgHangup.setRewardstatus(new ArrayList<Integer>());
							String content = "亲爱的小主，由于给您来不便非常的抱歉！我们为您发放补偿。感谢小主一直以来对我们游戏的支持！";
							try {
								MailManager.getInstance().fulisendmail("系统邮件", "系统邮件", content, artids, (long) -1,
										wgPlayerserver.getServeruid(), 1);
										out.print("重置完毕====="+wgPlayerserver.getPlayername());
							} catch (Exception e) {
							out.print("error====="+wgPlayerserver.getServeruid());
							}
						}
					}
				}
			}
		}
		out.print("执行完毕");
//out.print("chapterlist====="+chapterlist);
%>

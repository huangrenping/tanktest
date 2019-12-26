<%@page import="com.sun.tools.doclets.internal.toolkit.util.DocFinder.Output"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "java.util.List"%>
<%@ page import = "web.webSocket.activity.ActivityManager"%>
<%@ page import = "web.webSocket.activity.WgPlayerservernew6"%>
<%@ page import = "web.webSocket.player.PlayerManager"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver7"%>
<%@ page import = "web.webSocket.common.Publicmain"%>


<% 
		WgPlayerserver wgplayers[]=PlayerManager.getInstance().getplayers();
		for (WgPlayerserver player : wgplayers) {
			WgPlayerserver7 wgPlayerserver7 = player.getWgPlayerserver7();
			if (player != null && player.getCookingRanking() != 0) {
				out.println(wgPlayerserver7.getTotalcookingscore()+"---"+player.getCookingRanking());
			}
		}
		
		List<WgPlayerservernew6> cookingContestList = ActivityManager.getInstance().getCookingContestList();
		for (WgPlayerservernew6 wgPlayerservernew6 : cookingContestList) {
			out.println(wgPlayerservernew6.getRanking()+"---"+wgPlayerservernew6.getServeruid()+"<br>");
		}
		Publicmain.getInstance().sendCookingContestReward(ActivityManager.cookingContestActivity);
		out.println("success---<br>");
		for (WgPlayerserver player : wgplayers) {
			WgPlayerserver7 wgPlayerserver7 = player.getWgPlayerserver7();
			if (player != null && player.getCookingRanking() != 0) {
				out.println(wgPlayerserver7.getTotalcookingscore()+"---"+player.getCookingRanking());
			}
		}
		out.println("success");
%>
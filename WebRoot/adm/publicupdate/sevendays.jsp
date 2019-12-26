<%@page import="com.sun.tools.doclets.internal.toolkit.util.DocFinder.Output"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "web.webSocket.player.PlayerManager"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver"%>
<%@ page import = "web.webSocket.util.Util"%>
<%
		
	PlayerManager playerManager = PlayerManager.getInstance();
	WgPlayerserver[] getplayers = playerManager.getplayers();
	String s1=Util.getDate(System.currentTimeMillis(), 2);
    long lingchen=Util.getLongTime(s1,1);//当前凌晨的时间
	for (WgPlayerserver player : getplayers) {
		if(player!=null && !player.getPlayername().equals("GM") && !player.getPlayername().equals("系统邮件")){
				if(!player.isIslogin() && player.getLogintime()!=null && player.getLogintime()>lingchen){
					player.getWgPlayerserver4().setActivityonlinetime(null);
				}
		}
	}
	out.println("执行完毕");
%>
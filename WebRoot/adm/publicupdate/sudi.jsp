<%@page import="com.sun.tools.doclets.internal.toolkit.util.DocFinder.Output"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "web.webSocket.player.PlayerManager"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver"%>

<%
		
	PlayerManager playerManager = PlayerManager.getInstance();
	WgPlayerserver[] getplayers = playerManager.getplayers();
	
	for (WgPlayerserver player : getplayers) {
		if(!player.getPlayername().equals("GM") && !player.getPlayername().equals("系统邮件")){
			int sudinum = player.getWgPlayerserver4().getSudinum();
			if(sudinum!=0){
				player.getWgPlayerserver4().setSudinum(0);
			}
		}
	}
	out.println("执行完毕");
%>
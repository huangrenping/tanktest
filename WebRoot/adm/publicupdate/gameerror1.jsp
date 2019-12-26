<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.Iterator"%>
<%@ page import = "java.util.Map"%>

<%@ page import = "org.springframework.web.socket.WebSocketSession"%>

<%@ page import = "web.webSocket.common.Game"%>
<%@ page import = "web.webSocket.handler.SystemWebSocketHandler"%>
<%@ page import = "web.webSocket.player.PlayerManager"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver"%>
<%
		long time=System.currentTimeMillis();
		WgPlayerserver[] players=PlayerManager.getInstance().getplayers();		
		for (WgPlayerserver wgPlayerserver : players) {
			out.println("-------------------"+wgPlayerserver.getServeruid());
			wgPlayerserver.heartBeat(time, false);
		}
%>


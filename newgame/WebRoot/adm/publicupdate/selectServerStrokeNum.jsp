<%@page import="web.webSocket.plot.PlotManager"%>
<%@ page language="java" import="java.util.*,
web.webSocket.player.PlayerManager,
web.webSocket.pojo.*,
web.webSocket.activity.ActivityManager,
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
out.print(sid);
ServerStrokeNum SSN=PlayerManager.getInstance().sendServerStrokeNum();
JacksonManager jm = JacksonManager.getInstance();
ObjectNode json = jm.createObjectNode();
json.putPOJO("data", SSN);
String result2=jm.toJson(json);
out.print(result2);
%>

<%@page import="web.webSocket.plot.PlotManager"%>
<%@ page language="java" import="java.util.*,
web.webSocket.player.PlayerManager,
web.webSocket.pojo.WgPlayerserver,
web.webSocket.pojo.WgPlayerserver2,
web.webSocket.pojo.WgPlayerserver3,
web.webSocket.activity.ActivityManager,
web.webSocket.pojo.WgMain2,
web.webSocket.card.CardManager,
web.webSocket.plot.Chapter,
web.webSocket.plot.PlotManager,
web.webSocket.arena.ArenaManager,
web.webSocket.arena.Arenaplayer,
web.webSocket.pojo.WgPlayerserver8,
web.webSocket.card.Card" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
String [] strs={"311,373,376","374,314","371,316","375,372","319,320","321,322","323,324","325,326"};//轮循礼包
ActivityManager.limitlibaosuperbagid=	strs;
ActivityManager.weeklibaosuperbagid="301,302";//周末礼包
ActivityManager.lifelibaosuperbagid="350,351,293,352,296,297,298,299,300,303,353,354";//终生礼包
out.print("changeover");
%>

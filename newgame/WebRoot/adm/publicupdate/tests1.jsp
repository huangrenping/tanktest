<%@page import="web.webSocket.arena.ArenaManager"%>
<%@page import="com.sun.tools.doclets.internal.toolkit.util.DocFinder.Output"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "web.webSocket.article.Article"%>
<%@ page import = "java.util.Map"%>
<%@ page import = "web.webSocket.company.Company"%>
<%@ page import = "web.webSocket.player.PlayerManager"%>
<%@ page import = "web.webSocket.pojo.WgCompany"%>
<%@ page import = "web.webSocket.food.FoodManager"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver8"%>
<%@ page import = "web.webSocket.mail.MailManager"%>
<%@ page import = "web.webSocket.mail.MailManager"%>
<%@ page import = "web.webSocket.arena.Arenaplayer"%>
<%@ page import = "web.webSocket.arena.ArenaManager"%>


<%  
	long id=1077100000004025l;
	WgPlayerserver wgPlayerserver = PlayerManager.getInstance().getplayer(1077100000004025l);
	Arenaplayer arenaplayer=ArenaManager.getInstance().getAreanplayer(id);
	arenaplayer.setRanking(1);
	wgPlayerserver.getWgArenamain().setRanking(1);
	
	
	out.println(arenaplayer.getRanking()+"----");
	
%>
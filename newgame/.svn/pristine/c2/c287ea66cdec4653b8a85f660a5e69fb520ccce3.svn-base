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
<%@ page import = "web.webSocket.answer.AnswerManager"%>
<%@ page import = "java.util.List"%>

<% 
		/*out.println("----");
		long playerid=1020200000004369l;
		WgPlayerserver wg=PlayerManager.getInstance().getplayer(playerid);
		out.println(wg.getAnswerstatus());
		out.println(wg.getWgPlayerserver3().getOfficertime());
		Long officertime = wg.getWgPlayerserver3().getOfficertime();
		
		//wg.getWgPlayerserver3().setOfficertime(System.currentTimeMillis());
		out.println(officertime-System.currentTimeMillis());*/
		
		List<WgPlayerserver> list=AnswerManager.getInstance().getPlayers();
		out.println(list.size());
		
	    for (WgPlayerserver wgPlayerserver : list) {
			out.println(wgPlayerserver.getServeruid()+"--"+wgPlayerserver.getUsername()+"-"+wgPlayerserver.getAnswerstatus()+"-"+wgPlayerserver.getWgPlayerserver3().getOfficertime()+"<br>");
		}
		
	    Thread thread=new Thread(AnswerManager.getInstance(),"AnswerManager");
		thread.start();
		
		

	
%>
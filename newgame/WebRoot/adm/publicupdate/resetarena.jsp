<%@page import="com.sun.tools.doclets.internal.toolkit.util.DocFinder.Output"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "java.util.List"%>
<%@ page import = "java.util.Map"%>
<%@ page import = "web.webSocket.arena.ArenaManager"%>
<%@ page import = "web.webSocket.arena.Arenaplayer"%>


<% 
		ArenaManager arenaManager=ArenaManager.getInstance();
		Map<Integer,List<Arenaplayer>> maphuodongplayers=arenaManager.getMaphuodongplayers();
		
		
		
		
		
		//maphuodongplayers.clear();
		List<Arenaplayer> huodongplayers=arenaManager.getHuodongplayers();
		for (Arenaplayer arenaplayer : huodongplayers) {
			out.println(arenaplayer.getScore());
			//arenaManager.addmaphuodong(arenaplayer,1);
		}

	
%>
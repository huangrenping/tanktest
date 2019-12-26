<%@page import="com.sun.tools.doclets.internal.toolkit.util.DocFinder.Output"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "java.util.ArrayList"%>
<%@ page import = "web.webSocket.arena.ArenaManager"%>
<%@ page import = "web.webSocket.player.PlayerManager"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver3"%>



<% 
		ArenaManager.getInstance().setOpencross(1);
		ArenaManager.getInstance().setThememessage(null);
		ArenaManager.getInstance().setListtop(null);
		WgPlayerserver[] wgplayers=PlayerManager.getInstance().getplayers();
		/*for (WgPlayerserver wgPlayerserver : wgplayers) {
			
			WgPlayerserver3 wgPlayerserver3 =wgPlayerserver.getWgPlayerserver3();
			
			wgPlayerserver3.setCrossserversignin(0);
			wgPlayerserver3.setCrossplayerids("");
			
			
			wgPlayerserver3.setCrossbuynum(0);
			wgPlayerserver3.setCrosschallengenum(0);
			wgPlayerserver3.setCrosscard("");
			wgPlayerserver3.setCrossclothes("");
			
			wgPlayerserver3.getCrosspraiselist().clear();
			wgPlayerserver3.setCrosspraiselist(new ArrayList<Long>());
		}*/
		out.println("success");

%>
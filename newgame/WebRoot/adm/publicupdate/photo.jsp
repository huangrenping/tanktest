<%@page import="com.sun.tools.doclets.internal.toolkit.util.DocFinder.Output"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ page import = "web.webSocket.player.PlayerManager"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver"%>


<% 
		WgPlayerserver[] wgplayers=PlayerManager.getInstance().getplayers();
		for (WgPlayerserver wgPlayerserver : wgplayers) {
			if(wgPlayerserver.isIslogin()==true){
				int checkhost=wgPlayerserver.getWgPlayerserver2().getCheckhost();
				if(checkhost==0){
					wgPlayerserver.getWgPlayerserver2().setCheckhost(1);
					wgPlayerserver.getWgPlayerserver2().setDirty(true);
				}
			}
		}
	out.println("success");

	
%>
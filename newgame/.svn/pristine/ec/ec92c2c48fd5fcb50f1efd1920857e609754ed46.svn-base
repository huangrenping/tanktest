<%@page import="com.sun.tools.doclets.internal.toolkit.util.DocFinder.Output"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "web.webSocket.player.PlayerManager"%>
<%@ page import = "web.webSocket.pojo.WgHangup"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver"%>
<%@ page import = "web.webSocket.message.MessageManager"%>


<% 
		long time=System.currentTimeMillis();
		WgPlayerserver[] wgplayers=PlayerManager.getInstance().getplayers();
		for (WgPlayerserver wgPlayerserver : wgplayers) {
		   if(wgPlayerserver.getUseropen3()>=5){
		   	continue;
		   }
		
			wgPlayerserver.resetData(time, 1);
			wgPlayerserver.resetData2(time);
			if(wgPlayerserver.getWgHangup2()!=null){
				WgHangup hangups = wgPlayerserver.getWgHangup2().getHangups();
				if(hangups!=null){
					hangups.resetData2();
				}
			}
			wgPlayerserver.getWgPlayerserver2().setPhysicalnum(1);
			MessageManager.pushred(11, wgPlayerserver, 1);
		}
		out.println("success");

	
%>
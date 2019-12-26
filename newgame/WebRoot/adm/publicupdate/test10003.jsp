<%@page import="com.sun.tools.doclets.internal.toolkit.util.DocFinder.Output"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "java.util.ArrayList"%>
<%@ page import = "java.util.List"%>
<%@ page import = "web.webSocket.card.CardManager"%>
<%@ page import = "web.webSocket.player.PlayerManager"%>
<%@ page import = "web.webSocket.pojo.WgPlayercard"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver"%>


<% 
		long playerid=1077600000000962l;
		WgPlayerserver wg=PlayerManager.getInstance().getplayer(playerid);
		List<WgPlayercard>  list=wg.getCard().getWgcardlist();
		for (WgPlayercard wgPlayercard : list) {
			if(wgPlayercard.getCardid()==32018){
				wgPlayercard.setIschapterred(0);
				CardManager.getInstance().uphongdian(playerid);
			}
		}
		out.println("success");
%>
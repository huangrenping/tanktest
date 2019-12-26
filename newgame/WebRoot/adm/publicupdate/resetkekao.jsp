<%@page import="com.sun.tools.doclets.internal.toolkit.util.DocFinder.Output"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "web.webSocket.player.PlayerManager"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver3"%>
<%@ page import = "web.webSocket.answer.AnswerManager"%>

<%
	WgPlayerserver[] getplayers = PlayerManager.getInstance().getplayers();
	for (WgPlayerserver wgPlayerserver : getplayers) {
		if(!wgPlayerserver.getPlayername().equals("GM") && !wgPlayerserver.getPlayername().equals("系统邮件")){
			WgPlayerserver3 wg3 = wgPlayerserver.getWgPlayerserver3();
	    	wgPlayerserver.setAnswerEverydayranking(0);
	    	if(wg3.getOfficereeverydayscore()>0){
				wg3.setOfficereeverydayscore(0);
				wg3.setDirty(true);
				wgPlayerserver.setAnswerEverydayranking(0);
			}
		}
	}
	AnswerManager.getInstance().getAnswerEverydayScoreList().clear();
	out.print("success");
%>
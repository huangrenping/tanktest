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

<% 
	WgPlayerserver[] getplayers = PlayerManager.getInstance().getplayers();
	for (WgPlayerserver wgPlayerserver : getplayers) {
		if(!wgPlayerserver.getPlayername().equals("GM") && !wgPlayerserver.getPlayername().equals("系统邮件")){
			if(wgPlayerserver.getMaxcheckpoint()!=null&&wgPlayerserver.getMaxcheckpoint().equals("33:463")){
				wgPlayerserver.getPlot().getListsection(32);
				wgPlayerserver.getPlot().getListchapter();
				wgPlayerserver.getPlot().opennextsection(32, 462, 463);
				out.print("玩家id:"+wgPlayerserver.getServeruid());
				System.err.println("玩家id:"+wgPlayerserver.getServeruid());
				out.print("success");
			}
			
		}
	}

	
%>
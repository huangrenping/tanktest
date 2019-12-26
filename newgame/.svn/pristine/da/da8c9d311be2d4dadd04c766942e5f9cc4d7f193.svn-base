<%@page import="web.webSocket.card.Card"%>
<%@page import="web.webSocket.card.CardManager"%>
<%@page import="web.webSocket.pojo.WgPlayercard"%>
<%@page import="java.util.List"%>
<%@page import="web.webSocket.card.Wgcard"%>
<%@page import="web.webSocket.player.PlayerManager"%>
<%@page import="web.webSocket.pojo.WgPlayerserver"%>
<%@page import="com.sun.tools.doclets.internal.toolkit.util.DocFinder.Output"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% 
		int count = 0;
		WgPlayerserver[] wgplayers=PlayerManager.getInstance().getplayers();
		for (WgPlayerserver wgPlayerserver : wgplayers) {
			if(wgPlayerserver!=null){
					Wgcard card=wgPlayerserver.getCard2();
					if(card!=null){
						if(card.getPutongcardnum()>0){
							List<WgPlayercard> wgcardlist=card.getWgcardlist();
							for (WgPlayercard wgPlayercard : wgcardlist) {
								Card card2=CardManager.getInstance().getcardone(wgPlayercard.getCardid());
								int grade = wgPlayercard.getGrade();
								if(wgPlayercard.getGrowupnum()>0){
									//上一个成长所需的等级是否和当前等级一致
									int nextgrde=CardManager.growupneedlv[card2.getQuality()][wgPlayercard.getGrowupnum()-1];
									if(grade==nextgrde){
										count++;
										wgPlayercard.setState(1);
										//out.println("uid:"+wgPlayercard.getUid()+"lid:"+wgPlayercard.getLid()+"<br>");
									}
								}
							}
						}
					}
				
				
			}
			
		}
		out.println("count:"+count+"<br>");
		out.println("success");
%>
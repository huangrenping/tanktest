<%@page import="com.sun.tools.doclets.internal.toolkit.util.DocFinder.Output"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "java.util.List"%>
<%@ page import = "java.util.Map"%>

<%@ page import = "web.webSocket.player.PlayerManager"%>
<%@ page import = "web.webSocket.pojo.WgPlayercard"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver"%>



<% 
 		long nowtime=System.currentTimeMillis();
		WgPlayerserver[] wgplayers=PlayerManager.getInstance().getplayers();
		for (WgPlayerserver wgPlayerserver : wgplayers) {
			if(wgPlayerserver.isIslogin()==true && wgPlayerserver.getLogintime()!=null && nowtime-wgPlayerserver.getLogintime()>30*1000){
				if(wgPlayerserver.getCard2()!=null){
					int num=0;
					List<WgPlayercard> listcard=wgPlayerserver.getCard().getWgcardlist();
					for (WgPlayercard wgPlayercard : listcard) {
						if(wgPlayercard.getType()==0){
							num++;
						}
					}
					wgPlayerserver.getCard().setPutongcardnum(num);
					wgPlayerserver.getWgPlayerserver7().setAllcardnum(num);
				}
			}
		}
		out.println("success1");
%>
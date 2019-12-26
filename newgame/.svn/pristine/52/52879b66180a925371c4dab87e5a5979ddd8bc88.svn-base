<%@page import="com.sun.tools.doclets.internal.toolkit.util.DocFinder.Output"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "web.webSocket.activity.ActivityManager"%>
<%@ page import = "web.webSocket.activity.Huodong"%>
<%@ page import = "web.webSocket.activity2.Activity2Manager"%>
<%@ page import = "web.webSocket.message.MessageManager"%>
<%@ page import = "web.webSocket.player.PlayerManager"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver"%>
<%@ page import = "web.webSocket.util.Util"%>


<% 
		int flag=0;
		Huodong huodong=ActivityManager.getInstance().getHuodongmap().get(Activity2Manager.kfcardActivity);
		if(huodong!=null){//累计消费；
			if(!Util.isOpenTime(huodong.getStarttime(), huodong.getEndtime())){
				flag=1;
			}
		WgPlayerserver[] wgplayerservers=PlayerManager.getInstance().getplayers();
		if(flag==1){	
		for (WgPlayerserver wgPlayerserver : wgplayerservers) {
				if(wgPlayerserver.getWgPlayerserver8().getKfcardpresent()==0){
					wgPlayerserver.getWgPlayerserver8().setKfcardpresent(1);
				}
				if(wgPlayerserver.isIslogin()){
					MessageManager.pushred(83, wgPlayerserver, 0);
				}
			}
		}
	}
	out.println("success");

	
%>
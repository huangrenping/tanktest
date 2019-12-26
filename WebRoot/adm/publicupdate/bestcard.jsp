<%@page import="com.sun.tools.doclets.internal.toolkit.util.DocFinder.Output"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "web.webSocket.card.Wgcard"%>
<%@ page import = "web.webSocket.common.Publicmain"%>
<%@ page import = "web.webSocket.player.PlayerManager"%>
<%@ page import = "web.webSocket.pojo.WgMain2"%>
<%@ page import = "web.webSocket.pojo.WgPlayercard"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver7"%>



<% 
		PlayerManager playerManager=PlayerManager.getInstance();
		WgMain2 wgMain2=Publicmain.getInstance().getWgMain2();
		if(wgMain2.getRankinginfo()!=null && !wgMain2.getRankinginfo().equals("")){
			String[] rankinginfo=wgMain2.getRankinginfo().split("@");
			for (int i = 0; i <rankinginfo.length ; i++) {
				if(i == 3){
					String[] rankinginfo2=rankinginfo[i].split(",");
					for (int j = 0; j < rankinginfo2.length; j++) {
						//serveruid:num:time
						String[] rankinginfo3=rankinginfo2[j].split(":");
						long uid=Long.valueOf(rankinginfo3[0]);
						WgPlayerserver duplayer=playerManager.getplayer(uid);
						WgPlayerserver7 wgPlayerserver7=duplayer.getWgPlayerserver7();
						Wgcard wgcard = duplayer.getCard();
						int bestCard = wgcard.getBestCard();
						if(bestCard!=0){
							wgPlayerserver7.setBestpowercard(bestCard);
							WgPlayercard getcard = wgcard.getcard(bestCard);
							if(getcard!=null){
								int shili=getcard.getTastetotal()+getcard.getDispositiontotal()+getcard.getPracticalitytotal()+getcard.getTemperamenttotal();
								out.println(duplayer.getPlayername()+"-----"+shili+"<br>");
								wgPlayerserver7.setBestpowercardshili(shili);
								wgPlayerserver7.dirty=true;
							}
						}else{
							wgPlayerserver7.setBestpowercard(-1);
							wgPlayerserver7.dirty=true;
						}
					}
				}
			}
		}
		
		out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@<br>");
				//在线玩家最强卡；
		
		WgPlayerserver wgPlayerserver[]=PlayerManager.getInstance().getplayers();
		for (WgPlayerserver duplayer : wgPlayerserver) {
			if(duplayer!=null && duplayer.isIslogin()){
				WgPlayerserver7 wgPlayerserver7=duplayer.getWgPlayerserver7();
				Wgcard wgcard = duplayer.getCard();
				int bestCard = wgcard.getBestCard();
				if(bestCard!=0){
					wgPlayerserver7.setBestpowercard(bestCard);
					WgPlayercard getcard = wgcard.getcard(bestCard);
					if(getcard!=null){
						int shili=getcard.getTastetotal()+getcard.getDispositiontotal()+getcard.getPracticalitytotal()+getcard.getTemperamenttotal();
						out.println(duplayer.getPlayername()+"-----"+shili+"<br>");
						wgPlayerserver7.setBestpowercardshili(shili);
						wgPlayerserver7.dirty=true;
					}
				}else{
					wgPlayerserver7.setBestpowercard(-1);
					wgPlayerserver7.dirty=true;
				}
			}
		}
		out.println("success");
%>
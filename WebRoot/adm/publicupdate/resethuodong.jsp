<%@page import="com.sun.tools.doclets.internal.toolkit.util.DocFinder.Output"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "java.util.ArrayList"%>

<%@ page import = "web.webSocket.activity.ActivityManager"%>
<%@ page import = "web.webSocket.activity.Huodong"%>
<%@ page import = "web.webSocket.player.PlayerManager"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver3"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver7"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver8"%>
<%@ page import = "web.webSocket.util.Util"%>


<% 
		int flag=0;
		int flag1=0;
		int flag2=0;
		Huodong huodong=ActivityManager.getInstance().getHuodongmap().get(62);
		if(!Util.isOpenTime(huodong.getStarttime(), huodong.getEndtime())){
			flag=1;
			out.println("---62<br>");
		}else{
			out.println("---62--open<br>");
		};
		huodong=ActivityManager.getInstance().getHuodongmap().get(59);
		if(!Util.isOpenTime(huodong.getStarttime(), huodong.getEndtime())){
			flag1=1;
			out.println("---59<br>");
		}else{
			out.println("---59--open<br>");
		};
		
		huodong=ActivityManager.getInstance().getHuodongmap().get(32);
		if(!Util.isOpenTime(huodong.getStarttime(), huodong.getEndtime())){
			flag2=1;
			out.println("---32<br>");
		}else{
			out.println("---32--open<br>");
		};;
		
		WgPlayerserver[] getplayers = PlayerManager.getInstance().getplayers();
		for (WgPlayerserver wgPlayerserver : getplayers) {
			if(!wgPlayerserver.getPlayername().equals("GM") && !wgPlayerserver.getPlayername().equals("系统邮件")){
				//玉佩活动；
				if(flag==1){
					WgPlayerserver8 playerserver8 = wgPlayerserver.getWgPlayerserver8();
					playerserver8.setUseyupeirewards(new ArrayList<Integer>());
					playerserver8.setTotaluseyupei(0);
					playerserver8.setDirty(true);
				}
				if(flag1==1){
		  			wgPlayerserver.setPkranking(0);
		  			WgPlayerserver3 playerserver3 = wgPlayerserver.getWgPlayerserver3();
		  			playerserver3.setPkscore(0);
		  			playerserver3.setDirty(true);
				}
				if(flag2==1){
					WgPlayerserver7 wgPlayerserver7 = wgPlayerserver.getWgPlayerserver7();
					wgPlayerserver7.setJiayanhdscore(0);
					wgPlayerserver.setJiayanHDscore(0);
					wgPlayerserver.setJiayanHDranking(0);
				}
			}
		}

	
%>
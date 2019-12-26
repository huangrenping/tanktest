<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
import="
web.webSocket.cardplot.CardPlotManager,
web.webSocket.player.PlayerManager,
web.webSocket.pojo.WgPlayerserver,
web.webSocket.pojo.WgPlayerserver7
"%>
<%
		int count=0;
		long currenttime=System.currentTimeMillis();
		WgPlayerserver[] wgplayerservers=PlayerManager.getInstance().getplayers();
		for (WgPlayerserver wgPlayerserver : wgplayerservers) {
			if(!wgPlayerserver.getPlayername().equals("GM") && !wgPlayerserver.getPlayername().equals("系统邮件")){
				WgPlayerserver7 wgPlayerserver7=wgPlayerserver.getWgPlayerserver7two();
				if(wgPlayerserver7!=null){
			    	int yupeihuifutime=CardPlotManager.yupeihuifu;
			    	if(wgPlayerserver7.getYupei()<CardPlotManager.maxwgyupei){
			    	int flag=0;
			    		while (currenttime >= wgPlayerserver7.getYupeilasttime() + yupeihuifutime * 60 * 1000) {
			    		flag=1;
			    			int add =1;
			    			wgPlayerserver7.setYupeilasttime(wgPlayerserver7.getYupeilasttime() + yupeihuifutime * 60 * 1000);
			    			if (wgPlayerserver7.getYupei() < 0) {
			    				wgPlayerserver7.setYupei(0);
			    			}
			    			if (wgPlayerserver7.getYupei() < CardPlotManager.maxwgyupei) {
			    				if (wgPlayerserver7.getYupei() + add >= CardPlotManager.maxwgyupei) {
			    					wgPlayerserver7.setYupei(CardPlotManager.maxwgyupei);
			    				} else {
			    					wgPlayerserver7.setYupei(wgPlayerserver7.getYupei() + add);
			    				}
			    				//out.println(wgPlayerserver7.getYupei()+"---"+wgPlayerserver.getServeruid()+"<br>");
			    			}
			    		}
			    		if(flag==1){
			    		count++;
			    		}
			    	}
				}
			}
		}
		out.println("success"+count);
%>


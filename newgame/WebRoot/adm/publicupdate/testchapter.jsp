<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.List"%>
<%@ page import = "web.webSocket.player.PlayerManager"%>

<%@ page import = "web.webSocket.pojo.WgPlayerserver"%>
<%@ page import = "web.webSocket.player.PlayerManager"%>
<%@ page import = "web.webSocket.pojo.WgPlotchapter"%>
<%@ page import = "web.webSocket.util.Util"%>
<%
     	 int key=0;
		WgPlayerserver[]  wgplayers=PlayerManager.getInstance().getplayers();
		for (WgPlayerserver wgPlayerserver : wgplayers) {
			String maxcheckpoint=wgPlayerserver.getMaxcheckpoint();
			if(wgPlayerserver.getMaxcheckpoint()!=null && !"".equals(maxcheckpoint)){
				String maxcheckpoints[]=maxcheckpoint.split(":");
				int chapter=Integer.valueOf(maxcheckpoints[0]);
				if(chapter>=3){
					System.out.println(wgPlayerserver.getServeruid()+"------");
					key++;
					List<WgPlotchapter> listchapter=wgPlayerserver.getPlot().getListchapter();
					for (WgPlotchapter wgPlotchapter : listchapter) {
						String s=wgPlotchapter.getStarreward();
						if(s!=null){
							String starrewards[]=s.split(",");
							if(starrewards.length==3){
								/*int sone[]=new int[3];
								if(Integer.valueOf(starrewards[0])==2){
									sone[0]=1;
								}else{
									sone[0]=Integer.valueOf(starrewards[0]);
								}
								if(Integer.valueOf(starrewards[1])==2){
									sone[1]=1;
								}else{
									sone[1]=Integer.valueOf(starrewards[1]);
								}
								sone[2]=Integer.valueOf(starrewards[2]);
								String news= Util.Join(sone,",");
								if(!s.equals(news)){
									wgPlotchapter.setStarreward(news);
								}*/
							}else if(starrewards.length==2){
								int sone[]=new int[2];
								if(Integer.valueOf(starrewards[0])==2){
									sone[0]=1;
								}else{
									sone[0]=Integer.valueOf(starrewards[0]);
								}
								if(Integer.valueOf(starrewards[1])==2){
									sone[1]=1;
								}else{
									sone[1]=Integer.valueOf(starrewards[1]);
								}
								wgPlotchapter.setStarreward(Util.Join(sone,","));
							}else if(starrewards.length==1){
								wgPlotchapter.setStarreward(String.valueOf(1));
							}
						}
					}
				}
			}
		}
		System.out.println(key+"---success--");
		out.println(key+"---success--");
%>


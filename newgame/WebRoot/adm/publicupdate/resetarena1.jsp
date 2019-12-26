<%@page import="com.sun.tools.doclets.internal.toolkit.util.DocFinder.Output"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList"%>
<%@ page import = "java.util.List"%>

<%@ page import = "web.webSocket.arena.ArenaManager"%>
<%@ page import = "web.webSocket.arena.Arenaplayer"%>
<%@ page import = "web.webSocket.player.PlayerManager"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver7"%>
<%@ page import = "web.webSocket.util.Util"%>

<% 
		long playerid=1075900000002581l;
		ArenaManager arenaManager=ArenaManager.getInstance();
		
		WgPlayerserver wgplayerserver=PlayerManager.getInstance().getplayer(playerid);
		WgPlayerserver7 wgPlayerserver7=wgplayerserver.getWgPlayerserver7();
		Arenaplayer arenaplayer=ArenaManager.getInstance().getHuodongmapplayers().get(wgplayerserver.getServeruid());
		List<Long> arenarandomnam=wgPlayerserver7.getArenarandomname();
		int score=arenaplayer.getScore();
		int mapkey=score/100;
		Arenaplayer  drenaplayer=null;
		//System.out.println(win+"####################"+mapkey);
		int win=1;
		if(win==1){
			int size=1;
			while(true){
				List<Arenaplayer> listone=arenaManager.getMaphuodongplayers().get(mapkey-size);
				if(listone!=null && listone.size()>0){
					drenaplayer=listone.get(Util.getRandomInt(0, listone.size()-1));
					if(arenarandomnam.contains(drenaplayer.getServeruid())){
						drenaplayer=null;
					}else{
						break;
					}
				}
				size++;
				//System.out.println(size+"@@@@@@@@@a");
				if(size>20){
					break;
				}
			}
			size=1;
			if(drenaplayer==null){
				while(true){
					List<Arenaplayer> listone=arenaManager.getMaphuodongplayers().get(mapkey+size);
					if(listone!=null && listone.size()>0){
						drenaplayer=listone.get(Util.getRandomInt(0, listone.size()-1));
						if(arenarandomnam.contains(drenaplayer.getServeruid())){
							drenaplayer=null;
						}else{
							break;
						}
					}
					size++;
					//System.out.println(size+"@@@@@@@@@b");
					if(size>20){
						break;
					}
				}
			}
		}else{
			int size=1;
			while(true){
				List<Arenaplayer> listone=arenaManager.getMaphuodongplayers().get(mapkey+size);
				if(listone!=null && listone.size()>0){
					drenaplayer=listone.get(Util.getRandomInt(0, listone.size()-1));
					if(arenarandomnam.contains(drenaplayer.getServeruid())){
						drenaplayer=null;
					}else{
						break;
					}
				}
				size++;
				//System.out.println(size+"@@@@@@@@@c");
				if(size>20){
					break;
				}
			}
			size=1;
			if(drenaplayer==null){
				while(true){
					List<Arenaplayer> listone=arenaManager.getMaphuodongplayers().get(mapkey-size);
					if(listone!=null && listone.size()>0){
						drenaplayer=listone.get(Util.getRandomInt(0, listone.size()-1));
						if(arenarandomnam.contains(drenaplayer.getServeruid())){
							drenaplayer=null;
						}else{
							break;
						}
					}
					size++;
					//System.out.println(size+"@@@@@@@@@d");
					if(size>20){
						break;
					}
				}
			}
		}
		if(drenaplayer==null){
			//拿自己同级的；
			List<Arenaplayer> listone=arenaManager.getMaphuodongplayers().get(mapkey);
			List<Arenaplayer> listtow=new ArrayList<Arenaplayer>();
			if(listone!=null){
				for (Arenaplayer arenaplayer2 : listone) {
				arenaplayer2.set
				
				
					if(arenaplayer2.getServeruid()!=(long)wgplayerserver.getServeruid()){
						listtow.add(arenaplayer2);
					}
				}
				if(listtow.size()>0){
					drenaplayer=listtow.get(Util.getRandomInt(0, listtow.size()-1));
				}
			}
		}
		if(drenaplayer==null){
			List<Arenaplayer> listall=ArenaManager.getInstance().getHuodongplayers();
			drenaplayer=listall.get(Util.getRandomInt(0, listall.size()-1));
			int k=0;
			while(drenaplayer.getServeruid()==wgplayerserver.getServeruid()){
				k++;
				drenaplayer=listall.get(Util.getRandomInt(0, listall.size()-1));
				//System.out.println(k+"@@@@@@@@@3");
				if(k>10){
					break;
				}
			}
		}
		if(drenaplayer!=null){
			System.out.println(drenaplayer.getServeruid()+"--"+drenaplayer.getPlayername());
		}else{
			System.out.println("#####");
		}
	
%>
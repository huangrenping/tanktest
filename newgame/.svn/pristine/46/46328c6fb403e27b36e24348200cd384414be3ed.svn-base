<%@page import="com.sun.tools.doclets.internal.toolkit.util.DocFinder.Output"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "java.io.IOException"%>
<%@ page import = "java.util.ArrayList"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.Iterator"%>
<%@ page import = "java.util.List"%>
<%@ page import = "java.util.Map"%>

<%@ page import = "org.springframework.web.socket.WebSocketSession"%>

<%@ page import = "web.webSocket.handler.SystemWebSocketHandler"%>
<%@ page import = "web.webSocket.player.PlayerManager"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver"%>


<% 
		WgPlayerserver[] wgplayers=PlayerManager.getInstance().getplayers();
		Map<String,Long> map=new HashMap<String,Long>();
		for (WgPlayerserver wgPlayerserver : wgplayers) {
			if(wgPlayerserver.isIslogin()==true && wgPlayerserver.getWss()!=null){
				map.put(wgPlayerserver.getWss().getId(), wgPlayerserver.getServeruid());
			}
		}
		out.println(map.size()+"------");
		
		Map<String,Long> errormap=SystemWebSocketHandler.getInstance().errormap;
		Map<String,WebSocketSession> sessionmap=SystemWebSocketHandler.getInstance().sessionmap;
		
		long time=System.currentTimeMillis();
		Iterator<Map.Entry<String,Long>> entries = errormap.entrySet().iterator();
		
		//List<String> removes=new ArrayList<String>();
		Map<String,Boolean> removes=new HashMap<String, Boolean>();
		
		while (entries.hasNext()) {
			Map.Entry<String,Long>  entry=entries.next();
			try {
				String wssid=entry.getKey();
				long lasttime=errormap.get(wssid);
				if(time-lasttime>=120*1000){
					//System.out.println("----异常id");
					//removes.add(wssid);
				}else{
					removes.put(wssid, true);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		for (String st : map.keySet()) {
			if(removes.get(st)==null){
				long l=map.get(st);
				WgPlayerserver wgPlayerserver=PlayerManager.getInstance().getplayer(l);
				wgPlayerserver.setIslogin(false);
			}
		}

		out.println(removes.size()+"---@@@@@@---#<br>");
		int sp=0;
		for (String st : map.keySet()) {
			if(removes.get(st)==null){
				long l=map.get(st);
				WgPlayerserver wgPlayerserver=PlayerManager.getInstance().getplayer(l);
				out.println(l+"###############"+wgPlayerserver.getPlayername()+"<br>");
				//System.out.println(l+"###############"+wgPlayerserver.getPlayername()+"<br>");
				sp++;
				SystemWebSocketHandler.getInstance().removeone(wgPlayerserver.getWss());
			}
		}

		out.println("success"+sp);
%>
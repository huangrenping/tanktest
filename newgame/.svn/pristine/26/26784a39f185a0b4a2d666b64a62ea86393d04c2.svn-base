<%@page import="com.sun.tools.doclets.internal.toolkit.util.DocFinder.Output"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "java.util.ArrayList"%>
<%@ page import = "java.util.List"%>

<%@ page import = "web.webSocket.player.PlayerManager"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver3"%>
<%@ page import = "web.webSocket.util.Util"%>




<% 
			WgPlayerserver wgPlayerservers[]=PlayerManager.getInstance().getplayers();
		for (WgPlayerserver wgPlayerserver : wgPlayerservers) {
			WgPlayerserver3 wgplayerserver3=wgPlayerserver.getWgPlayerserver3();
			//if(wgPlayerserver.getServeruid()!=1020300000001503l){
			//continue;
			//}
			String message=wgplayerserver3.getDailymessage();
			if(message==null || message.equals("")){
	    		continue;
	    	}
			//初始化日常任务数据；
	    	String[] messages=message.split(",");
	    	List<String> list=new ArrayList<String>();
	    	
	    	for (int i = 0; i < messages.length; i++) {
	    		if(messages[i]==null || "".equals(messages[i])){
	    			out.println(wgPlayerserver.getPlayername()+"------<br>");
	    		}else{
	    			list.add(messages[i]);
	    		}
			}
	    	String news=Util.Join(list, ",");
	    	wgplayerserver3.setDailymessage(news);
	    	wgplayerserver3.setDirty(true);
		}
	out.println("success");

	
%>
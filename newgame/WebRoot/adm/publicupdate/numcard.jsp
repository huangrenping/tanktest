<%@page import="web.webSocket.plot.PlotManager"%>
<%@ page language="java" import="java.util.*,
web.webSocket.player.PlayerManager,
web.webSocket.pojo.WgPlayerserver" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
		
		String username=request.getParameter("username");
		String snum=request.getParameter("num");
		int num=Integer.valueOf(snum);
		Long id=PlayerManager.getInstance().getplayerid(username);
		if(id!=null){
			WgPlayerserver wgplayerserver=PlayerManager.getInstance().getplayer(id);
			Integer nownum=wgplayerserver.getWgPlayerserver2().getBlessnum4();
			if(nownum==null || num>nownum){
				wgplayerserver.getWgPlayerserver2().setBlessnum4(num);
				wgplayerserver.getWgPlayerserver2().setDirty(true);
			}
			out.println("success");
		}else{
			out.println("error");
		}
		
%>

<%@page import="com.sun.tools.doclets.internal.toolkit.util.DocFinder.Output"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "web.webSocket.activity.ActivityManager"%>
<%@ page import = "web.webSocket.player.PlayerManager"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver"%>
<%@ page import = "web.webSocket.tasks.TasksManager"%>


<% 
		ActivityManager activityManager=ActivityManager.getInstance();
		WgPlayerserver[] wgplayers=PlayerManager.getInstance().getplayers();
		for (WgPlayerserver wgPlayerserver : wgplayers) {
			if(wgPlayerserver.getWgPlayerserver3().getCrossserversignin()==1){
				activityManager.zhanlingTaskAdd(wgPlayerserver, TasksManager.zhanlingbhlstimes, 15, 1);
			}
		}
		out.println("success");
%>
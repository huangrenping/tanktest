<%@page import="web.webSocket.arena.ArenaManager"%>
<%@page import="com.sun.tools.doclets.internal.toolkit.util.DocFinder.Output"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.List"%>
<%@ page import = "web.webSocket.player.PlayerManager"%>
<%@ page import = "web.webSocket.pojo.WgMail"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver"%>

<%  
		WgPlayerserver[] wgPlayerservers=PlayerManager.getInstance().getplayers();
		for (WgPlayerserver wgPlayerserver : wgPlayerservers) {
			List<WgMail> list=wgPlayerserver.getMaillist();
			if(list.size()>0){
				for (int i = list.size()-1; i >= 0; i--) {
					String content=list.get(i).getContent();
					String content1="本次计费删档测试即将结束，我们将在8月1日10点关闭服务器登录";
					if(content.contains(content1)){
						System.out.println(content);
						//list.remove(i);
					};
				}
			}
		}
%>
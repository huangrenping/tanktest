<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "web.webSocket.article.Article"%>
<%@ page import = "java.util.Map"%>
<%@ page import = "java.util.List"%>

<%@ page import = "web.webSocket.player.PlayerManager"%>
<%@ page import = "web.webSocket.pojo.WgHost"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver"%>
<%@ page import = "web.webSocket.util.Util"%>

<%
     	WgPlayerserver[]  wgPlayerservers=PlayerManager.getInstance().getplayers();
		for (WgPlayerserver wgPlayerserver : wgPlayerservers) {
			if(wgPlayerserver.isIslogin()==true){
				List<WgHost> list=wgPlayerserver.getHost().getList();
				for (WgHost wgHost : list) {
					String open=wgHost.getOpen();
					if(open!=null){
						if(open.indexOf("1000")>=0){
							open=Util.delone(open, "1000");
							wgHost.setOpen(open);
						}
					}
				}
			}
		}
		out.println("success");
%>


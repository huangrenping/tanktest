<%@page import="com.sun.tools.doclets.internal.toolkit.util.DocFinder.Output"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "java.util.Hashtable"%>
<%@ page import = "web.webSocket.player.PlayerManager"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver3"%>
<%@ page import = "org.apache.commons.lang.StringUtils"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
	String playeruid=request.getParameter("playeruid");
	String catdonum=request.getParameter("catdonum"); //可以使用招财次数（默认有一次免费默认为1）
	String usecatnum=request.getParameter("usecatnum");//已使用招财数量
	Hashtable<Long, WgPlayerserver> playermap = PlayerManager.getInstance().getIdplayermap();
	WgPlayerserver wg= playermap.get(Long.parseLong(playeruid));
	if(wg!=null){
		WgPlayerserver3 wg3 = wg.getWgPlayerserver3();
		if(StringUtils.isNotBlank(catdonum)){
			wg3.setCatdonum(Integer.parseInt(catdonum));
		}
		if(StringUtils.isNotBlank(usecatnum)){
			wg3.setUsecatnum(Integer.parseInt(usecatnum));
		}
		wg3.setDirty(true);
	}
	out.println("success");
%>

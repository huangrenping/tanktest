<%@page import="com.sun.tools.doclets.internal.toolkit.util.DocFinder.Output"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "web.webSocket.common.Publicmain"%>
<%@ page import = "web.webSocket.pojo.WgMain2"%>
<% 
		WgMain2 wgMain2=Publicmain.getInstance().getWgMain2();
		wgMain2.setHangupcardid("51006,51007,51008");
		out.println("success");
%>
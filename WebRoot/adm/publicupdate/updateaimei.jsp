<%@page import="web.webSocket.host.HostManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="web.webSocket.player.PlayerManager,
    java.util.*,
    net.sf.json.JSONArray,
    web.webSocket.util.MD5Util,
    net.sf.json.JsonConfig,
	web.webSocket.util.JacksonManager,
	org.codehaus.jackson.node.ObjectNode,
	web.webSocket.util.Util,
	java.text.*"%>

<%
	String[] hostaimeiarticles= {"191:20","192:20","193:20","194:20"};//男主暧昧奖励
	HostManager.hostaimeiarticles=hostaimeiarticles;
%>
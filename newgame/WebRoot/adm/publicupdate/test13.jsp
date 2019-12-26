<%@page import="web.webSocket.pet.PetManager"%>
<%@page import="web.webSocket.pojo.WgPlayerserver8"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver"%>
<%@ page import = " web.webSocket.player.PlayerManager"%>
<%
	response.setHeader("Content-Type", "application/json;charset=UTF-8");
	String serveruid=request.getParameter("serveruid");
	String scores=request.getParameter("score");
	long seruid=Long.parseLong(serveruid);
	int score=Integer.parseInt(scores);
	PlayerManager playerManager=PlayerManager.getInstance();
	WgPlayerserver wg=playerManager.getplayer(seruid);
	WgPlayerserver8 wg8=wg.getWgPlayerserver8();
	wg8.setPetcleanscore(wg8.getPetcleanscore()+score);
	PetManager.getInstance().addWgpetclean(wg, 0);
    Map<String,Object> map = new HashMap<String,Object>();
    map.put("player",wg.getPlayername());
    map.put("status", "1");
    map.put("message", "添加成功！");
	out.print(map);
%>
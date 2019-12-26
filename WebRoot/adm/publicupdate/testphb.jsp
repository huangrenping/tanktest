<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList"%>
<%@ page import = "java.util.List"%>
<%@ page import = "java.util.Map"%>

<%@ page import = "web.webSocket.arena.ArenaManager"%>
<%@ page import = "web.webSocket.arena.Ranking"%>
<%@ page import = "web.webSocket.arena.logic.impl.ArenaLogicimpl"%>
<%@ page import = "web.webSocket.player.PlayerManager"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver"%>

<% 
		long playerid=1100600000003992l;
		WgPlayerserver wgPlayerserver=PlayerManager.getInstance().getplayer(playerid);
		
		ArenaLogicimpl arenaLogicimpl=new ArenaLogicimpl();
		arenaLogicimpl.setArenaManager(ArenaManager.getInstance());
		arenaLogicimpl.setPlayerManager(PlayerManager.getInstance());
		Map<String, Object> map=arenaLogicimpl.rankingfriend(playerid);
		Map<String,Object> map2=(Map<String, Object>) map.get("map");
		
		List<Ranking> listfriend=(List<Ranking>) map2.get("list");
		out.println(listfriend.size()+"----"+listfriend.get(0).getUid());
		long duplayerid=listfriend.get(0).getUid();
		arenaLogicimpl.userrightdress(playerid, duplayerid);
		
%>
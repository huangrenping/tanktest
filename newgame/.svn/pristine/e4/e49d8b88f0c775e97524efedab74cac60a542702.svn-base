<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>

<%@ page import = "web.webSocket.player.PlayerManager,
web.webSocket.activity.ActivityManager,
web.webSocket.activity.WgPlayerservernew6,
web.webSocket.common.Publicmain,
web.webSocket.activity.Huodong"%>
<%@ page import = "web.webSocket.pojo.*"%>
<%
		PlayerManager playerManager = PlayerManager.getInstance();
		//不是家宴冲榜积分活动
		Hashtable<Long, WgPlayerserver> mapplayer=playerManager.getIdplayermap();
		List<WgPlayerserver> listwgplayers=null;
		Collection<WgPlayerserver> wplist=mapplayer.values();
		listwgplayers=new ArrayList<WgPlayerserver>();
		listwgplayers.addAll(wplist);
			for (WgPlayerserver player : listwgplayers) {
				if(player.getJiayantime()<1563811200000l){
				WgPlayerserver7 wgPlayerserver7 = player.getWgPlayerserver7();
				wgPlayerserver7.setJiayanhdscore(0);
				player.setJiayanHDscore(0);
				player.setJiayanHDranking(0);
				}
			}
			//清空内存数据
			Publicmain.getInstance().jiayanHDranking(listwgplayers);
out.print("重置完毕");
%>


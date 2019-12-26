<%@page import="web.webSocket.answer.AnswerManager"%>
<%@page import="web.webSocket.plot.PlotManager"%>
<%@ page language="java" import="java.util.*,
web.webSocket.player.PlayerManager,
web.webSocket.pojo.*,
web.webSocket.activity.ActivityManager,
web.webSocket.pojo.WgMain2,
web.webSocket.answer.*,
web.webSocket.arena.*,
web.webSocket.rightdress.RightdressManager,
web.webSocket.player.logic.impl.PlayerLogicImpl,
web.webSocket.util.*,
web.webSocket.rightdress.Part,
web.webSocket.message.MessageManager,
web.webSocket.card.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
PlayerManager playerManager = PlayerManager.getInstance();
Collection<WgPlayerserver> wgplaylist = playerManager.getIdplayermap().values();
for (WgPlayerserver wgPlayerserver : wgplaylist) {
	if (wgPlayerserver.getUsername().equals("-1") || wgPlayerserver.getUsername().equals("-2")) {
		continue;
	}
	//重置玩家周卡
	WgPlayerserver3 wg3 = wgPlayerserver.getWgPlayerserver3();
	if (wg3.getWeekcardtime() > 0) {
		wg3.setWeekcardtime(wg3.getWeekcardtime()-1);
		wg3.setWeekcardreceive(1);
		// 月卡推送
		MessageManager.pushred(68, wgPlayerserver, 1);
	} else {
		if (wg3.getWeekcardreceive() != 0) {
			MessageManager.pushred(68, wgPlayerserver, 0);
			wg3.setWeekcardreceive(0);
		}
	}
	WgArenamain wgArenamain = wgPlayerserver.getWgArenamain();
	if(wgArenamain.getRanking()!=null||wgArenamain.getRanking()!=-1){
		wgPlayerserver.getWgPlayerserver7().setArenaranking(wgArenamain.getRanking());
	}
	// 重置所有玩家月卡
	if (wgPlayerserver.getCardtime() > 0) {
		wgPlayerserver.setCardtime(wgPlayerserver.getCardtime() - 1);
		wgPlayerserver.setReceive(1);
		int[] push = { PlayerManager.receivepush,
				PlayerManager.cardtimepush };
		wgPlayerserver.pushplayer(push);
		// 月卡推送
		MessageManager.pushred(9, wgPlayerserver, 1);
	} else {
		if (wgPlayerserver.getReceive() != 0) {
			MessageManager.pushred(9, wgPlayerserver, 0);
			wgPlayerserver.setReceive(0);
			wgPlayerserver.pushplayer(PlayerManager.receivepush);
		}
	}
	wgPlayerserver.setDirty(true);
}
out.print("重置完成");
%>

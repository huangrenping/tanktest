<%@page import="web.webSocket.plot.PlotManager"%>
<%@ page language="java" import="java.util.*,
web.webSocket.player.PlayerManager,
web.webSocket.pojo.*,
web.webSocket.activity.ActivityManager,
web.webSocket.pojo.WgMain2,
web.webSocket.card.CardManager,
web.webSocket.plot.Chapter,
web.webSocket.plot.PlotManager,
web.webSocket.arena.ArenaManager,
web.webSocket.arena.Arenaplayer,
web.webSocket.mail.MailManager,
web.webSocket.activity.Huodong,
web.webSocket.util.*,
web.webSocket.card.Card" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
ActivityManager activityManager = ActivityManager.getInstance();
Map<Integer, Huodong> huodongmap = activityManager.getHuodongmap();
// 每日首充活动
Huodong huodong = huodongmap.get(ActivityManager.areanrightdress);
if (huodong != null) {
	boolean open = Util.isOpenTime(huodong.getStarttime(), huodong.getEndtime());
	if (open) {
		WgPlayerserver[] getplayers = PlayerManager.getInstance().getplayers();
		for (WgPlayerserver wgPlayerserver : getplayers) {
			if (!wgPlayerserver.getPlayername().equals("GM") && !wgPlayerserver.getPlayername().equals("系统邮件")) {
				WgPlayerserver7 wg7 = wgPlayerserver.getWgPlayerserver7();
				if(wg7.getBuyarenafightnum()!=null&&wg7.getBuyarenafightnum()>0){
					int needDiamond=0;
					for (int i = 0; i < wg7.getBuyarenafightnum(); i++) {
						needDiamond += ActivityManager.needDiamond(i);
					}
					if(needDiamond>0){
						String content2="亲爱的小主，您在本次限时套装活动购买挑战次数消耗了"+needDiamond+"钻石，现全额返还给您，请尽快领取哦！";
						MailManager.getInstance().fulisendmail("系统邮件","系统邮件", content2, "1000024:" +needDiamond , (long) -1, wgPlayerserver.getServeruid(), 1);
					}
				}
			}
		}
	}
}
out.print("补发完毕");
%>

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
web.webSocket.pojo.WgPlayerserver8,
web.webSocket.activity2.Activity2Manager,
web.webSocket.player.PlayerManager,
web.webSocket.activity.WgPlayerservernew,
web.webSocket.mail.MailManager,
web.webSocket.card.Card" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%

PlayerManager playerManager=PlayerManager.getInstance();
Hashtable<Long, WgPlayerserver> mapplayer=playerManager.getIdplayermap();
List<WgPlayerserver> listwgplayers=null;
Collection<WgPlayerserver> wplist=mapplayer.values();
listwgplayers=new ArrayList<WgPlayerserver>();
listwgplayers.addAll(wplist);
//等级排名
//活动id@0关闭或1开启@开始时间@结束时间 @0未发送1已发送      ,    活动id@0关闭或1开启@开始时间@结束时间@0未发送1已发送
//每小时刷新一次
List<WgPlayerserver> listwgplayers2=new ArrayList<WgPlayerserver>();;
//去除gm、系统邮件账号
for (WgPlayerserver wgPlayerserver : listwgplayers) {
	if(!wgPlayerserver.getPlayername().equals("GM") && !wgPlayerserver.getPlayername().equals("系统邮件")){
		listwgplayers2.add(wgPlayerserver);
	}
}
Collections.sort(listwgplayers2, new Comparator<WgPlayerserver>(){
	@Override
	public int compare(WgPlayerserver o1, WgPlayerserver o2) {
		int result=o2.getLevel()-o1.getLevel();
		if(result==0){
			result=o2.getExperience()-o1.getExperience();
			if(result==0){
				long result2=o1.getExperiencetime()-o2.getExperiencetime();
				if(result2>0){
					result=1;
				}else if(result2==0){
					result=0;
				}else if(result2<0){
					result=-1;
				}
			}
		}
		return result;
	}
});

List<WgPlayerservernew> wgnewlist=new ArrayList<WgPlayerservernew>();
for (int i = 0; i < listwgplayers2.size(); i++) {
	WgPlayerserver wgPlayerserver=listwgplayers2.get(i);
	wgPlayerserver.setRanking((i+1));
	wgPlayerserver.setRankinglv(wgPlayerserver.getLevel());
	if(i<100){
		WgPlayerservernew wgnew=new WgPlayerservernew();
		wgnew.setLevel(wgPlayerserver.getLevel());
		wgnew.setPlayname(wgPlayerserver.getPlayername());
		wgnew.setRanking((i+1));
		wgnew.setServerid(wgPlayerserver.getServeruid());
		wgnewlist.add(wgnew);
	}
}
playerManager.setWgnewlist(wgnewlist);

List<WgPlayerservernew> list=playerManager.getWgnewlist();
out.print(list.size()+"-------");
for (WgPlayerservernew wg : list) {
out.print(wg.getPlayname()+"排名"+wg.getRanking());
}
%>

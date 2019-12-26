<%@page import="web.webSocket.plot.PlotManager"%>
<%@ page language="java" import="java.util.*,
java.text.*,
web.webSocket.pojo.*,
web.webSocket.util.*,
web.webSocket.player.PlayerManager,
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
web.webSocket.common.Game,
web.webSocket.mail.MailManager,
web.webSocket.shop.ShopManager,
web.webSocket.shop.Shop,
web.webSocket.vip.VipManager,
com.google.gson.reflect.TypeToken,
com.google.gson.Gson,
web.webSocket.card.Card" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%

Map<Integer, String> shopmaplibao=VipManager.getInstance().getMaplibaoshop();
PlayerManager playerManager = PlayerManager.getInstance();
WgPlayerserver[] getplayers = playerManager.getplayers();
ShopManager shopManager = ShopManager.getInstance();
for (WgPlayerserver getplayer : getplayers) {
	if (!getplayer.getPlayername().equals("GM") && !getplayer.getPlayername().equals("系统邮件")) {
		String shopbag=getplayer.getWgPlayerserver3().getShopbag();
		if(shopbag!=null&&!shopbag.equals("")){
			String[] shopbag2=shopbag.split(",");
			List<String> list=new ArrayList<String>();
			for (Integer key: shopmaplibao.keySet() ) {
				String libaostr2=shopmaplibao.get(key);
				Shop shop=shopManager.getshop(Integer.valueOf(libaostr2));
				if(shop!=null&&shop.getSecond()!=-1){
					for (int i = 0; i < shopbag2.length; i++) {
						String[] shopbag3=shopbag2[i].split(":");
		    			if(shopbag3[0].equals(libaostr2)){
		    				list.add(shopbag2[i]);
		    			}
					}
				}
			}
			if(list.size()>0){
    			for (int i = 0; i < list.size(); i++) {
    				shopbag=Util.delone(shopbag, list.get(i));
				}
    			getplayer.getWgPlayerserver3().setShopbag(shopbag);
    		}
		}
	}
}
out.print("重置完毕");
%>

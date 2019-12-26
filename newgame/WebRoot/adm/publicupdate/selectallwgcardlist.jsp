<%@ page language="java"
	import="java.util.*,
com.google.gson.Gson,web.webSocket.pojo.*,
web.webSocket.util.*,web.webSocket.card.*,
web.webSocket.article.ArticleManager,
web.webSocket.mapper.WgPlayerserverMapper,
web.webSocket.entity.PlayerAndAllCard,
web.webSocket.entity.PlayerCard,
web.webSocket.util.JacksonManager,
org.codehaus.jackson.node.ObjectNode,
web.webSocket.player.PlayerManager"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%
String start = request.getParameter("start");
String end = request.getParameter("end");
List<PlayerAndAllCard> data=new ArrayList<PlayerAndAllCard>();
PlayerManager playerManager = PlayerManager.getInstance();
CardManager cardManager = CardManager.getInstance();
int start1=Integer.valueOf(start);
int end1 =Integer.valueOf(end);
GameServerManager gameServerManager=GameServerManager.getInstance();
int sid=gameServerManager.getServerid();
Wgselectplayerserver ws=new Wgselectplayerserver();
ws.setSid(sid);
ws.setStart(start1);
ws.setEnd(end1);
WgPlayerserver wgp=new WgPlayerserver();
wgp.setSid(sid);
int count=playerManager.wgPlayerserverMapper.selectCount(wgp);
List<WgPlayerserver> selectlimitbyonlintime = playerManager.wgPlayerserverMapper.selectlimitbyonlintime(ws);
List<Long> uidlist =new ArrayList<Long>(); 
for (WgPlayerserver wgPlayerserver : selectlimitbyonlintime) {
	uidlist.add(wgPlayerserver.getServeruid());
}
Map<Long, List<WgPlayercard>> selectallCard = cardManager.selectallCard(uidlist);
for (WgPlayerserver wgPlayerserver : selectlimitbyonlintime) {
	PlayerAndAllCard allCard=new PlayerAndAllCard();
	allCard.setPlayerName(wgPlayerserver.getPlayername());
	allCard.setServerUid(wgPlayerserver.getServeruid());
	List<WgPlayercard> listcard =selectallCard.get(wgPlayerserver.getServeruid());
	if(listcard==null){
		continue;
	}
	for (WgPlayercard wgPlayercard : listcard) {
		if (wgPlayercard != null) {
			CardClient cc = new CardClient();
			cc = cardManager.tocardclient(wgPlayercard);
			if (wgPlayercard.getType() == 0) {
				if (cc.getId() == 51003 || cc.getId() == 51004 || cc.getId() == 51005) {
					continue;
				}
				if(cc.getQuality()==1&&cc.getStar()==1){
					allCard.setR1(allCard.getR1()+1);
				}else if(cc.getQuality()==1&&cc.getStar()==2){
					allCard.setR2(allCard.getR2()+1);
				}else if(cc.getQuality()==1&&cc.getStar()==3){
					allCard.setR3(allCard.getR3()+1);
				}else if(cc.getQuality()==1&&cc.getStar()==4){
					allCard.setR4(allCard.getR4()+1);
				}else if(cc.getQuality()==1&&cc.getStar()==5){
					allCard.setR5(allCard.getR5()+1);
				}else if(cc.getQuality()==2&&cc.getStar()==1){
					allCard.setSR1(allCard.getSR1()+1);
				}else if(cc.getQuality()==2&&cc.getStar()==2){
					allCard.setSR2(allCard.getSR2()+1);
				}else if(cc.getQuality()==2&&cc.getStar()==3){
					allCard.setSR3(allCard.getSR3()+1);
				}else if(cc.getQuality()==2&&cc.getStar()==4){
					allCard.setSR4(allCard.getSR4()+1);
				}else if(cc.getQuality()==2&&cc.getStar()==5){
					allCard.setSR5(allCard.getSR5()+1);
				}else if(cc.getQuality()==2&&cc.getStar()==6){
					allCard.setSR6(allCard.getSR6()+1);
				}else if(cc.getQuality()==3&&cc.getStar()==1){
					allCard.setSSR1(allCard.getSSR1()+1);
				}else if(cc.getQuality()==3&&cc.getStar()==2){
					allCard.setSSR2(allCard.getSSR2()+1);
				}else if(cc.getQuality()==3&&cc.getStar()==3){
					allCard.setSSR3(allCard.getSSR3()+1);
				}else if(cc.getQuality()==3&&cc.getStar()==4){
					allCard.setSSR4(allCard.getSSR4()+1);
				}else if(cc.getQuality()==3&&cc.getStar()==5){
					allCard.setSSR5(allCard.getSSR5()+1);
				}else if(cc.getQuality()==3&&cc.getStar()==6){
					allCard.setSSR6(allCard.getSSR6()+1);
				}
			}
		}
	}
	data.add(allCard);
}
JacksonManager jm = JacksonManager.getInstance();
ObjectNode json = jm.createObjectNode();
json.putPOJO("data", data);
json.putPOJO("total", count);
String result2=jm.toJson(json);
out.print(result2);
%>
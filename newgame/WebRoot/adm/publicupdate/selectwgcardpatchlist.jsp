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
 class PlayerAndCardPatch {
	private long serverUid;
	private int R;
	private int SR;
	private int SSR;
	private int wnR;
	private int wnSR;
	private int wnSSR;
	public long getServerUid() {
		return serverUid;
	}
	public void setServerUid(long serverUid) {
		this.serverUid = serverUid;
	}
	public int getR() {
		return R;
	}
	public void setR(int r) {
		R = r;
	}
	public int getSR() {
		return SR;
	}
	public void setSR(int sR) {
		SR = sR;
	}
	public int getSSR() {
		return SSR;
	}
	public void setSSR(int sSR) {
		SSR = sSR;
	}
	public int getWnR() {
		return wnR;
	}
	public void setWnR(int wnR) {
		this.wnR = wnR;
	}
	public int getWnSR() {
		return wnSR;
	}
	public void setWnSR(int wnSR) {
		this.wnSR = wnSR;
	}
	public int getWnSSR() {
		return wnSSR;
	}
	public void setWnSSR(int wnSSR) {
		this.wnSSR = wnSSR;
	}
	
}
%>
<%
String ids = request.getParameter("ids");
if(ids.equals("")){
	return;
}
String[] split = ids.split(",");
List<Long> uidlist =new ArrayList<Long>(); 
PlayerManager playerManager = PlayerManager.getInstance();
CardManager cardManager = CardManager.getInstance();
List<PlayerAndCardPatch> data=new ArrayList<PlayerAndCardPatch>();
for (String str : split) {
	WgPlayerserver getplayer = playerManager.getplayer(Long.valueOf(str));
	if(getplayer!=null){
		PlayerAndCardPatch allCard=new PlayerAndCardPatch();
		allCard.setServerUid(getplayer.getServeruid());
		List<WgPlayercard> wgcardlist = getplayer.getCard().getWgcardlist();
		for (WgPlayercard wgPlayercard : wgcardlist) {
			if (wgPlayercard != null) {
				CardClient cc = new CardClient();
				cc = cardManager.tocardclient(wgPlayercard);
				if (wgPlayercard.getType() == 1) {
					if (cc.getId() == 51003 || cc.getId() == 51004 || cc.getId() == 51005) {
						if(cc.getId() == 51003){
							allCard.setWnR(allCard.getWnR()+wgPlayercard.getNum());
						}else if(cc.getId() == 51004){
							allCard.setWnSR(allCard.getWnSR()+wgPlayercard.getNum());
						}else if(cc.getId() == 51005){
							allCard.setWnSSR(allCard.getWnSSR()+wgPlayercard.getNum());
						}
						continue;
					}
					if(cc.getQuality()==1){
						allCard.setR(allCard.getR()+1);
					}else if(cc.getQuality()==2){
						allCard.setSR(allCard.getSR()+1);
					}else if(cc.getQuality()==3){
						allCard.setSSR(allCard.getSSR()+1);
					}
				}
			}
		}
		data.add(allCard);
	}

}

JacksonManager jm = JacksonManager.getInstance();
ObjectNode json = jm.createObjectNode();
json.putPOJO("data", data);
String result2=jm.toJson(json);
out.print(result2);
%>
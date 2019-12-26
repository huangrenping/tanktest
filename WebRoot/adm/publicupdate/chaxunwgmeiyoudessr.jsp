<%@page import="web.webSocket.card.CardManager"%>
<%@page import="web.webSocket.tasks.TasksManager"%>
<%@page import="web.webSocket.dream.DreamManager"%>
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
	web.webSocket.activity.WgPlayerservernew,
	web.webSocket.common.Publicmain,
	web.webSocket.mail.MailManager,
	web.webSocket.pojo.WgPlayerserver3,
	web.webSocket.player.PlayerManager,
	web.webSocket.lovetree.Lovetree,
	web.webSocket.pojo.WgLovetree,
	web.webSocket.lovetree.Treefruit,
	web.webSocket.dream.Dream,
	web.webSocket.pojo.WgDream,
	web.webSocket.lovetree.LovetreeManager,
	web.webSocket.company.CompanyManager,
	web.webSocket.tasks.TasksManager,
	web.webSocket.dream.DreamManager,
	web.webSocket.dream.Dreamchapter,
	web.webSocket.card.CardManager,
	web.webSocket.card.Card,
	web.webSocket.util.Util,
	web.webSocket.pojo.WgMain,
	web.webSocket.common.Publicmain,
	web.webSocket.activity.ActivityManager,
	web.webSocket.util.GameServerManager,
	web.webSocket.card.Wgcard,
	web.webSocket.pojo.WgPlayercard,
	web.webSocket.pojo.WgPlayerserver"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
//查询玩家未拥有的ssr
String type=request.getParameter("type");
String serveruid=request.getParameter("serveruid");
String action=request.getParameter("action");
String sign=request.getParameter("sign");
PlayerManager playerManager=PlayerManager.getInstance();
int result=playerManager.resultjspkey(type);
if("".equals(type)||type==null){
}else if(result==1){
		
		Hashtable<Long, WgPlayerserver> mapplayer=playerManager.getIdplayermap();
		List<WgPlayerserver> listwgplayers=new ArrayList<WgPlayerserver>();
		Collection<WgPlayerserver> wplist=mapplayer.values();
		listwgplayers.addAll(wplist);
		
		Map<Integer, Card> map=CardManager.getInstance().getCardmap();
		Map<Integer, Integer> map2=new HashMap<Integer, Integer>();//所有SSRcarid
		Map<Integer, Integer> map3=new HashMap<Integer, Integer>();//保存carid
		for(Integer in:map.keySet()){
			Card card=map.get(in);
			if(card.getQuality()>=3){
				map2.put(in, in);
			}
		}
		for(WgPlayerserver wg:listwgplayers){
			Wgcard wgcard=wg.getCard();
			List<WgPlayercard> listcard=wgcard.getWgcardlist();
			for(WgPlayercard wgPlayercard:listcard){
				Card card=map.get(wgPlayercard.getCardid());
				if(wgPlayercard.getType()==0 && card.getQuality()==3){
					map3.put(wgPlayercard.getCardid(), wgPlayercard.getCardid());
				}
				if(map3.size()>=map2.size()){
					break;
				}
			}
			if(map3.size()>=map2.size()){
				break;
			}
		}
		Map<Integer, Integer> map4=new HashMap<Integer, Integer>();
		for(Integer in: map2.keySet()){
			if(map3.get(in)==null){
				map4.put(in, in);
			}
		}
		String cardidstr="";
		for(Integer in:map4.keySet()){
			cardidstr+=in+",";
		}
		if(cardidstr!=null && !cardidstr.equals("")){
			if(cardidstr.substring(cardidstr.length()-1, cardidstr.length()).equals(",")){
				cardidstr=cardidstr.substring(0, cardidstr.length()-1);
			}
		}
		GameServerManager gameServerManager=GameServerManager.getInstance();
		int serveruid2=gameServerManager.getServerid();
		out.print(serveruid2+"区，玩家未拥有的ssr卡牌="+cardidstr);
}
%>
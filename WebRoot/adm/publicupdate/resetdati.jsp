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
	web.webSocket.util.GameServerManager,
	web.webSocket.pojo.WgPlayerserver4,
	web.webSocket.pojo.WgPlayerserver2,
	web.webSocket.player.PlayerManager,
	web.webSocket.pojo.WgPlayerserver"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
String type=request.getParameter("type");
String serveruid=request.getParameter("serveruid");
String xmwid=request.getParameter("xmwid");
String action=request.getParameter("action");
String sign=request.getParameter("sign");
PlayerManager playerManager=PlayerManager.getInstance();
int result=playerManager.resultjspkey(type);
if("".equals(type)||type==null){
}else if(result==1){
		//重置所有玩家答题  把所有玩家情缘商店打开
		Hashtable<Long, WgPlayerserver> mapplayer=playerManager.getIdplayermap();
		List<WgPlayerserver> listwgplayers=new ArrayList<WgPlayerserver>();
		Collection<WgPlayerserver> wplist=mapplayer.values();
		listwgplayers.addAll(wplist);
		for(WgPlayerserver wg:listwgplayers){
			WgPlayerserver4 wg4=wg.getWgPlayerserver4();
		    wg.setWronganswer("");
			wg4.setAnswer("");
			
			
			WgPlayerserver2 wg2=wg.getWgPlayerserver2();
			if(wg2.getBlessnum2()<5){
				wg2.setBlessnum2(5);
			}
		}
		GameServerManager gameServerManager=GameServerManager.getInstance();
		int serveruid2=gameServerManager.getServerid();
		out.print(serveruid2+"区重置答题成功,所有玩家默认开启情缘商店！");
}
%>
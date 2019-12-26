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
	web.webSocket.player.PlayerManager,
	web.webSocket.lovetree.Lovetree,
	web.webSocket.pojo.WgLovetree,
	web.webSocket.lovetree.Treefruit,
	web.webSocket.util.GameServerManager,
	web.webSocket.lovetree.LovetreeManager,
	web.webSocket.pojo.WgPlayerserver"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
//对外接口，玩家反馈
String type=request.getParameter("type");
String serveruid=request.getParameter("serveruid");
String action=request.getParameter("action");
String sign=request.getParameter("sign");
PlayerManager playerManager=PlayerManager.getInstance();
int result=playerManager.resultjspkey(type);
if("".equals(type)||type==null){
}else if(result==1){
	 	Publicmain publicmain=Publicmain.getInstance();
		LovetreeManager lovetreeManager=LovetreeManager.getInstance();
		
		Hashtable<Long, WgPlayerserver> mapplayer=playerManager.getIdplayermap();
		List<WgPlayerserver> listwgplayers=new ArrayList<WgPlayerserver>();
		Collection<WgPlayerserver> wplist=mapplayer.values();
		listwgplayers.addAll(wplist);
		for(WgPlayerserver wg:listwgplayers){
			Lovetree lovetree=wg.getLovetree();
			List<WgLovetree> listthree=lovetree.getListlovetree();
			if(listthree.size()>0){
				WgLovetree wgLovetree=listthree.get(0);
				if(wgLovetree!=null){
					int lv=wgLovetree.getLevel();
					Treefruit treefruit=lovetreeManager.gettreefruitmapone(wgLovetree.getHostid(),wgLovetree.getLevel());
					if(treefruit!=null){
						wgLovetree.setTreefruitexperience(treefruit.getEpoch()+treefruit.getEpoch1()+treefruit.getEpoch2());
					}
					wgLovetree.setInsect(0);
					wgLovetree.setWatering(0);
					wgLovetree.setGains("");
					wgLovetree.setStealuid("");
				}
			}
		}
		GameServerManager gameServerManager=GameServerManager.getInstance();
		int serveruid2=gameServerManager.getServerid();
		out.print(serveruid2+"区爱情树脚本执行成功！");
}
%>
<%@page import="web.webSocket.plot.PlotManager"%>
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
	web.webSocket.pojo.WgPlayerserver7,
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
	web.webSocket.plot.Section,
	web.webSocket.util.GameServerManager,
	web.webSocket.pojo.WgPlayerserver"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
//同步最大闯关数
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
		
		PlotManager plotManager=PlotManager.getInstance();
		for(WgPlayerserver wg:listwgplayers){
			WgPlayerserver7 wg7=wg.getWgPlayerserver7();
			
			Section section=plotManager.getsection(wg7.getMaxcheckpoint()+1);
			if(section==null){
				section=plotManager.getsection(wg7.getMaxcheckpoint());
			}
			String maxcheckpoint=section.getChapterid()+":"+section.getId();
			wg.setMaxcheckpoint(maxcheckpoint);
		}
		GameServerManager gameServerManager=GameServerManager.getInstance();
		int serveruid2=gameServerManager.getServerid();
		out.print(serveruid2+"区主线副本同步脚本执行成功！");
}
%>
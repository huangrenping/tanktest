<%@page import="web.webSocket.article.ArticleManager"%>
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
	web.webSocket.login.LoginManager,
	web.webSocket.pojo.WgFeedback,
	web.webSocket.arena.ArenaManager,
	web.webSocket.util.JacksonManager,
	org.codehaus.jackson.node.ObjectNode,
	web.webSocket.lovetree.Treefruit,
	web.webSocket.lovetree.LovetreeManager,
	web.webSocket.article.Article,
	web.webSocket.arena.Arenaplayer,
	web.webSocket.util.GameServerManager,
	web.webSocket.pojo.WgPlayerserver"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
String type=request.getParameter("type");
String id=request.getParameter("id");
String serveruid=request.getParameter("serveruid");
String articleandnum=request.getParameter("articleandnum");
String mark=request.getParameter("mark");
String replypeople=request.getParameter("replypeople");
PlayerManager playerManager=PlayerManager.getInstance();
int result=playerManager.resultjspkey(type);
if("".equals(type)||type==null){
}else if(result==1){
		//查询机器人等级分布
		//等级：人数
		Map<Integer,Integer> map2=new HashMap<Integer,Integer>();
		ArenaManager arenaManager=ArenaManager.getInstance();
		if(arenaManager!=null){
			Map<Long, Arenaplayer> map=arenaManager.getMapplayers();
			for (Long l:map.keySet()) {
				//机器人
				Arenaplayer arenaplayer=map.get(l);
				if(arenaplayer.getType()==1){
					if(map2.get(arenaplayer.getLevel())==null){
						map2.put(arenaplayer.getLevel(), 1);
					}else{
						map2.put(arenaplayer.getLevel(), map2.get(arenaplayer.getLevel())+1);
					}
				}
			}
		}
		for(Integer in:map2.keySet()){
			System.out.println("等级=="+in+",人数==="+map2.get(in));
		}
}	
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="web.webSocket.player.PlayerManager,
    java.util.*,
    net.sf.json.JSONArray,
    web.webSocket.util.MD5Util,
    net.sf.json.JsonConfig,
    web.webSocket.tasks.TasksManager,
	web.webSocket.util.JacksonManager,
	org.codehaus.jackson.node.ObjectNode,
    web.webSocket.pojo.WgPlayerserver,
	web.webSocket.arena.ArenaManager,
	web.webSocket.arena.Arenaplayer,
	web.webSocket.common.Publicmain,
	web.webSocket.util.Util,
    web.webSocket.pojo.WgPlayerserver2,
    web.webSocket.pojo.WgCardplotsection"%>
    
    
    
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
		WgPlayerserver[] players=PlayerManager.getInstance().getplayers();
		 for (WgPlayerserver wgPlayerserver : players) {
			 if(wgPlayerserver!=null && wgPlayerserver.isIslogin()==true){
				 int[] ids={1042,2042,3042,4042};
				 int[] hostid={1,2,3,4};
				 int[] chapterid={10006,20006,30006,40006};
				 int s=0;
				 for (int i : ids) {
				 	//out.println(wgPlayerserver.getPlayername()+"----"+"<br>");
					 wgPlayerserver.getCardplot().getListsection(chapterid[s]);
					 WgCardplotsection wgPlotsection =wgPlayerserver.getCardplot().getsection(i);
					 if(wgPlotsection!=null){
						 if(wgPlotsection.getStatus()==1){
								out.println(wgPlayerserver.getPlayername()+"----"+"<br>"+hostid[s]);
								wgPlayerserver.getWgPlayerserver3().adddailymessagegudingnum(TasksManager.growuptype, TasksManager.fubenhost[s], 6,wgPlayerserver);
							}
					 }
					 s++;
				 }
			 }
		}
%>
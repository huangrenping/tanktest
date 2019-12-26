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
<%!
    	public class WgClient {
	private String username;//账号
	private int physical;//体力
	
	public int getPhysical() {
		return physical;
	}
	public void setPhysical(int physical) {
		this.physical = physical;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}

}
     %> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%
String username = request.getParameter("username");
if(username!=null&&!username.equals("")){
	PlayerManager playerManager = PlayerManager.getInstance();
	Long getplayerid = playerManager.getplayerid(username);
	if(getplayerid!=null){
		WgPlayerserver getplayer = playerManager.getplayer(getplayerid);
		if(getplayer!=null){
			out.print(getplayer.getPhysical());
		}else{
			out.print("查无此人");
		}
	}else{
		out.print("查无此人");
	}
}else{
	WgPlayerserver[] getplayers = PlayerManager.getInstance().getplayers();
	List<WgClient> list=new ArrayList<WgClient>();
	for (WgPlayerserver wgPlayerserver : getplayers) {
		if (wgPlayerserver.getPlayername().equals("GM") && wgPlayerserver.getPlayername().equals("系统邮件")) {
			continue;
		}
		WgClient wgClient=new WgClient();
		wgClient.setUsername(wgPlayerserver.getUsername());
		wgClient.setPhysical(wgPlayerserver.getPhysical());
		list.add(wgClient);
	}
	JacksonManager jm = JacksonManager.getInstance();
	ObjectNode json = jm.createObjectNode();
	json.putPOJO("data", list);
	String result2=jm.toJson(json);
	out.print(result2);
}


%>
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
WgPlayerserver[] getplayers = PlayerManager.getInstance().getplayers();
Map<Integer, Integer> map=new HashMap<Integer, Integer>();
for (WgPlayerserver wgPlayerserver : getplayers) {
	if(!wgPlayerserver.getPlayername().equals("GM") && !wgPlayerserver.getPlayername().equals("系统邮件")){
		int[] returneditloginreward = wgPlayerserver.getWgPlayerserver3().returneditloginreward();
		for (int i = 0; i < returneditloginreward.length; i++) {
			if(returneditloginreward[i]==2){
				Integer integer = map.get(i+1);
				if(integer==null){
					map.put(i+1, 1);
				}else{
					map.put(i+1, integer+1);
				}
			}
		}
	}
}
JacksonManager jm = JacksonManager.getInstance();
ObjectNode json = jm.createObjectNode();
json.putPOJO("data", map);
String result2=jm.toJson(json);
out.print(result2);
%>
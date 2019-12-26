<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="web.webSocket.player.PlayerManager,
    java.util.*,
    net.sf.json.JSONArray,
    web.webSocket.util.MD5Util,
    net.sf.json.JsonConfig,
    web.webSocket.vip.VipManager,
	web.webSocket.util.JacksonManager,
	org.codehaus.jackson.node.ObjectNode,
    web.webSocket.pojo.WgPlayerserver,
	web.webSocket.arena.ArenaManager,
	web.webSocket.arena.Arenaplayer,
	web.webSocket.common.Publicmain,
	web.webSocket.util.Util,
	web.webSocket.pojo.WgPlayerserver4,
	web.webSocket.pojo.Wgselectplayerserver,
	web.webSocket.mapper.WgPlayerserver2Mapper,
	web.webSocket.mapper.WgPlayerserver4Mapper,
    web.webSocket.pojo.WgPlayerserver2"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
    <%!
    	public class WgPlayerserverClient {
		private int uid;//id
		private String username;//账号
		private int time;//在线时长
		
		public int getTime() {
			return time;
		}
		public void setTime(int time) {
			this.time = time;
		}
		public int getUid() {
			return uid;
		}
		public void setUid(int uid) {
			this.uid = uid;
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
String type=request.getParameter("type");
String serveruid=request.getParameter("serveruid");
String action=request.getParameter("action");
String sign=request.getParameter("sign");
if("".equals(type)||type==null){
%>



<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-title" content="Amaze UI" />
   
    <title>欢迎登陆锦绣缘后台</title>
    <link rel="icon" type="image/png" href="<%=path %>/assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="<%=path %>/assets/i/app-icon72x72@2x.png">
    <link rel="stylesheet" href="<%=path %>/assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="<%=path %>/assets/css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="<%=path %>/assets/css/app.css">
    <script src="<%=path %>/assets/js/jquery.min.js"></script>
	<script src="<%=path %>/assets/js/amazeui.min.js"></script>
    <script src="<%=path %>/assets/js/app.js"></script>
    <%
     %>
    <script language="javascript" type="text/javascript">
    layui.define(['form','layer','laypage','laydate'], function(exports){
	var $ = layui.jquery, 
	form = layui.form(),
	layer = layui.layer,
	laypage = layui.laypage;
	});
    </script>

</head>

<body data-type="login">

</body>

</html>
<%

}else if("vm4iZxryKDYTxMA7".equals(type)){
	 	PlayerManager playerManager=PlayerManager.getInstance();
		Collection<WgPlayerserver> wgplaylist=playerManager.getIdplayermap().values();
		List<WgPlayerserver> wglist=new ArrayList<WgPlayerserver>();
		wglist.addAll(wgplaylist);
		List<WgPlayerserverClient> wglistclient=new ArrayList<WgPlayerserverClient>();
		
		for (int i = 0; i < wglist.size(); i++) {
			WgPlayerserver wg=wglist.get(i);
			if(wg.getUid()==-2 || wg.getUid()==-1){
				continue;
			}
			WgPlayerserverClient wgPlayerserverClient=new WgPlayerserverClient();
			wgPlayerserverClient.setUid(wg.getUid());
			wgPlayerserverClient.setUsername(wg.getUsername());
			wgPlayerserverClient.setTime(wg.getOnlinetime());
			wglistclient.add(wgPlayerserverClient);
		}
		JacksonManager jm = JacksonManager.getInstance();
		ObjectNode json = jm.createObjectNode();
		json.putPOJO("data", wglistclient);
 		String result=jm.toJson(json);
 		out.print(result);
}
%>
<%@ page language="java"
	import="java.util.*,
web.webSocket.player.PlayerManager,
web.webSocket.util.GameServerManager,
web.webSocket.util.Util,
web.webSocket.common.Publicmain,
web.webSocket.pojo.WgMain,
web.webSocket.message.MessageManager,
web.webSocket.activity.ActivityManager
"
	contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<%
String openning = request.getParameter("isopen");
PlayerManager playerManager=PlayerManager.getInstance();
	GameServerManager gameServerManager=GameServerManager.getInstance();
	int serveruid2=gameServerManager.getServerid();
	Publicmain publicmain = Publicmain.getInstance();
	WgMain wgMain = publicmain.getWgMain();
	if (openning != null && openning.equals("1")) {
		if(wgMain.getOpen()==0){
			wgMain.setOpen(1);
			publicmain.update(wgMain);
			wgMain.openserver();
			out.print(serveruid2+"区服务器开启！");
			}
	} else if (openning != null && openning.equals("0")) {
		if(wgMain.getOpen()==1){
		wgMain.setOpen(0);
		publicmain.update(wgMain);
		wgMain.openserver();
		out.print(serveruid2+"区服务器关闭！");
		}
	}
	out.print("success");
%>

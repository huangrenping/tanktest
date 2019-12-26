<%@ page language="java"
	import="java.util.*,
web.webSocket.player.PlayerManager,
web.webSocket.util.GameServerManager,
web.webSocket.util.Util,
web.webSocket.common.Publicmain,
web.webSocket.pojo.WgMain,
web.webSocket.message.MessageManager,
web.webSocket.pojo.WgMain,
web.webSocket.arena.ArenaManager,
web.webSocket.activity.ActivityManager
"
	contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<%
	String openning = "1";
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
	String servertime= request.getParameter("servertime");
	long longTime = Util.getLongTime(servertime, 1);
	if(longTime==0l){
		out.print("error");
	}else{
		if(wgMain==null){
			out.print("error");
		}else{
			wgMain.setDay((int) (longTime/1000l));
			ArenaManager.getInstance().wgMainMapper.updateByPrimaryKeySelective(wgMain);
			ActivityManager.getInstance().resethuodong(1);
		out.print("success");
		}
	}
%>

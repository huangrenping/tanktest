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
		//答题问卷
		int status=0;
		if(xmwid!=null && !xmwid.equals("")){
			Long wgserveruid= PlayerManager.getInstance().getNameplayermap().get(xmwid);
			if(wgserveruid==null){
				status=4;
			}else{
				WgPlayerserver player = PlayerManager.getInstance().getplayer(wgserveruid);
				if(player!=null){
					WgPlayerserver4 wg4=player.getWgPlayerserver4();
					int isquestionnaire=wg4.getIsquestionnaire();
					if(isquestionnaire==0){
						String title="问卷调查";
				    	String content="感谢您参加问卷调查";
				    	String mytext="1000703:1";
						MailManager.getInstance().sendmail("GM邮件", title, content, mytext, (long)-1, wgserveruid , 1,1);
						wg4.setIsquestionnaire(1);
					}else{
						status=3;
					}
				}else{
					status=2;
				}
			}
		}else{
			status=1;
		}
		JacksonManager jm = JacksonManager.getInstance();
		ObjectNode json = jm.createObjectNode();
		json.putPOJO("status",status); 
		String result2=jm.toJson(json);
 		out.print(result2);
}
%>
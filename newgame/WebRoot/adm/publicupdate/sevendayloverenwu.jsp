<%@page import="web.webSocket.util.GameServerManager"%>
<%@page import="web.webSocket.common.Game"%>
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
	web.webSocket.pojo.WgPlayerserver2,
	web.webSocket.pojo.WgPlayerserver3,
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
	web.webSocket.plotone.Plotone,
	web.webSocket.activity.ActivityManager,
	web.webSocket.util.GameServerManager,
	web.webSocket.pojo.WgPlotchapterapt,
	web.webSocket.pojo.WgPlayerserver"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
//同步七日情缘活动第七天任务
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
		GameServerManager game=GameServerManager.getInstance();
		int sid=game.getServerid();
		ActivityManager activityManager=ActivityManager.getInstance();
		
		for(WgPlayerserver wg:listwgplayers){
			//计算出总量，全部加入
			Plotone plotone=wg.getPlotone();
			List<WgPlotchapterapt> listchapterapt=plotone.getListchapter();
			
			int maxnum=activityManager.getoneSevendayActicity(7).getNum();
			int wgnum=0;
			if(listchapterapt!=null && listchapterapt.size()>0){
				for(WgPlotchapterapt wgPlotchapterapt:listchapterapt){
					if(wgPlotchapterapt.getOpen()>0){
						wgnum++;
						if(wgnum>=maxnum){
							break;
						}
					}
				}
			}
			if(wgnum!=0){
				//所有区初始为0
				//加入的数量
				//activityManager.addsevenday(7, wg, wgnum);
			}
		}
		out.print(sid+"区七日情缘第七天任务同步完成！");
}
%>
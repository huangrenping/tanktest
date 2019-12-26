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
	java.text.*,
	web.webSocket.activity.WgPlayerservernew,
	web.webSocket.common.Publicmain,
	web.webSocket.mail.MailManager,
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
	web.webSocket.arena.Arenaplayer,
	web.webSocket.pojo.WgMain,
	web.webSocket.common.Publicmain,
	web.webSocket.arena.ArenaManager,
	web.webSocket.activity.ActivityManager,
	web.webSocket.util.GameServerManager,
	web.webSocket.pojo.WgPlayerserver"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
//同步机器人
String type=request.getParameter("type");
String serveruid=request.getParameter("serveruid");
String action=request.getParameter("action");
String sign=request.getParameter("sign");
PlayerManager playerManager=PlayerManager.getInstance();
int result=playerManager.resultjspkey(type);
if("".equals(type)||type==null){
}else if(result==1){
		Publicmain publicmain=Publicmain.getInstance();
		//开服时间
		WgMain wgMain=publicmain.getWgMain();
		long kaifutime=(long)wgMain.getDay()*1000;
		int day=0;
		SimpleDateFormat format =  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		Long time=kaifutime;
	    String d = format.format(time);  
	    String d2 = format.format(System.currentTimeMillis());  
	    Date date1;
	    Date date2;
		try {
			date1 = format.parse(d);
			date2=format.parse(d2);  
			day=Util.returnyearday(date1, date2)+1;  
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ArenaManager arenaManager=ArenaManager.getInstance();
		if(arenaManager!=null){
			Map<Long, Arenaplayer> map=arenaManager.getMapplayers();
			for (Long l:map.keySet()) {
				//机器人
				Arenaplayer arenaplayer=map.get(l);
				if(arenaplayer.getType()==1){
					int lv=0;
					if(day==1){
						lv=Util.getRandomInt(0,9);
					}else if(day==2){
						lv=Util.getRandomInt(0,8);
					}else if(day==3){
						lv=Util.getRandomInt(0,7);
					}else if(day==4){
						lv=Util.getRandomInt(0,6);
					}else if(day==5){
						lv=Util.getRandomInt(0,5);
					}else if(day==6){
						lv=Util.getRandomInt(0,4);
					}else if(day==7){
						lv=Util.getRandomInt(0,3);
					}else if(day==8){
						lv=Util.getRandomInt(0,2);
					}else{
						lv=Util.getRandomInt(0,1);
					}
					int[] rankingarray={500,400,350,300,250,200,150,10};
					if(day==2){
						if(arenaplayer.getRanking()<=rankingarray[0]){
							if(arenaplayer.getLevel()+lv>=60){
								arenaplayer.setLevel(60);
							}else{
								arenaplayer.setLevel(arenaplayer.getLevel()+lv);
							}
						}
					}else if(day==3){
						if(arenaplayer.getRanking()<=rankingarray[1]){
							if(arenaplayer.getLevel()+lv>=60){
								arenaplayer.setLevel(60);
							}else{
								arenaplayer.setLevel(arenaplayer.getLevel()+lv);
							}
						}
					}else if(day==4){
						if(arenaplayer.getRanking()<=rankingarray[2]){
							if(arenaplayer.getLevel()+lv>=60){
								arenaplayer.setLevel(60);
							}else{
								arenaplayer.setLevel(arenaplayer.getLevel()+lv);
							}
						}
					}else if(day==5){
						if(arenaplayer.getRanking()<=rankingarray[3]){
							if(arenaplayer.getLevel()+lv>=60){
								arenaplayer.setLevel(60);
							}else{
								arenaplayer.setLevel(arenaplayer.getLevel()+lv);
							}
						}
					}else if(day==6){
						if(arenaplayer.getRanking()<=rankingarray[4]){
							if(arenaplayer.getLevel()+lv>=60){
								arenaplayer.setLevel(60);
							}else{
								arenaplayer.setLevel(arenaplayer.getLevel()+lv);
							}
						}
					}else if(day==7){
						if(arenaplayer.getRanking()<=rankingarray[5]){
							if(arenaplayer.getLevel()+lv>=60){
								arenaplayer.setLevel(60);
							}else{
								arenaplayer.setLevel(arenaplayer.getLevel()+lv);
							}
						}
					}else if(day==8){
						if(arenaplayer.getRanking()<=rankingarray[6]){
							if(arenaplayer.getLevel()+lv>=60){
								arenaplayer.setLevel(60);
							}else{
								arenaplayer.setLevel(arenaplayer.getLevel()+lv);
							}
						}
					}else if(day==9){
						if(arenaplayer.getRanking()<=rankingarray[7]){
							if(arenaplayer.getLevel()+lv>=60){
								arenaplayer.setLevel(60);
							}else{
								arenaplayer.setLevel(arenaplayer.getLevel()+lv);
							}
						}
					}
					
					
				}
			}
		}
		GameServerManager gameServerManager=GameServerManager.getInstance();
		int serveruid2=gameServerManager.getServerid();
		out.print(serveruid2+"区已开服"+day+"天,机器人等级随机完成！");
}
%>
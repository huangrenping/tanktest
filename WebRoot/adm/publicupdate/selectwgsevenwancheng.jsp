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
	web.webSocket.pojo.WgPlayerserver3,
	web.webSocket.pojo.WgPlayerserver2,
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
	web.webSocket.pojo.WgMain,
	web.webSocket.common.Publicmain,
	web.webSocket.activity.ActivityManager,
	web.webSocket.util.GameServerManager,
	web.webSocket.card.Wgcard,
	web.webSocket.activity.SevendayActicity,
	web.webSocket.pojo.WgPlayercard,
	web.webSocket.pojo.WgPlayerserver"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
//查询玩家未拥有的ssr
String type=request.getParameter("type");
String serveruid=request.getParameter("serveruid");
String action=request.getParameter("action");
String sign=request.getParameter("sign");
PlayerManager playerManager=PlayerManager.getInstance();
int result=playerManager.resultjspkey(type);
if("".equals(type)||type==null){
}else if(result==1){
		//查询七日情缘所有任务完成的玩家
		Hashtable<Long, WgPlayerserver> mapplayer=playerManager.getIdplayermap();
		List<WgPlayerserver> listwgplayers=new ArrayList<WgPlayerserver>();
		Collection<WgPlayerserver> wplist=mapplayer.values();
		listwgplayers.addAll(wplist);
		
		ActivityManager activityManager=ActivityManager.getInstance();
		Map<Integer, SevendayActicity> sevendaymap=activityManager.getSevendaymap();
		
		int canjiarenshu=0;
		int wanchengrenshu=0;
		
		int cardlingjiangnum1=0;
		int cardlingjiangnum2=0;
		int cardlingjiangnum3=0;
		int cardlingjiangnum4=0;
		int cardlingjiangnum5=0;
		int yifulingjiangnum1=0;
		int yifulingjiangnum2=0;
		int yifulingjiangnum3=0;
		int yifulingjiangnum4=0;
		int yifulingjiangnum5=0;
			
		for(WgPlayerserver wg:listwgplayers){
			WgPlayerserver2 wg2=wg.getWgPlayerserver2();
			String sevenactivity=wg2.getSevenactivity();
			if(sevenactivity!=null && !sevenactivity.equals("")){
				canjiarenshu++;
				String[] sevenactivity2=sevenactivity.split(",");
				if(sevenactivity2.length>=7){
					for(int i=0 ; i<sevenactivity2.length ; i++){
						String[] sevenactivity3=sevenactivity2[i].split(":");
						SevendayActicity sevendayActicity=sevendaymap.get(Integer.valueOf(sevenactivity3[0]));
						if(Integer.valueOf(sevenactivity3[1])<sevendayActicity.getNum()){
							break;
						}
						if(i==sevenactivity2.length-1){
							wanchengrenshu++;
						}
					}
				}
			}
			WgPlayerserver3 wg3=wg.getWgPlayerserver3();
			String cardcollectreward=wg3.getCardcollectreward();//卡牌领取
			if(cardcollectreward!=null && !cardcollectreward.equals("")){
				String[] cardcollectreward2=cardcollectreward.split(",");
				for(int i=0;i<cardcollectreward2.length;i++){
					if(i==0 && Integer.valueOf(cardcollectreward2[i])>0){
						cardlingjiangnum1++;
					}
					if(i==1 && Integer.valueOf(cardcollectreward2[i])>0){
						cardlingjiangnum2++;
					}
					if(i==2 && Integer.valueOf(cardcollectreward2[i])>0){
						cardlingjiangnum3++;
					}
					if(i==3 && Integer.valueOf(cardcollectreward2[i])>0){
						cardlingjiangnum4++;
					}
					if(i==4 && Integer.valueOf(cardcollectreward2[i])>0){
						cardlingjiangnum5++;
					}
				}
			}
			String clothingreward=wg3.getClothingreward();//服装领取
			if(clothingreward!=null && !clothingreward.equals("")){
				String[] clothingreward2=clothingreward.split(",");
				for(int i=0;i<clothingreward2.length;i++){
					if(i==0 && Integer.valueOf(clothingreward2[i])>0){
						yifulingjiangnum1++;
					}
					if(i==1 && Integer.valueOf(clothingreward2[i])>0){
						yifulingjiangnum2++;
					}
					if(i==2 && Integer.valueOf(clothingreward2[i])>0){
						yifulingjiangnum3++;
					}
					if(i==3 && Integer.valueOf(clothingreward2[i])>0){
						yifulingjiangnum4++;
					}
					if(i==4 && Integer.valueOf(clothingreward2[i])>0){
						yifulingjiangnum5++;
					}
				}
			}
			
		}
		
		GameServerManager gameServerManager=GameServerManager.getInstance();
		int serveruid2=gameServerManager.getServerid();
		out.print(serveruid2+"区,参加七日情缘任务人数="+canjiarenshu+",完成七日情缘人数="+wanchengrenshu+
		",cardlingjiangnum1="+cardlingjiangnum1+",cardlingjiangnum2="+cardlingjiangnum2+
		",cardlingjiangnum3="+cardlingjiangnum3+",cardlingjiangnum4="+cardlingjiangnum4+
		",cardlingjiangnum5="+cardlingjiangnum5+",yifulingjiangnum1="+yifulingjiangnum1+
		",yifulingjiangnum2="+yifulingjiangnum2+",yifulingjiangnum3="+yifulingjiangnum3+
		",yifulingjiangnum4="+yifulingjiangnum4+",yifulingjiangnum5="+yifulingjiangnum5);
}
%>
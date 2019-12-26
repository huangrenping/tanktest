<%@page import="web.webSocket.activity2.Activity2Manager"%>
<%@page import="web.webSocket.activity.Superbagconfig"%>
<%@page import="web.webSocket.activity.Superbag"%>
<%@page import="web.webSocket.activity.ActivityManager"%>
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
	web.webSocket.util.GameServerManager,
	web.webSocket.pojo.WgPlayerserver"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
//任务同步
String type=request.getParameter("type");
String serveruid=request.getParameter("serveruid");

PlayerManager playerManager=PlayerManager.getInstance();
int result=playerManager.resultjspkey(type);
if("".equals(type)||type==null){
}else if(result==1){
	
		
		Hashtable<Long, WgPlayerserver> mapplayer=playerManager.getIdplayermap();
		List<WgPlayerserver> listwgplayers=new ArrayList<WgPlayerserver>();
		Collection<WgPlayerserver> wplist=mapplayer.values();
		listwgplayers.addAll(wplist);
		for(WgPlayerserver wg:listwgplayers){
			WgPlayerserver2 wg2=wg.getWgPlayerserver2();
			Map<Integer, Integer> map=wg2.getGiftbagsecondmap();
	    	if(map==null){
	    		wg2.getGiftbagsecond();
	    		map=wg2.getGiftbagsecondmap();
	    	}
	    	if(map!=null){
	    		ActivityManager activityManager=ActivityManager.getInstance();
	    		List<Integer> list=new ArrayList<Integer>();
	    		for (Integer in : map.keySet()) {
	    			Superbag superbag=activityManager.getsuperbagone(in);
	    			if(superbag!=null && superbag.getEveryday()==2){
	    				list.add(in);
	    			}
				}
	    		Superbagconfig superbagconfig = activityManager.getSuperbagconfigmap().get(Activity2Manager.limitsuperbagtype);
	    		if(superbagconfig!=null){
	    			String[] split = superbagconfig.getIds().split(",");
	    			for (String id : split) {
	    				Superbag superbag=activityManager.getsuperbagone(Integer.valueOf(id));
	        			if(superbag!=null){
	        				if(Util.getLongTime(superbag.getEndtime(), 0)<System.currentTimeMillis()){
	        					list.add(Integer.valueOf(id));
	        				}
	        			}
					}
	    		}
	    		if(list.size()>0){
	    			for (Integer integer : list) {
	        			map.remove(integer);
	    			}
	        		String giftbagsecond="";
	        		if(map.size()<=0){
	        			wg2.setGiftbagsecond(giftbagsecond);
	        			wg2.setDirty(true);
	        		}else{
	        			for (Integer in : map.keySet()) {
	            			giftbagsecond+=in+":"+map.get(in)+",";
	        			}
	            		if(!giftbagsecond.equals("") && giftbagsecond.substring(giftbagsecond.length()-1, giftbagsecond.length()).equals(",")){
	            			giftbagsecond=giftbagsecond.substring(0, giftbagsecond.length()-1);
	            			wg2.setGiftbagsecond(giftbagsecond);
		        			wg2.setDirty(true);
	            		}
	        		}
	    		}
	    	}
		}
		GameServerManager gameServerManager=GameServerManager.getInstance();
		int serveruid2=gameServerManager.getServerid();
		out.print(serveruid2+"区superbag礼包重置完成！");
}
%>
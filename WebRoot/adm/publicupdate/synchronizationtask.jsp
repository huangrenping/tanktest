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
	web.webSocket.player.PlayerManager,
	web.webSocket.lovetree.Lovetree,
	web.webSocket.pojo.WgLovetree,
	web.webSocket.lovetree.Treefruit,
	web.webSocket.dream.Dream,
	web.webSocket.pojo.WgDream,
	web.webSocket.lovetree.LovetreeManager,
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
String action=request.getParameter("action");
String sign=request.getParameter("sign");
PlayerManager playerManager=PlayerManager.getInstance();
int result=playerManager.resultjspkey(type);
if("".equals(type)||type==null){
}else if(result==1){
	 	Publicmain publicmain=Publicmain.getInstance();
		LovetreeManager lovetreeManager=LovetreeManager.getInstance();
		
		Hashtable<Long, WgPlayerserver> mapplayer=playerManager.getIdplayermap();
		List<WgPlayerserver> listwgplayers=new ArrayList<WgPlayerserver>();
		Collection<WgPlayerserver> wplist=mapplayer.values();
		listwgplayers.addAll(wplist);
		TasksManager tasksManager=TasksManager.getInstance();
		DreamManager dreamManager=DreamManager.getInstance();
		CardManager cardManager=CardManager.getInstance();
		for(WgPlayerserver wg:listwgplayers){
			int onehoidnum=0;//夜空明
			int twohoidnum=0;//齐钰
			int threehoidnum=0;//贺云铮
			int fourhoidnum=0;//宫宸旭
			List<WgDream> wgDreamlist=wg.getDream().getListdream();
			WgPlayerserver3 wgPlayerserver3=wg.getWgPlayerserver3();
			if(wgPlayerserver3!=null){
				String dailymessage=wgPlayerserver3.getDailymessage();
				if(dailymessage!=null && !dailymessage.equals("")){
					String[] dailymessagearray=dailymessage.split(",");
					int max=dailymessagearray.length-1;
					int result2=0;
					for(int i=max; i>=0; i--){
						String[] dailymessagearray2=dailymessagearray[i].split(":");
						if(dailymessagearray2[0].equals("0") && dailymessagearray2[1].equals("13")){
							result2++;
							break;
						}
						if(dailymessagearray2[0].equals("2") && dailymessagearray2[1].equals("4")){
							result2++;
							break;
						}
						if(dailymessagearray2[0].equals("2") && dailymessagearray2[1].equals("5")){
							result2++;
							break;
						}
						if(dailymessagearray2[0].equals("2") && dailymessagearray2[1].equals("6")){
							result2++;
							break;
						}
						if(dailymessagearray2[0].equals("2") && dailymessagearray2[1].equals("7")){
							result2++;
							break;
						}
					}
					if(result2>0){
						continue;
					}
				}else{
					continue;
				}
				if(wgDreamlist!=null && wgDreamlist.size()>0){
					for(WgDream wgDream:wgDreamlist){
						String[] starstatearray=wgDream.getStarstate().split(",");
						int num=0;
						for(int i=0; i<starstatearray.length; i++){
							if(starstatearray[i].equals("0")){
								num++;
								//System.out.println("num=============="+num);
							}else{
								break;
							}
						}
						if(num>=4){
							int chapterid=wgDream.getChapterid();
							Dreamchapter dreamchapter=dreamManager.getchapterone(chapterid);
							if(dreamchapter!=null){
								int cardid=Integer.valueOf(dreamchapter.getCardid());
								Card card=cardManager.getcardone(cardid);
								if(card!=null){
									if(card.getToid()==1){
										onehoidnum++;
										//System.out.println("onehoidnum=============="+onehoidnum);
									}else if(card.getToid()==2){
										twohoidnum++;
										//System.out.println("twohoidnum=============="+twohoidnum);
									}else if(card.getToid()==3){
										threehoidnum++;
										//System.out.println("threehoidnum=============="+threehoidnum);
									}else if(card.getToid()==4){
										fourhoidnum++;
										//System.out.println("fourhoidnum=============="+fourhoidnum);
									}
								}
							}
							//System.out.println("onehoidnum="+onehoidnum+",twohoidnum="+twohoidnum+",threehoidnum="+threehoidnum+",fourhoidnum="+fourhoidnum);
						}
					}
				}
				if(dailymessage!=null && !dailymessage.equals("")){
					wgPlayerserver3.setDailymessage(dailymessage+",2:4:30401:"+onehoidnum+",2:5:30501:"+twohoidnum+",2:6:30601:"+threehoidnum+",2:7:30701:"+fourhoidnum+",0:13:12101:0");
				}
			}
		}
		GameServerManager gameServerManager=GameServerManager.getInstance();
		int serveruid2=gameServerManager.getServerid();
		out.print(serveruid2+"区图鉴任务同步脚本执行成功！");
}
%>
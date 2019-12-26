<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
import="web.webSocket.common.Game,
java.util.Calendar,
web.webSocket.message.MessageManager,
web.webSocket.message.Messagepush,
java.util.ArrayList,
java.util.Collection,
java.util.Hashtable,
java.util.List,
web.webSocket.activity.ActivityManager,
web.webSocket.common.Game,
web.webSocket.common.Game2,
web.webSocket.common.Publicmain,
web.webSocket.handler.SystemWebSocketHandler,
web.webSocket.player.PlayerManager,
web.webSocket.pojo.WgPlayerserver,
web.webSocket.util.Util
"%>
<%

Thread t=Game2.getInstance().thread;
		t = new Thread(Game2.getInstance(),"Game2"+Util.getRandomInt(100000,1000000));
		t.start();
//Game.getInstance().setFlag(0);

//out.println(Game.getInstance().getFlag());
//SystemWebSocketHandler.getInstance().abnormalOffline(null);
//out.println("sssac");
		/*PlayerManager playerManager=PlayerManager.getInstance();
		Publicmain publicmain=Publicmain.getInstance();
		int minTime=1;
		Hashtable<Long, WgPlayerserver> mapplayer=playerManager.getIdplayermap();
		List<WgPlayerserver> listwgplayers=null;
		Collection<WgPlayerserver> wplist=mapplayer.values();
		
		listwgplayers=new ArrayList<WgPlayerserver>();
		listwgplayers.addAll(wplist);
		try {
			//检查活动开启or关闭
			//publicmain.inspecthuodong();
			//2019-1-12   5分钟刷新
			if(minTime%ActivityManager.pushmin==0){
				publicmain.sendreward(listwgplayers);
				publicmain.paihangbang(listwgplayers);
			}
		} catch (Exception e) {
			System.out.println("----定时器排行榜出现异常！");
			e.printStackTrace();
		}*/
//out.println("2222");
		 //WgPlayerserver wgplayr=PlayerManager.getInstance().getplayer(1088800000000033l);
		// wgplayr.getKnapsack().addknapsackall();
		 //out.print(s+"-------------");
//int day = Game.PUBLIC_CAL.get(Calendar.DAY_OF_YEAR);
//int day2 = Calendar.getInstance().get(Calendar.DAY_OF_YEAR);
//out.print(day+"---@@@@@@@@@@@@@@@@---"+day2);
//List<Messagepush> listpush=new ArrayList<Messagepush>();
//String content= "广播测试广播测试广播测试广播测试广播测试广播测试广播测试";
//String url="";
//Messagepush messagepush=new Messagepush(content, url, 0);
//listpush.add(messagepush);
//MessageManager.broadcast(listpush, 110001);
				/*try {
					PlayerManager playerManager=PlayerManager.getInstance();
					long heartbeatStartTime=System.currentTimeMillis();
					Hashtable<Long, WgPlayerserver> mapplayer=playerManager.getIdplayermap();
					List<WgPlayerserver> listwgplayers=null;
					Collection<WgPlayerserver> wplist=mapplayer.values();
					
					listwgplayers=new ArrayList<WgPlayerserver>();
					listwgplayers.addAll(wplist);
					for (WgPlayerserver wgPlayerserver : listwgplayers) {
						if(wgPlayerserver!=null){
							try {
								wgPlayerserver.heartBeat(heartbeatStartTime,false);
								if(wgPlayerserver.isIslogin()==true){
									//wgPlayerserver
								}
								
							} catch (Exception e) {
								e.printStackTrace();
							}
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
					out.println("更新出现异常！");
				}*/
out.println("333333333");
%>


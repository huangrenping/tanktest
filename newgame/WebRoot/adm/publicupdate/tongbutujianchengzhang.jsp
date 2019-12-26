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
	web.webSocket.company.CompanyManager,
	web.webSocket.tasks.TasksManager,
	web.webSocket.dream.DreamManager,
	web.webSocket.dream.Dreamchapter,
	web.webSocket.card.CardManager,
	web.webSocket.card.Card,
	web.webSocket.util.Util,
	web.webSocket.tasks.Dailytask,
	web.webSocket.util.GameServerManager,
	web.webSocket.pojo.WgPlayerserver"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
//同步图鉴成长任务完成百分比
String type=request.getParameter("type");
String serveruid=request.getParameter("serveruid");
String action=request.getParameter("action");
String sign=request.getParameter("sign");
PlayerManager playerManager=PlayerManager.getInstance();
int result=playerManager.resultjspkey(type);
if("".equals(type)||type==null){
}else if(result==1){
		TasksManager tasksManager=TasksManager.getInstance();
		Map<Integer,Integer> map=tasksManager.dailytasktotal();
		
		
		Hashtable<Long, WgPlayerserver> mapplayer=playerManager.getIdplayermap();
		List<WgPlayerserver> listwgplayers=new ArrayList<WgPlayerserver>();
		Collection<WgPlayerserver> wplist=mapplayer.values();
		listwgplayers.addAll(wplist);
		
		
		for(WgPlayerserver wg:listwgplayers){
			WgPlayerserver3 wg3=wg.getWgPlayerserver3();
			String dailymessage=wg3.getDailymessage();
			
			int[] dailytasks=wg3.dailytasks();
			//查询每个任务剩余数量
			//1.完成所有任务
			String strresult="";
			String dailytask=wg3.getDailytask();
			if((dailymessage==null || dailymessage.equals("")) && dailytask!=null && !dailytask.equals("")){
				for(int i=0;i<=map.size();i++){
					if(map.get(i)!=null){
						strresult+=map.get(i)+",";
					}
				}
				if(strresult!=null && !strresult.equals("") && strresult.substring(strresult.length()-1, strresult.length()).equals(",")){
					strresult=strresult.substring(0, strresult.length()-1);
					wg3.setDailytask(strresult);
					wg3.setDirty(true);
				}
			}else if(dailymessage!=null && !dailymessage.equals("")){
				//删掉不存在的任务
				String[] newdailymessage=dailymessage.split(",");
				List<String> listrenwu=new ArrayList<String>();
				for(int i=0;i<newdailymessage.length;i++){
					String[] newdailymessage2=newdailymessage[i].split(":");
					int newdailytaskid=Integer.valueOf(newdailymessage2[2]);
					Dailytask newdailytask=tasksManager.getDailytaskone(newdailytaskid);
					if(newdailytask!=null){
						listrenwu.add(newdailymessage[i]);
					}
				}
				dailymessage=Util.Join(listrenwu, ",");
				wg3.setDailymessage(dailymessage);
				//System.out.println("dailymessage==="+dailymessage);
				
				//2.完成部分任务
				//任务X未完成的数量
				Map<Integer,Integer> map2=new HashMap<Integer,Integer>();
				String[] str=dailymessage.split(",");
				for(int i=0 ; i<str.length ; i++){
					String[] str2=str[i].split(":");
					int onetype=Integer.valueOf(str2[0]);
					int twotype2=Integer.valueOf(str2[1]);
					int id=Integer.valueOf(str2[2]);
					if(onetype==0){
						List<Dailytask> list=tasksManager.getdailyonelist(onetype);
						if(list.size()>0){
							for(Dailytask daily:list){
								if(daily.getTasktype()==twotype2 && daily.getId()>=id){
									if(map2.get(onetype)==null){
										map2.put(onetype, 1);
									}else{
										map2.put(onetype,map2.get(onetype)+1);
									}
								}
							}
						}
					}else if(onetype==1){
						List<Dailytask> list=tasksManager.getdailyonelist(onetype);
						if(list.size()>0){
							for(Dailytask daily:list){
								if(daily.getTasktype()==twotype2 && daily.getId()>=id){
									if(map2.get(onetype)==null){
										map2.put(onetype, 1);
									}else{
										map2.put(onetype,map2.get(onetype)+1);
									}
								}
							}
						}
					}else if(onetype==2){
						List<Dailytask> list=tasksManager.getdailyonelist(onetype);
						if(list.size()>0){
							for(Dailytask daily:list){
								if(daily.getTasktype()==twotype2 && daily.getId()>=id){
									if(map2.get(onetype)==null){
										map2.put(onetype, 1);
									}else{
										map2.put(onetype,map2.get(onetype)+1);
									}
								}
							}
						}
					}else if(onetype==3){
						List<Dailytask> list=tasksManager.getdailyonelist(onetype);
						if(list.size()>0){
							for(Dailytask daily:list){
								if(daily.getTasktype()==twotype2 && daily.getId()>=id){
									if(map2.get(onetype)==null){
										map2.put(onetype, 1);
									}else{
										map2.put(onetype,map2.get(onetype)+1);
									}
								}
							}
						}
					}else if(onetype==4){
						List<Dailytask> list=tasksManager.getdailyonelist(onetype);
						if(list.size()>0){
							for(Dailytask daily:list){
								if(daily.getTasktype()==twotype2 && daily.getId()>=id){
									if(map2.get(onetype)==null){
										map2.put(onetype, 1);
									}else{
										map2.put(onetype,map2.get(onetype)+1);
									}
								}
							}
						}
					}
				}
				//完成的数量
				for(int i=0;i<=map.size();i++){
					if(map.get(i)!=null){
						int a=map.get(i);
						int b=0;
						if(map2.get(i)!=null){
							b=map2.get(i);
						}
						int chazhi=a-b;
						strresult+=chazhi+",";
					}
				}
				if(strresult!=null && !strresult.equals("") && strresult.substring(strresult.length()-1, strresult.length()).equals(",")){
					strresult=strresult.substring(0, strresult.length()-1);
					wg3.setDailytask(strresult);
					wg3.setDirty(true);
				}
			}
		}
		GameServerManager gameServerManager=GameServerManager.getInstance();
		int serveruid2=gameServerManager.getServerid();
		out.print(serveruid2+"区同步图鉴成长任务完成百分比脚本执行成功！");
}
%>
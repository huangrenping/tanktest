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
	web.webSocket.player.PlayerManager,
	web.webSocket.pojo.WgPlayerserver"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
PlayerManager playerManager=PlayerManager.getInstance();
	 	Publicmain publicmain=Publicmain.getInstance();
		
		Hashtable<Long, WgPlayerserver> mapplayer=playerManager.getIdplayermap();
		List<WgPlayerserver> listwgplayers=new ArrayList<WgPlayerserver>();
		Collection<WgPlayerserver> wplist=mapplayer.values();
		listwgplayers.addAll(wplist);
		publicmain.lvranking(listwgplayers);
		String huodong=publicmain.wgMain.getHuodong();
		//等级排名
		//活动id@0关闭或1开启@开始时间@结束时间 @0未发送1已发送      ,    活动id@0关闭或1开启@开始时间@结束时间@0未发送1已发送
		//每小时刷新一次
    	//发送奖励
		int oneday=1*24*60*60*1000;
    	long time=System.currentTimeMillis();
    	if(huodong!=null && !huodong.equals("")){
			String[] huodong2=huodong.split(",");
			for (String str:huodong2) {
				String[] huodong3=str.split("@");
				if(Integer.valueOf(huodong3[0])==5 && Integer.valueOf(huodong3[4])==0){
					List<WgPlayerservernew> list=playerManager.getWgnewlist();
					if(list!=null && list.size()>0){
					try {
						for (WgPlayerservernew wgnew:list) {
							if(wgnew.getServerid()==1077200000004558l||wgnew.getServerid()==1077200000002416l||wgnew.getServerid()==1077200000002457l||wgnew.getServerid()==1077200000004360l){
								continue;
							}
							WgPlayerserver player=playerManager.getplayer(wgnew.getServerid());
							if(player!=null && player.getRanking()!=null && player.getRankinglv()!=null){
								String content="恭喜您在三日快速升级活动中获得第"+player.getRanking()+"名的优异成绩，活动奖励已发送致您的邮箱，请注意领取。谢谢您的参与！";
								if(player.getRanking()==1){
									MailManager.getInstance().sendmail("GM的邮件", "三日快速升级活动", content,
											"1000212:1", (long)-1, player.getServeruid() , 1,1);
								}else if(player.getRanking()>=2 && player.getRanking()<=10){
									MailManager.getInstance().sendmail("GM的邮件", "三日快速升级活动", content,
											"1000213:1", (long)-1, player.getServeruid() , 1,1);
								}else if(player.getRanking()<=50){
									MailManager.getInstance().sendmail("GM的邮件", "三日快速升级活动", content,
											"1000214:1", (long)-1, player.getServeruid() , 1,1);
								}else if(player.getRanking()<=100){
									MailManager.getInstance().sendmail("GM的邮件", "三日快速升级活动", content,
											"1000215:1", (long)-1, player.getServeruid() , 1,1);
								}
							}
						}
					} catch (Exception e) {
						// TODO: handle exception
					}
						GameServerManager gameServerManager=GameServerManager.getInstance();
						int serveruid2=gameServerManager.getServerid();
						out.print(serveruid2+"区三日快速升级活动发送奖励成功!");
					}
					String huodong4=publicmain.wgMain.getHuodong();
					String[] huodong5=huodong4.split(",");
					for (int i = 0; i < huodong5.length; i++) {
						String[] huodong6=huodong5[i].split("@");
						if(Integer.valueOf(huodong6[0])==5){
							huodong5[i]=huodong6[0]+"@0@"+huodong6[2]+"@"+huodong6[3]+"@1";
							publicmain.wgMain.setHuodong(Util.Join(huodong5, ","));
							//wgMainMapper.updateByPrimaryKeySelective(publicmain.wgMain);
							//活动关闭,清空内存
							playerManager.getWgnewlist().clear();
							break;
						}
					}
				}else if(Integer.valueOf(huodong3[0])==5 && Integer.valueOf(huodong3[4])==1){
					out.print("不能重复发送奖励!");
				}
			}
		}
%>

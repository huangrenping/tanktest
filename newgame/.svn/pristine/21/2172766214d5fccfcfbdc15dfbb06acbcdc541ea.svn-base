<%@page import="com.sun.tools.doclets.internal.toolkit.util.DocFinder.Output"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "java.util.ArrayList"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List"%>
<%@ page import = "java.util.Map"%>

<%@ page import = "web.webSocket.article.Article2"%>
<%@ page import = "web.webSocket.article.ArticleManager"%>
<%@ page import = " web.webSocket.lovetree.Lovetree"%>
<%@ page import = " web.webSocket.lovetree.LovetreeManager"%>
<%@ page import = "web.webSocket.lovetree.Treefruit"%>
<%@ page import = "web.webSocket.onlinetask.OnlineTaskManager"%>
<%@ page import = "web.webSocket.player.PlayerManager"%>
<%@ page import = " web.webSocket.pojo.WgLovetree"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver3"%>
<%@ page import = "web.webSocket.tasks.TasksManager"%>
<%@ page import = "web.webSocket.util.Util"%>


<% 
		out.println("-------------------------------a1");
		//int type=0 单个  1全部；
		int type=1;
		int index=0;
		PlayerManager playerManager=PlayerManager.getInstance();
		long playeruid=1021300000000441l;
		long duid=-1l;
		Map<String,Object> map=new HashMap<String, Object>();
		Map<String,Object> map2=new HashMap<String, Object>();
		WgPlayerserver player=playerManager.getplayer(playeruid);
		LovetreeManager lovetreeManager=LovetreeManager.getInstance();
		ArticleManager articleManager=ArticleManager.getInstance();
		int error=0;
		if(player==null){
			error=-1;
			map.put("error", error);
			//return map;
		}
		out.println("-------------------------------a2");
		WgPlayerserver duplayer=playerManager.getplayer(duid);
		List<Article2> listtwo=new ArrayList<Article2>();
		if(duid==-1l){
		Lovetree lovetree=player.getLovetree();
		List<WgLovetree> list=lovetree.getListlovetree();
		out.println("-------------------------------1");
		if(list!=null){
			if(list.size()>0){
				WgLovetree wgLovetree=list.get(0);
				String gains=wgLovetree.getGains();
				out.println("------------------------------2");
				if(gains!=null && !"".equals(gains)){
				out.println("-------------------------------3");
					String[] gains2=gains.split(",");
					WgPlayerserver3 wgPlayerserver3=player.getWgPlayerserver3();
					//if(type==0){
					//}else{
						out.println("------------------------------4-");
						Map<Integer,Integer> mapnum=new HashMap<Integer,Integer>();
						int result=0;
						int flag=0;
						for(int i=0 ;i<gains2.length ;i++){
						out.println("------------------------------5-");
							if(gains2[i].equals("1")){
							out.println("------------------------------6-");
								result++;
								Treefruit treefruit=lovetreeManager.gettreefruitmapone(wgLovetree.getHostid(),wgLovetree.getLevel());
								out.println("------------------------------7-");
								if(treefruit!=null){
								out.println("------------------------------8-");
									int epochnum=treefruit.getEpochnew(player)+treefruit.getEpoch1()+treefruit.getEpoch2();
									int treefruitexperience=wgLovetree.getTreefruitexperience();
									if(treefruitexperience<epochnum){
									out.println("------------------------------9-");
										error=-14;//果子还未成熟
										map.put("error", error);
										//return map;
									}
									error=0;
									String[] ids=treefruit.getIds().split(",");
									int rom=Util.randomone(treefruit.getProbability());
									String articleandnum=ids[rom];
									Map<Integer,Integer> mapkadd2=new HashMap<Integer,Integer>();
									String[] articleandnum2=articleandnum.split(":");
									mapkadd2.put(Integer.valueOf(articleandnum2[0]), Integer.valueOf(articleandnum2[1]));
									player.getKnapsack().addknapsackall(mapkadd2);
									out.println("------------------------------10-");
									if(mapnum.get(Integer.valueOf(articleandnum2[0]))==null){
									out.println("------------------------------11-");
										mapnum.put(Integer.valueOf(articleandnum2[0]), Integer.valueOf(articleandnum2[1]));
									}else{
									out.println("------------------------------12-");
										mapnum.put(Integer.valueOf(articleandnum2[0]), mapnum.get(Integer.valueOf(articleandnum2[0]))+Integer.valueOf(articleandnum2[1]));
									}
									gains2[i]="0";
									int b=0;
									for (int j = 0; j < gains2.length; j++) {
										if(gains2[j].equals("1")){
											b++;
											break;
										}
									}
									if(b>0){
									out.println("------------------------------13-");
										wgLovetree.setGains(Util.Join(gains2, ","));
									}else{
									out.println("------------------------------14-");
										flag=1;
										wgLovetree.setGains("");
										wgLovetree.setTreefruitexperience(0);
										wgLovetree.setStealuid("");
										wgPlayerserver3.setCoverhelptree(0);
										wgLovetree.setUpnum(wgLovetree.getUpnum()+1);
										//wgLovetree.setTreefruittime(System.currentTimeMillis());
									}
									TasksManager.getInstance().addtast(13, player,1);
								}
							}
						}
						//主线任务  爱情树收获统计
						player.getWgPlayerserver3().edtidailytask(OnlineTaskManager.loveTreeCollect, 1, 0);
						if(result==0){
						out.println("------------------------------15-");
							if(flag==0){
							out.println("------------------------------16-");
								//一键异常处理有问题；
								if(wgLovetree.getGains()!=null && !"".equals(wgLovetree.getGains())){
								out.println("------------------------------17-");
									wgLovetree.setGains("");
									wgLovetree.setTreefruitexperience(0);
									wgLovetree.setStealuid("");
									wgPlayerserver3.setCoverhelptree(0);
									wgLovetree.setUpnum(wgLovetree.getUpnum()+1);
								}else{
								out.println("------------------------------18-");
									error=-13;
									map.put("error", error);
									//return map;
								}
							}else{
							out.println("------------------------------19-");
								error=-13;
								map.put("error", error);
								//return map;
							}
						}
						for (Integer  it : mapnum.keySet()) {
						out.println("------------------------------20-");
							List<Article2> listthree=articleManager.getarticle2(it, mapnum.get(it));
							listtwo.addAll(listthree);
						}
						map2.put("articlelist", listtwo);
					//}
					LovetreeManager.getInstance().delred(player, wgLovetree);
					out.println("-------------------------------21+成功！");
				}else{
					System.out.println("#################");
				}
			}
		}
	}
%>
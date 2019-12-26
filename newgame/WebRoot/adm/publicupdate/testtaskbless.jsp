<%@page import="com.sun.tools.doclets.internal.toolkit.util.DocFinder.Output"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "java.util.List"%>
<%@ page import = "java.util.Map"%>

<%@ page import = "web.webSocket.article.Article2"%>
<%@ page import = "web.webSocket.article.ArticleManager"%>
<%@ page import = "web.webSocket.language.Translate"%>
<%@ page import = "web.webSocket.mail.MailManager"%>
<%@ page import = "web.webSocket.player.Nicknamemain"%>
<%@ page import = "web.webSocket.player.PlayerManager"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver3"%>
<%@ page import = "web.webSocket.tasks.Nicknametask"%>
<%@ page import = "web.webSocket.tasks.TasksManager"%>





<% 
        long nowtime=System.currentTimeMillis();
		WgPlayerserver[] wgplayers=PlayerManager.getInstance().getplayers();
		for (WgPlayerserver wgPlayerserver : wgplayers) {
			if(wgPlayerserver.isIslogin()==true && wgPlayerserver.getLogintime()!=null && nowtime-wgPlayerserver.getLogintime()>60*1000){
				PlayerManager playerManager=PlayerManager.getInstance();
				 WgPlayerserver3 wgPlayerserver3=wgPlayerserver.getWgPlayerserver3two();
				 if(wgPlayerserver3!=null){
				 	Integer qualityid=wgPlayerserver3.getUserqualityid();
				  //out.println(qualityid+"---@@@@@@@@@@@@-quality-"+wgPlayerserver.getServeruid()+"--<br>");	
				 if(qualityid!=null && qualityid!=0){
					 Nicknamemain nicknamemain=playerManager.getMapnicknamemain().get(qualityid);
					 int id = nicknamemain.getNextid();
					 if(nicknamemain.getNextid()!=-1){
						 //Map<Integer, Integer> maptask=wgPlayerserver3.getMaptasknicknames();
						 Nicknamemain nicknamemainnext=playerManager.getMapnicknamemain().get(id);
						 List<Nicknametask> list=TasksManager.getInstance().getMaptitlenicknametask().get(nicknamemainnext.getId());
						 for (Nicknametask nicknametask : list) {
							 //Nicknametask newnicknametask=nicknametask.clonetask();
							 //Article2 article2=ArticleManager.getarticlelist2(nicknametask.getReward()).get(0);
							 //newnicknametask.setArticle2(article2);
							 //Integer it=maptask.get(newnicknametask.getTasktype());
							 wgPlayerserver3.addnicknametask(nicknametask.getTasktype(),wgPlayerserver);
						 }
						 out.println("------task---重算---<br>"+wgPlayerserver.getServeruid());
					 }
				 if(qualityid>1023){
				 //if(qualityid>1014){
					 int aid=1003725;
					 int num=wgPlayerserver.getKnapsack().count(aid);
					 out.println(num+"-------num------<br>");
					 if(num>0){
						 String sendarticle="1000024:300";
						 if(num>1 && qualityid>=1040){
							 sendarticle="1000024:600";
						 }
						 //扣掉自己祈福卡，返回钻石；
						 wgPlayerserver.getKnapsack().delknapsacknummade(aid, num, 0);
						 MailManager.getInstance().fulisendmail(Translate.systemmessage7,Translate.systemmessage7, "亲爱的小主，由于赠送的服饰祈福卡无法使用掉，我们在此会回收您身上的1张服饰祈福卡，同时返还您等额的300钻石。给您带来不便非常抱歉！感谢您一直以来对我们游戏的支持与喜爱！",
								 sendarticle, (long)-1, wgPlayerserver.getServeruid() , 1);
					 }
				 }
				 }
				 }
			}
		}
		out.println("success");
%>
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
				 if(qualityid!=null && qualityid!=0){
					 Nicknamemain nicknamemain=playerManager.getMapnicknamemain().get(qualityid);
					 int id = nicknamemain.getNextid();
					 if(nicknamemain.getNextid()!=-1){
						 Nicknamemain nicknamemainnext=playerManager.getMapnicknamemain().get(id);
						 List<Nicknametask> list=TasksManager.getInstance().getMaptitlenicknametask().get(nicknamemainnext.getId());
						 for (Nicknametask nicknametask : list) {
							 if(nicknametask.getTasktype()==TasksManager.qualityclothesnum){
							  	wgPlayerserver3.addnicknametask(nicknametask.getTasktype(),wgPlayerserver);
							  	out.println("------task---重算---<br>"+nicknametask.getTasktype()+"-----------"+wgPlayerserver.getServeruid());
							 }
						 }
						
					 }
				}
			}
			}
		}
		out.println("success");
%>
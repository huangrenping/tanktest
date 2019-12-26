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
<%@ page import = "web.webSocket.pojo.WgPlayercard"%>





<% 
 		long nowtime=System.currentTimeMillis();
		WgPlayerserver[] wgplayers=PlayerManager.getInstance().getplayers();
		int num=0;
		for (WgPlayerserver wgPlayerserver : wgplayers) {
			if(wgPlayerserver.getLogintime()!=null && wgPlayerserver.getLogintime()>1569351600000l){
				
				num++;
				int k=0;
				List<WgPlayercard> listcard=wgPlayerserver.getCard().getWgcardlist();
				for (WgPlayercard wgPlayercard : listcard) {
					if(wgPlayercard.getType()==0){
						k++;
					}
				}
				wgPlayerserver.getCard().setPutongcardnum(k);
				wgPlayerserver.getWgPlayerserver7().setAllcardnum(k);
				
				
				
				
				if(wgPlayerserver.getCard2()==null){
					out.println(wgPlayerserver.getServeruid()+"--"+wgPlayerserver.getPlayername()+"--"+k+"-KONG--"+"<br>");
				}else{
					out.println(wgPlayerserver.getServeruid()+"--"+wgPlayerserver.getPlayername()+"--"+k+"-"+"<br>");
				} 
			}
		}
		out.println("success"+num);
%>
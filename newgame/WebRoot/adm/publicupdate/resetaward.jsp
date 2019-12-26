<%@page import="web.webSocket.pojo.WgPet"%>
<%@page import="java.util.List"%>
<%@page import="web.webSocket.pet.Userpet"%>
<%@page import="com.sun.tools.doclets.internal.toolkit.util.DocFinder.Output"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "web.webSocket.article.Article"%>
<%@ page import = "java.util.Map"%>
<%@ page import = "web.webSocket.player.PlayerManager"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver"%>
<%@ page import = "web.webSocket.language.Translate"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "web.webSocket.mail.MailManager"%>
<%@ page import = "web.webSocket.article.Article2"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver7"%>
<%@ page import = "web.webSocket.article.ArticleManager"%>
<%@ page import = "web.webSocket.activity.ActivityManager"%>
<%@ page import = "web.webSocket.message.MessageManager"%>

<% 
	WgPlayerserver[] getplayers = PlayerManager.getInstance().getplayers();
	for (WgPlayerserver wgPlayerserver : getplayers) {
		if(!wgPlayerserver.getPlayername().equals("GM") && !wgPlayerserver.getPlayername().equals("系统邮件")){
			if(wgPlayerserver!=null){
				WgPlayerserver7 WgPlayerserver7 = wgPlayerserver.getWgPlayerserver7();
				if(WgPlayerserver7.getTimebanksevenrewardstatus()!=2){
					Map<Integer, Map<Integer, Integer>> timebankrewards = WgPlayerserver7.getTimebankrewards();
					String attachment="";
					for (Map<Integer, Integer> map : timebankrewards.values()) {
						try {
							if(map==null){
								continue;
							}
							for (Integer artid : map.keySet()) {
								attachment=attachment+artid+":"+map.get(artid)+",";
								break;//只取一个
							}
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
					if(!attachment.equals("")){
						String substring = attachment.substring(0, attachment.length()-1);
						String mailContent = "7天每日奖励未领取请查收，全新改版连续7天每日一小时，奖励更加丰厚快来参与吧！";
						MailManager.getInstance().fulisendmail(Translate.systemmessage7, Translate.commonmessage5, mailContent, substring, (long) -1, wgPlayerserver.getServeruid(), 1);
					}
				}
			WgPlayerserver7.setTimebankrewards(new HashMap<Integer, Map<Integer, Integer>>());
			WgPlayerserver7.setTimebanksevenrewardstatus(0);
			WgPlayerserver7.saveTimeBankRewards();
			MessageManager.pushred(27, wgPlayerserver, 0);
			}
		}
	}
	out.println("success");
	
%>
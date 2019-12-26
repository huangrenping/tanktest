<%@page import="web.webSocket.card.Wgcard"%>
<%@page import="web.webSocket.card.CardManager"%>
<%@page import="web.webSocket.card.CardClient"%>
<%@page import="web.webSocket.tasks.TasksManager"%>
<%@page import="web.webSocket.pojo.WgPlayerserver3"%>
<%@page import="web.webSocket.pojo.WgPlayercard"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
import="
web.webSocket.player.PlayerManager,
web.webSocket.pojo.WgPlayerserver
"%>
<%
		long time=System.currentTimeMillis();
		int count=0;
		WgPlayerserver[] wgplayerservers=PlayerManager.getInstance().getplayers();
		for (WgPlayerserver wgPlayerserver : wgplayerservers) {
			long timelogin=time/1000-wgPlayerserver.getLastlogintime();
			if(wgPlayerserver.getUsemaxsection()<135 || timelogin>86400*60){
				continue;
			}
			if(!wgPlayerserver.getPlayername().equals("GM") && !wgPlayerserver.getPlayername().equals("系统邮件")){
				int sum1=0;
				int sum2=0;
				int sum3=0;
				int sum4=0;
				int sum5=0;
				
				int rnum=0;
   				int srnum=0;
   				int ssrnum=0;
				WgPlayerserver3 playerserver3 = wgPlayerserver.getWgPlayerserver3();
        		List<WgPlayercard> cardlist = wgPlayerserver.getCard().getWgcardlist();
        		for (WgPlayercard wgPlayercard : cardlist) {
        			if(wgPlayercard.getTuponum()>=1) {
        				sum1++;
        			}
        			if(wgPlayercard.getTuponum()>=2) {
        				sum2++;
        			}
        			if(wgPlayercard.getTuponum()>=3) {
        				sum3++;
        			}
        			if(wgPlayercard.getTuponum()>=4) {
        				sum4++;
        			}
        			if(wgPlayercard.getTuponum()>=5) {
        				sum5++;
        			}
       				if(wgPlayercard.getTupo()==1&&wgPlayercard.getTuponum()==0){
           				sum1++;
           				sum2++;
           				sum3++;
           				sum4++;
           				sum5++;
           			}
       				
       				
       				
       				Wgcard getCard=wgPlayerserver.getCard();
       				CardClient cc=CardManager.getInstance().addcardclient(wgPlayercard,getCard.getIdlist());
       				
       				if(cc.getQuality()==1 && (wgPlayercard.getTuponum()>=5 || wgPlayercard.getTupo()==1)){
       					rnum++;
    				}
       				if(cc.getQuality()==2 && (wgPlayercard.getTuponum()>=5 || wgPlayercard.getTupo()==1)){
    					srnum++;
    					
    				}
       				if(cc.getQuality()==3 && (wgPlayercard.getTuponum()>=5 || wgPlayercard.getTupo()==1)){
    					ssrnum++;
    				}
       				
       				count++;
    			}
        		
        		playerserver3.getMaptasknicknames().put(TasksManager.qualitycardbreakto1, sum1);
   				playerserver3.getMaptasknicknames().put(TasksManager.qualitycardbreakto2, sum2);
   				playerserver3.getMaptasknicknames().put(TasksManager.qualitycardbreakto3, sum3);
   				playerserver3.getMaptasknicknames().put(TasksManager.qualitycardbreakto4, sum4);
   				playerserver3.getMaptasknicknames().put(TasksManager.qualitycardbreakto5, sum5);
   				playerserver3.setMaptasknicknames(playerserver3.getMaptasknicknames());
   				
   				wgPlayerserver.getWgPlayerserver3().adddailymessagegudingnum(TasksManager.fatetype, TasksManager.tupoRcrad, rnum,wgPlayerserver);
   				wgPlayerserver.getWgPlayerserver3().adddailymessagegudingnum(TasksManager.fatetype, TasksManager.tupoSRcrad, srnum,wgPlayerserver);
   				wgPlayerserver.getWgPlayerserver3().adddailymessagegudingnum(TasksManager.fatetype, TasksManager.tupoSSRcrad, ssrnum,wgPlayerserver);
			}
		}
		out.println("success:"+count);
%>


<%@page import="com.sun.tools.doclets.internal.toolkit.util.DocFinder.Output"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "web.webSocket.common.Publicmain"%>
<%@ page import = "web.webSocket.pojo.WgMain2"%>


<%@ page import = "java.util.Iterator"%>
<%@ page import = "web.webSocket.activity.ActivityManager"%>
<%@ page import = "web.webSocket.activity.Huodong"%>
<%@ page import = "web.webSocket.jiayan.JiayanManager"%>
<%@ page import = "web.webSocket.jiayan.Jiayaninfo"%>
<%@ page import = "web.webSocket.player.PlayerManager"%>
<%@ page import = "web.webSocket.pojo.WgPlayercard"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver7"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver8"%>
<%@ page import = "web.webSocket.treasure.TreasureManager"%>
<%@ page import = "web.webSocket.util.Util"%>

<% 
			Thread t=new Thread(){
			JiayanManager jiayanManager=JiayanManager.getInstance();
			@Override
			public void run() {
				System.out.println("宴会开始执行线程------不能重复执行");
				int k=0;
				while(true){
					try {
						long time=System.currentTimeMillis();
						Thread.sleep(1000);
						k++;
						if(k%60==0){
							System.out.println("jsp宴会定时执行中-----");
						}
						//System.out.println("@@@@@@@@@@@@@"+time);
 						try {
							Iterator<Jiayaninfo> ite =jiayanManager.getListjiayan().iterator();
							while(ite.hasNext()){
								Jiayaninfo jiayaninfo=ite.next();
								if(jiayaninfo.getTime()<=time+5000){
									completethis(jiayaninfo);
									//已经完成；
									ite.remove();
								}
							}
						} catch (Exception e) {
						} 
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
			
		};
		t.start();
		out.println("success");
%>

<%!
	public void completethis(Jiayaninfo jiayaninfo){
		System.out.println("宴会jsp执行！");
		long playerid=jiayaninfo.getPlayerid();
		WgPlayerserver player=PlayerManager.getInstance().getplayer(playerid);
		if(player!=null){
			int score1=JiayanManager.jifentype[jiayaninfo.getType()];
			int score2=0;
			int totalsum=0;
			long[] ids=jiayaninfo.getIds();
			int[] cards=jiayaninfo.getCards();
			int yanhuitype = jiayaninfo.getType();
			int laibinnum=0;
			for (int i = 0; i < ids.length; i++) {
				if(ids[i]>0){
					WgPlayerserver p=PlayerManager.getInstance().getplayer(ids[i]);
					if(p!=null){
						laibinnum++;
						if(ids[i]==jiayaninfo.getPlayerid()){
							score2+=JiayanManager.addjifen[jiayaninfo.getType()]/2;
						}else{
							score2+=JiayanManager.addjifen[jiayaninfo.getType()];
						}
						int cardid=cards[i];
						if(cardid!=0){
							WgPlayercard wgPlayercard=p.getCard().getcard(cardid);
							int sumone=JiayanManager.cardScoresum(wgPlayercard);
							if(ids[i]==jiayaninfo.getPlayerid()){
								totalsum+=sumone/2;
							}else{
								totalsum+=sumone;
							}
							WgPlayerserver8 wgPlayerserverp8=p.getWgPlayerserver8();
							wgPlayerserverp8.delcards(wgPlayercard.getLid());
						}
					}
				}
			}
			
			int sum=score1+score2+JiayanManager.jiayanadd(totalsum, jiayaninfo.getType());
			int buffadd=player.getWgPlayerserver8().buffadd(TreasureManager.jiayanAddScoreType);
			int sumtotal=sum+sum*jiayaninfo.getAddbfb()/100+sum*buffadd/100;
			player.setScoremax(player.getScoremax()+sumtotal);
			player.getWgPlayerserver8().setScore(player.getWgPlayerserver8().getScore()+sumtotal);
			//家宴积分冲榜活动开启的时候，玩家获得积分需要记录下来
			Huodong huodong = ActivityManager.getInstance().getHuodongmap().get(32);
			if(huodong!=null){
				if(Util.isOpenTime(huodong.getStarttime(), huodong.getEndtime())){
					WgPlayerserver7 wgPlayerserver7 = player.getWgPlayerserver7();
					wgPlayerserver7.setJiayanhdscore(wgPlayerserver7.getJiayanhdscore()+sumtotal);
				}
			}
			player.setCompleteyanhui(jiayaninfo.getId());
			int fishtype=0;
			if(yanhuitype==0){
				if(laibinnum==JiayanManager.jiayannum[0]){
					fishtype=1;
				}
			}else if(yanhuitype==1){
				if(laibinnum==JiayanManager.jiayannum[1]){
					fishtype=1;
				}
			}
			String date = Util.getDate(System.currentTimeMillis(), 1);
			String replaceAll = date.replaceAll("-", "");
			String intern = replaceAll.intern();
			JiayanManager.completeIntoLog(player, fishtype, 1, yanhuitype, Integer.valueOf(intern));
		}
		jiayaninfo.setComplete(1);
	}
%>

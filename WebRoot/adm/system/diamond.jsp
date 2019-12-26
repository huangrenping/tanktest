<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="web.webSocket.player.PlayerManager,
    		web.webSocket.mail.MailManager,
    		java.util.*,
    		web.webSocket.util.Util,
    		web.webSocket.pojo.WgPlayerserverClient,
    		web.webSocket.pojo.WgPlayerserver,
    		web.webSocket.pojo.WgPlayerserver3,
    		web.webSocket.pojo.WgPlayerserver4,
    		web.webSocket.pojo.WgPlayerserver7,
    		web.webSocket.message.MessageManager,
    		web.webSocket.activity.ActivityManager,
    		web.webSocket.activity2.Activity2Manager,
    		web.webSocket.activity.Huodong,
    		web.webSocket.vip.VipManager,
    		web.webSocket.util.BillingCenter,
    		web.webSocket.language.Translate"%>
		<%
		
			String username=request.getParameter("username");
				long getid=PlayerManager.getInstance().getplayerid(username);
				String sid=request.getParameter("sid");
				String diamond=request.getParameter("diamond");
				WgPlayerserver wg=PlayerManager.getInstance().getplayer(getid);
				if(wg!=null && diamond!=null && !diamond.equals("")){
			int olddiamond=wg.getTotalrmbdiamond();
			int num=Integer.valueOf(diamond);
			//wg.setDiamond(wg.getDiamond()+num);
			wg.setTotalrmbdiamond(wg.getTotalrmbdiamond()+num);
			Activity2Manager.getInstance().funAddNum(wg, num, Activity2Manager.functionNumber1);
			Activity2Manager.getInstance().checkLifePayRed(wg);
			ActivityManager.pay(wg, num);
			ActivityManager.payall(wg, num,2);
			Huodong huodong1=ActivityManager.getInstance().getHuodongmap().get(14);
			if(huodong1!=null){
			if(Util.isOpenTime(huodong1.getStarttime(), huodong1.getEndtime())){
				ActivityManager.catpay(wg, num);//招财猫
				}
			}
			wg.pushplayer(PlayerManager.viplvtype);
			//调用活动充值
			ActivityManager.getInstance().addpay(wg, num);
			//wg.pushplayer(PlayerManager.diamondtype);
			//第一个1  钻石   第二个5标识 充值
			int[] vipdiamond=VipManager.vipdiamond;
			int position=0;
			for(int i=0; i<vipdiamond.length; i++){
				if(vipdiamond[i]==num){
					position=i;
					break;
				}
			}
			WgPlayerserver7 wg7=wg.getWgPlayerserver7();
			WgPlayerserver4 wg4=wg.getWgPlayerserver4();
			
			
			//判断是否是活动双倍充值；
			int huodongflag=0;
			if(position<10){//改为全部双倍
				Huodong huodong = ActivityManager.getInstance().getHuodongmap().get(ActivityManager.paydoubleActivity);
				if (huodong != null) {
					if (Util.isOpenTime(huodong.getStarttime(), huodong.getEndtime())) {
				     	int doublepays[]=wg7.getDoublepays();
				    	 if(doublepays[position]==0){
				    	     doublepays[position]=1;
				    	     huodongflag=1;
				    	     wg7.setDoublepays(doublepays);
				    	 }
					}
				}
			}

			if(num>=3280){
			 Huodong huodong = ActivityManager.getInstance().getHuodongmap().get(ActivityManager.paybigActivity);
			 	if (huodong != null) {
					if (Util.isOpenTime(huodong.getStarttime(), huodong.getEndtime())) {
							long timestart=Util.getLongTime(huodong.getStarttime(),1);
							String s2=Util.getDate(System.currentTimeMillis(), 2);
							long nowtime2=Util.getLongTime(s2,1);
							int day=(int) ((nowtime2-timestart)/86400000);
							int doublepays[]=wg7.getBigpays();
							for (int i = 0; i < doublepays.length; i++) {
								if(doublepays[i]==0){
									doublepays[i]=1;
									wg7.BigpayRed(wg);
								}
							}
							/*if(day<doublepays.length-1){
								if(doublepays[day]==0){
									doublepays[day]=1;
									wg7.setBigpays(doublepays);
									wg7.BigpayRed(wg);
								}
							}*/
					}
				}
			}
			ActivityManager.getInstance().zhuanpanactivty(wg,0,1);
			String[] rechargedoublearray=wg7.getRechargedouble().split(",");
			String result=rechargedoublearray[position];
			if( huodongflag==1){
				BillingCenter.playerIncrease(wg ,1000024 , num*2, BillingCenter.diamondtype, BillingCenter.articleaddtype);
				//MailManager.getInstance().sendmail(Translate.commonmessage5,Translate.admin_1, "恭喜您成功充值"+diamond+"钻石,由于小额双倍充值活动进行中,获得双倍钻石。", "", (long)-1, getid, 1,1);
				MailManager.getInstance().sendmail(Translate.commonmessage5,Translate.admin_1,Translate.translateString(Translate.admin_3, new String[][]{{"@num@",String.valueOf(diamond)}}), "", (long)-1, getid, 1,1);
			}else{
			if(result.equals("0")){
				rechargedoublearray[position]="1";
				wg7.setRechargedouble(Util.Join(rechargedoublearray, ","));
				BillingCenter.playerIncrease(wg ,1000024 , num*2, BillingCenter.diamondtype, BillingCenter.articleaddtype);
				//MailManager.getInstance().sendmail(Translate.commonmessage5,Translate.admin_1, "恭喜您成功充值"+diamond+"钻石,由于您是首次充值该档位,获得双倍钻石。", "", (long)-1, getid, 1,1);
				MailManager.getInstance().sendmail(Translate.commonmessage5,Translate.admin_1,Translate.translateString(Translate.admin_4, new String[][]{{"@num@",String.valueOf(diamond)}}), "", (long)-1, getid, 1,1);
			}else{
				BillingCenter.playerIncrease(wg ,1000024 , num, BillingCenter.diamondtype, BillingCenter.articleaddtype);
				//MailManager.getInstance().sendmail(Translate.commonmessage5,Translate.admin_1, "恭喜您成功充值"+diamond+"钻石。", "", (long)-1, getid, 1,1);
				MailManager.getInstance().sendmail(Translate.commonmessage5,Translate.admin_1, Translate.translateString(Translate.admin_5, new String[][]{{"@num@",String.valueOf(diamond)}}), "", (long)-1, getid, 1,1);
			}
			}


			//vip礼包红点  累计充值红点
			PlayerManager.getInstance().vipandrechargered(wg);
			//7日充值活动
			wg4.sevendayactivity(num,wg);
			if(wg.getIsfirst()==0 ||wg.getIsfirst()==null){
				wg.setIsfirst(1);
				wg.setIsfirsttime(System.currentTimeMillis());
				wg.pushplayer(PlayerManager.activityfirstpunch);
				ActivityManager.getInstance().firstChargeRed(wg);
				//推送首冲活动
				MessageManager.pushred(7, wg,1);
			}
						//每日首充礼包首充刷新状态
			wg7.changeFirstRecharge();
		/* 			if(wg.getIsfirst()>=1){
			//每日首充礼包首充刷新状态
			if(wg7.getFirstrecharge()==null){
				wg7.setFirstrecharge(0);
			}
			if(wg7.getFirstrecharge()==0){
				wg7.setFirstrecharge(1);
				wg7.setFirstrechargestatus(1);
				wg7.setDirty(true);
				//每日首充礼包红点 
				wg7.firstRechargeRed();
			}
			
			} */

			PlayerManager.getInstance().validateSignAgain(wg, wg.getTotalrmbdiamond() ,olddiamond);
			WgPlayerserver3 wg3=wg.getWgPlayerserver3();
			if(wg3.getFirstlv()==0){
				wg3.setFirstlv(wg.getLevel());
			}
			out.print("success");
				}else{
			out.print("用户不存在");
				}
		%>
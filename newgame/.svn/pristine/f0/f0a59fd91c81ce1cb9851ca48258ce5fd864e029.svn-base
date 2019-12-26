<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="web.webSocket.player.PlayerManager,
    		web.webSocket.mail.MailManager,
    		web.webSocket.activity.ActivityManager,
    		web.webSocket.activity2.Activity2Manager,
    		web.webSocket.activity.Huodong,
    		java.util.*,
    		web.webSocket.pojo.WgPlayerserverClient,
    		web.webSocket.util.Util,
    		web.webSocket.pojo.WgPlayerserver,
    		web.webSocket.pojo.WgPlayerserver3,
    		web.webSocket.pojo.WgPlayerserver5,
    		web.webSocket.pojo.WgPlayerserver6,
    		web.webSocket.handler.SystemWebSocketHandler,
    		web.webSocket.util.BillingCenter,
    		web.webSocket.language.Translate"%>
		<%
		String username=request.getParameter("username");
		long getid=PlayerManager.getInstance().getplayerid(username);
		String sid=request.getParameter("sid");
		WgPlayerserver wg=PlayerManager.getInstance().getplayer(getid);
		if(wg!=null){
			//wg.setDiamond(wg.getDiamond()+300);
			//第一个1  钻石   第二个9标识 月卡领取钻石
			BillingCenter.playerIncrease(wg ,0 , 300, 1, 9);
			wg.setTotalrmbdiamond(wg.getTotalrmbdiamond()+300);
			ActivityManager.payall(wg,300,6);
			
			Activity2Manager.getInstance().funAddNum(wg, 300, Activity2Manager.functionNumber1);
			Activity2Manager.getInstance().checkLifePayRed(wg);
			//ActivityManager.pay(wg, 300);
			Huodong huodong1=ActivityManager.getInstance().getHuodongmap().get(14);
			if(huodong1!=null){
			if(Util.isOpenTime(huodong1.getStarttime(), huodong1.getEndtime())){
				ActivityManager.catpay(wg, 300);//招财猫
				}
			}
			//调用活动充值
			//ActivityManager.getInstance().addpay(wg, 300);
			wg.setCardtime(wg.getCardtime()+30);
			if(wg.getReceive()==0){
			wg.setReceive(1);
			wg.setDirty(true);
			ActivityManager.getInstance().pushmouthcard(wg);
			}
			
			
			int[] type={PlayerManager.cardtimepush,PlayerManager.receivepush,PlayerManager.viplvtype};
			//vip礼包红点  累计充值红点
			PlayerManager.getInstance().vipandrechargered(wg);
			wg.pushplayer(type);
			MailManager.getInstance().sendmail(Translate.commonmessage5,Translate.admin_11,Translate.admin_12, "", (long)-1, getid, 1,1);
			//MailManager.getInstance().sendmail(Translate.commonmessage5, "月卡充值", "月卡充值成功,首次300钻石已发放!", "", (long)-1, getid, 1,1);
			
			//月卡
			WgPlayerserver5 wg5=wg.getWgPlayerserver5();
			if(wg5.getMonthcard()!=1){
				wg5.setMonthcard(1);
			}
			WgPlayerserver6 wg6=wg.getWgPlayerserver6();
			if(wg6.getMonthcard()!=1){
				wg6.setMonthcard(1);
			}
			WgPlayerserver3 wg3=wg.getWgPlayerserver3();
			if(wg3.getFirstlv()==0){
				wg3.setFirstlv(wg.getLevel());
			}
			
			//2018-12-26
			SystemWebSocketHandler systemWebSocketHandler=SystemWebSocketHandler.getInstance();
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("status", 0);
			wg.tongyipush(0,wg.getServeruid(),map,150046,"");
			out.print("success");
		}else{
			out.print("用户不存在");
		}
		%>
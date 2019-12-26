<%@page import="web.webSocket.activity2.Activity2Manager"%>
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
    		web.webSocket.pojo.WgPlayerserver5,
    		web.webSocket.pojo.WgPlayerserver6,
    		web.webSocket.message.MessageManager,
    		web.webSocket.activity.ActivityManager,
    		web.webSocket.activity2.Activity2Manager,
    		web.webSocket.activity.Huodong,
    		web.webSocket.vip.VipManager,
    		web.webSocket.util.BillingCenter,
    		web.webSocket.language.Translate"%>
		<%
		//聚宝钱庄
		String username=request.getParameter("username");
		long getid=PlayerManager.getInstance().getplayerid(username);
		String sid=request.getParameter("sid");
		String diamond=request.getParameter("diamond");
		WgPlayerserver wg=PlayerManager.getInstance().getplayer(getid);
		if(wg!=null && diamond!=null && !diamond.equals("")){
			int num=Integer.valueOf(diamond);
			wg.setTotalrmbdiamond(wg.getTotalrmbdiamond()+num);
			Activity2Manager.getInstance().funAddNum(wg, num, Activity2Manager.functionNumber1);
			Activity2Manager.getInstance().checkLifePayRed(wg);
			ActivityManager.payall(wg, num,1);
			//ActivityManager.pay(wg, num);
			Huodong huodong1=ActivityManager.getInstance().getHuodongmap().get(14);
			if(huodong1!=null){
			if(Util.isOpenTime(huodong1.getStarttime(), huodong1.getEndtime())){
			ActivityManager.catpay(wg, num);//招财猫
				}
			}
			wg.pushplayer(PlayerManager.viplvtype);
			//调用活动充值
			//ActivityManager.getInstance().addpay(wg, num);
			int bank=wg.getBank();
			if(bank>0){
				out.print("error1");
				return;
			}
			wg.setBank(1);
			wg.pushplayer(PlayerManager.banktype);
			//BillingCenter.playerIncrease(wg ,0 , num, 1, 5);
			MailManager.getInstance().sendmail(Translate.commonmessage5,Translate.admin_1, Translate.admin_2, "", (long)-1, getid, 1,1);
			//MailManager.getInstance().sendmail(Translate.commonmessage5, "充值成功", "恭喜您,完成聚宝钱庄充值活动,请注意升级后领取相应的奖励。", "", (long)-1, getid, 1,1);
			//vip礼包红点  累计充值红点
			PlayerManager.getInstance().vipandrechargered(wg);
			//钱庄红点
			PlayerManager.getInstance().bankactivity(wg);
			
			//聚宝
			WgPlayerserver5 wg5=wg.getWgPlayerserver5();
			if(wg5.getBank()!=1){
				wg5.setBank(1);
			}
			WgPlayerserver6 wg6=wg.getWgPlayerserver6();
			if(wg6.getBank()!=1){
				wg6.setBank(1);
			}
			WgPlayerserver3 wg3=wg.getWgPlayerserver3();
			if(wg3.getFirstlv()==0){
				wg3.setFirstlv(wg.getLevel());
			}
			out.print("success");
		}else{
			out.print("用户不存在");
		}
		%>
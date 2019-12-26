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
    		web.webSocket.vip.VipManager,
    		web.webSocket.util.BillingCenter,
    		web.webSocket.language.Translate"%>
		<%
		String username=request.getParameter("username");
		long getid=PlayerManager.getInstance().getplayerid(username);
		String sid=request.getParameter("sid");
		String type=request.getParameter("type");//0:1元   1:10元
		WgPlayerserver wg=PlayerManager.getInstance().getplayer(getid);
		if(wg!=null && type!=null && !type.equals("")){
			String oneyuanstate=wg.getOneyuanstate();
			if(oneyuanstate!=null && !oneyuanstate.equals("")){
				String[] oneyuanstate2=oneyuanstate.split(",");
				if(oneyuanstate2[0].equals("1") && oneyuanstate2[1].equals("1")){
					out.print("error");
					return;
				}else if(type.equals("0") && oneyuanstate2[0].equals("1")){
					out.print("error");
					return;
				}else if(type.equals("1") && oneyuanstate2[1].equals("1")){
					out.print("error");
					return;
				}
				oneyuanstate2[Integer.valueOf(type)]="1";
				wg.setOneyuanstate(Util.Join(oneyuanstate2, ","));
			}
			int num=10;
			if(type.equals("0")){
				num=10;
			}else{
				num=100;
			}
			wg.setTotalrmbdiamond(wg.getTotalrmbdiamond()+num);
			ActivityManager.payall(wg,num,7);
			Activity2Manager.getInstance().funAddNum(wg, num, Activity2Manager.functionNumber1);
			Activity2Manager.getInstance().checkLifePayRed(wg);
			wg.pushplayer(PlayerManager.viplvtype);
			//调用活动充值
			ActivityManager activityManager=ActivityManager.getInstance();
			ActivityManager.catpay(wg, num);//招财猫
			//ActivityManager.pay(wg, num);
			//activityManager.addpay(wg, num);
			BillingCenter.playerIncrease(wg ,1000024 , num, BillingCenter.diamondtype, BillingCenter.articleaddtype);
			int result=1;
			if(num>=100){
				result=11;
			}
			//MailManager.getInstance().sendmail("系统的邮件", "充值成功", "恭喜您成功充值"+num+"钻石,并获得了"+result+"份抽奖码,抽奖码可在一元夺宝界面查看。", "", (long)-1, getid, 1,1);
			MailManager.getInstance().sendmail(Translate.commonmessage5,Translate.admin_1, Translate.translateString(Translate.admin_13, new String[][]{{"@num1@",String.valueOf(num)},{"@num2@",String.valueOf(result)}}), "", (long)-1, getid, 1,1);
			if(num==10){
				activityManager.oneyuannumer(0,getid);
			}else if(num==100){
				activityManager.oneyuannumer(1,getid);
			}
			//1元活动
			WgPlayerserver5 wg5=wg.getWgPlayerserver5();
			if(wg5.getOneyuan()!=1){
				wg5.setOneyuan(1);
			}
			WgPlayerserver6 wg6=wg.getWgPlayerserver6();
			if(wg6.getOneyuan()!=1){
				wg6.setOneyuan(1);
			}
			WgPlayerserver3 wg3=wg.getWgPlayerserver3();
			if(wg3.getFirstlv()==0){
				wg3.setFirstlv(wg.getLevel());
			}
			//vip礼包红点  累计充值红点
			PlayerManager.getInstance().vipandrechargered(wg);
			out.print("success");
		}else{
			out.print("error");
		}
		%>
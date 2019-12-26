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
    		web.webSocket.message.MessageManager,
    		web.webSocket.activity.ActivityManager,
    		web.webSocket.activity2.Activity2Manager,
    		web.webSocket.vip.VipManager,
    		web.webSocket.handler.SystemWebSocketHandler,
    		web.webSocket.util.BillingCenter,
    		web.webSocket.language.Translate"%>
		<%
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
			ActivityManager.pay(wg, num);
			ActivityManager.payall(wg,num,8);
			ActivityManager.catpay(wg, num);//招财猫
			wg.pushplayer(PlayerManager.viplvtype);
			//调用活动充值
			ActivityManager.getInstance().addpay(wg, num);
			BillingCenter.playerIncrease(wg ,1000024 , num, BillingCenter.diamondtype, BillingCenter.articleaddtype);
			//MailManager.getInstance().sendmail("系统的邮件", "充值成功", "恭喜您成功充值"+diamond+"钻石。", "", (long)-1, getid, 1,1);
			MailManager.getInstance().sendmail(Translate.commonmessage5,Translate.admin_1,Translate.translateString(Translate.admin_5, new String[][]{{"@num@",String.valueOf(diamond)}}), "", (long)-1, getid, 1,1);
			//vip礼包红点  累计充值红点
			PlayerManager.getInstance().vipandrechargered(wg);
			//7日充值活动
			wg.getWgPlayerserver4().sevendayactivity(num,wg);
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
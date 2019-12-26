<%@page import="web.webSocket.article.ArticleManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="web.webSocket.player.PlayerManager,
    		web.webSocket.mail.MailManager,
    		web.webSocket.activity.ActivityManager,
    		web.webSocket.activity2.Activity2Manager,
    		java.util.*,
    		web.webSocket.util.Util,
    		web.webSocket.article.Article,
    		web.webSocket.article.ArticleManager,
    		web.webSocket.activity.Huodong,
    		web.webSocket.pojo.WgPlayerserverClient,
    		web.webSocket.pojo.WgPlayerserver,
    		web.webSocket.pojo.WgPlayerserver3,
    		web.webSocket.pojo.WgPlayerserver5,
    		web.webSocket.pojo.WgPlayerserver6,
    		web.webSocket.handler.SystemWebSocketHandler,
    		web.webSocket.message.MessageManager,
    		web.webSocket.util.BillingCenter,
    		web.webSocket.language.Translate"%>
		<%
		String username=request.getParameter("username");
		long getid=PlayerManager.getInstance().getplayerid(username);
		String sid=request.getParameter("sid");
		WgPlayerserver wg=PlayerManager.getInstance().getplayer(getid);
		if(wg!=null){
			WgPlayerserver3 wg3 = wg.getWgPlayerserver3();
			wg.setTotalrmbdiamond(wg.getTotalrmbdiamond()+60);
			ActivityManager.payall(wg,60,9);
			Activity2Manager.getInstance().funAddNum(wg, 60, Activity2Manager.functionNumber1);
			Activity2Manager.getInstance().checkLifePayRed(wg);
			Huodong huodong1=ActivityManager.getInstance().getHuodongmap().get(14);
			if(huodong1!=null){
			if(Util.isOpenTime(huodong1.getStarttime(), huodong1.getEndtime())){
				ActivityManager.catpay(wg, 60);//招财猫
				}
			}
			//ActivityManager.pay(wg, 60);
			//调用活动充值
			//ActivityManager.getInstance().addpay(wg, 60);
			if(wg3.getWeekcardtime()==null){
				wg3.setWeekcardtime(0);
			}
			wg3.setWeekcardtime(wg3.getWeekcardtime()+7);
			if(wg3.getWeekcardreceive()==0){
			wg3.setWeekcardreceive(1);
			MessageManager.pushred(68, wg,1);
			}
			wg3.setDirty(true);
			wg.setDirty(true);
			
			int[] type={PlayerManager.viplvtype,PlayerManager.weekstatus,PlayerManager.weektime};
			//vip礼包红点  累计充值红点
			PlayerManager.getInstance().vipandrechargered(wg);
			wg.pushplayer(type);
			Article article=ArticleManager.getInstance().getarticle(3000101);
			//MailManager.getInstance().fulisendmail("系统的邮件", "购买周卡成功", "购买周卡成功，即日起，连续7天每天可领取超值奖励。恭喜您获得周卡赠送"+article.getName()+"x1，请查收附件！", article.getId()+":"+1, (long) -1, getid, 1);
			MailManager.getInstance().fulisendmail(Translate.commonmessage5, Translate.admin_14, Translate.translateString(Translate.admin_15, new String[][]{{"@name@",article.getName()}}), article.getId()+":"+1, (long) -1, getid, 1);
			
			//周卡
			WgPlayerserver6 wg6=wg.getWgPlayerserver6();
			if(wg6.getWeekcard()==null||wg6.getWeekcard()!=1){
				wg6.setWeekcard(1);
			}
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
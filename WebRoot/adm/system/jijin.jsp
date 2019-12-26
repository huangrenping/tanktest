<%@page import="web.webSocket.plot.PlotManager"%>
<%@page import="web.webSocket.vip.VipManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="
    web.webSocket.player.PlayerManager,
    web.webSocket.article.ArticleManager,

    web.webSocket.mail.MailManager,
    java.util.*,
    web.webSocket.article.Knapsack,
    web.webSocket.article.Article,
    web.webSocket.article.Article2,
    web.webSocket.pojo.WgPlayerserver2,
    web.webSocket.pojo.WgPlayerserver3,
    web.webSocket.activity.ActivityManager,
    web.webSocket.activity2.Activity2Manager,
    web.webSocket.activity.Huodong,
    web.webSocket.pojo.WgPlayerserverClient,
    web.webSocket.vip.VipManager,
    web.webSocket.message.Messagepush,
    web.webSocket.util.Util,
    web.webSocket.activity.Superbag,
    web.webSocket.handler.SystemWebSocketHandler,
    web.webSocket.pojo.WgPlayerserver5,
    web.webSocket.pojo.WgPlayerserver6,
    web.webSocket.pojo.WgPlayerserver,
    web.webSocket.message.MessageManager,
    web.webSocket.language.Translate,
    web.webSocket.plot.PlotManager"%>
		<%
		/**
		*用于发送礼包
		**/
		String username=request.getParameter("username");
		long getid=PlayerManager.getInstance().getplayerid(username);
		String sid=request.getParameter("sid");
		String type=request.getParameter("type");//传过来的 type是superbag id
		ActivityManager activityManager=ActivityManager.getInstance();
		WgPlayerserver wg=PlayerManager.getInstance().getplayer(getid);
		if(wg!=null && type!=null && !type.equals("")){
			wg.getWgPlayerserver2().setJijinbuy(1);
			PlotManager.addjijin(wg,-1);
			Map<String,Object> mapfour=new HashMap<String,Object>();
			mapfour.put("status", 0);
			wg.tongyipush(0,wg.getServeruid(),mapfour,150046,"");
			
			wg.setTotalrmbdiamond(wg.getTotalrmbdiamond()+98*10);
			int[] typepush={PlayerManager.cardtimepush,PlayerManager.receivepush,PlayerManager.viplvtype};
			//vip礼包红点  累计充值红点
			PlayerManager.getInstance().vipandrechargered(wg);
			wg.pushplayer(typepush);
			//MailManager.getInstance().sendmail(Translate.commonmessage5,Translate.admin_11,Translate.admin_12, "", (long)-1, getid, 1,1);
			ActivityManager.payall(wg,98*10,5);
			
			out.print("success");
			return ;
		}else{
			out.print("error");
			return ;
		}
		%>
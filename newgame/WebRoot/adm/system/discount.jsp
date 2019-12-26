<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="
    web.webSocket.player.PlayerManager,
    web.webSocket.article.ArticleManager,
    web.webSocket.mail.MailManager,
    java.util.*,
    web.webSocket.message.MessageManager,
    web.webSocket.article.Knapsack,
    web.webSocket.article.Article,
    web.webSocket.util.Util,
    web.webSocket.pojo.WgPlayerserver2,
    web.webSocket.pojo.WgPlayerserver3,
    web.webSocket.pojo.WgPlayerserver5,
    web.webSocket.pojo.WgPlayerserver6,
    web.webSocket.activity.ActivityManager,
    web.webSocket.pojo.WgPlayerserverClient,
    web.webSocket.activity.Superbag,
    web.webSocket.handler.SystemWebSocketHandler,
    web.webSocket.pojo.WgPlayerserver"%>
		<%
		/**type 0挡 1挡 2挡
		*用于发送特价礼包  1元礼包  3元礼包  6元礼包
		**/
		String username=request.getParameter("username");
		long getid=PlayerManager.getInstance().getplayerid(username);
		String sid=request.getParameter("sid");
		String type=request.getParameter("type");
		int array[] ={1,3,6};  
		int[] articleall=ActivityManager.articleall;
		WgPlayerserver wg=PlayerManager.getInstance().getplayer(getid);
		if(wg!=null && type!=null && !type.equals("")){
			String[] specialoffergift=wg.getSpecialoffergift2().split(",");
			String result=specialoffergift[Integer.valueOf(type)];
			if(result.equals("0")){
				wg.setTotalrmbdiamond(wg.getTotalrmbdiamond()+array[Integer.valueOf(type)]*10);
				ActivityManager.payall(wg, array[Integer.valueOf(type)]*10,3);
				ActivityManager.catpay(wg, array[Integer.valueOf(type)]*10);//招财猫
				//ActivityManager.pay(wg, array[Integer.valueOf(type)]*10);
				//调用活动充值
				//ActivityManager.getInstance().addpay(wg, array[Integer.valueOf(type)]*10);
				//vip礼包红点  累计充值红点
				PlayerManager.getInstance().vipandrechargered(wg);
				int[] pushall={PlayerManager.libaostatuspush,PlayerManager.viplvtype};
				wg.pushplayer(pushall);
				MessageManager.pushred(8, wg,1);
				specialoffergift[Integer.valueOf(type)]="1";
				wg.setSpecialoffergift2(Util.Join(specialoffergift, ","));
				
				//限购礼包
				WgPlayerserver5 wg5=wg.getWgPlayerserver5();
				if(wg5.getTypebug()!=1){
					wg5.setTypebug(1);
				}
				WgPlayerserver6 wg6=wg.getWgPlayerserver6();
				if(wg6.getTypebug()!=1){
					wg6.setTypebug(1);
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
				out.print("error1");
			}
		}else{
			out.print("用户不存在");
		}
		%>
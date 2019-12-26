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
    web.webSocket.pojo.WgPlayerserverClient,
    web.webSocket.vip.VipManager,
    web.webSocket.message.Messagepush,
    web.webSocket.activity.Superbag,
    web.webSocket.handler.SystemWebSocketHandler,
    web.webSocket.pojo.WgPlayerserver5,
    web.webSocket.pojo.WgPlayerserver6,
    web.webSocket.pojo.WgPlayerserver"%>
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
			Superbag superbag=activityManager.getsuperbagone(Integer.valueOf(type));
			if(superbag==null){
				out.print("error1");
				return ;
			}
			ArticleManager articleManager=ArticleManager.getInstance();
			Article article=articleManager.getarticle(superbag.getArticleid());
			if(article==null){
				out.print("error2");
				return ;
			}
			//判断已购次数与限制次数
			WgPlayerserver2 wgPlayerserver2=wg.getWgPlayerserver2();
			int num=wgPlayerserver2.getonegiftbagsecond(superbag.getId());
			int second=superbag.getSecond();
			Map<Integer,Integer> mapkadd=new HashMap<Integer,Integer>();
			if(second!=-1){
				/*if(num>=second){
					out.print("error3");
					return ;
				}*/
			}
			
			//2018-12-25
			String libaosuperbagid=VipManager.libaoshoppingid;
			String[] libaosuperbagidarr=libaosuperbagid.split(",");
			for(int j=0; j<libaosuperbagidarr.length; j++){
				if(libaosuperbagidarr[j].endsWith(type)){
					if(wg.getViplevel()<=j){
						out.print("error5");
						return ;
					}
				}
			}
			
			
			
			wgPlayerserver2.addgiftbagsecondmap(Integer.valueOf(type),1);
			String articleandnum=article.getIds();
			String[] articlearray=articleandnum.split(",");
								  //金币         钻石                  体力                  相思豆                情缘线索
			String[] aticlearray={"1000006","1000024","2000001","2000002","2000004"};
			List<String> aticlelist=Arrays.asList(aticlearray);
			Map<Integer,Integer> mapone=new HashMap<Integer,Integer>();
			for(int i=0;i<articlearray.length;i++){
				String[] articlearray2=articlearray[i].split(":");
				mapkadd.put(Integer.valueOf(articlearray2[0]),Integer.valueOf(articlearray2[1]));
				if(!aticlelist.contains(articlearray2[0])){
					mapone.put(Integer.valueOf(articlearray2[0]), Integer.valueOf(articlearray2[1]));
				}
			}
			if(mapone.size()>0){
				List<Article2> listtwo=new ArrayList<Article2>();
				for(Integer in:mapone.keySet()){
					List<Article2> listone=articleManager.getarticle2(in, mapone.get(in));
					listtwo.addAll(listone);
				}
				Map<String,Object> maptwo=new HashMap<String,Object>();
				maptwo.put("articlelist", listtwo);
				wg.pushshopping(maptwo);
			}
			//vip礼包红点  累计充值红点
		
			wg.setTotalrmbdiamond(wg.getTotalrmbdiamond()+superbag.getPrice()*10);
			//ActivityManager.pay(wg, superbag.getPrice()*10);
			ActivityManager.catpay(wg, superbag.getPrice()*10);//招财猫
			PlayerManager.getInstance().vipandrechargered(wg);
			//调用活动充值
			//ActivityManager.getInstance().addpay(wg, superbag.getPrice()*10);
			wg.pushplayer(PlayerManager.viplvtype);
			wg.getKnapsack().addknapsackall(mapkadd);
			
			//超值礼包
			WgPlayerserver5 wg5=wg.getWgPlayerserver5();
			if(wg5.getSuperbag()!=1){
				wg5.setSuperbag(1);
			}
			WgPlayerserver6 wg6=wg.getWgPlayerserver6();
			if(wg6.getSuperbag()!=1){
				wg6.setSuperbag(1);
			}
			WgPlayerserver3 wg3=wg.getWgPlayerserver3();
			if(wg3.getFirstlv()==0){
				wg3.setFirstlv(wg.getLevel());
			}
			//2018-11-20
			//广播
			SystemWebSocketHandler systemWebSocketHandler=SystemWebSocketHandler.getInstance();
			if(superbag.getIsnotice()==1){
				List<Messagepush> listpush=new ArrayList<Messagepush>();
				String content= "恭喜#green"+wg.getPlayername()+"#end成功购买"+article.getName();
				String url="";
				Messagepush messagepush=new Messagepush(content, url, 0);
				listpush.add(messagepush);
				if(listpush.size()>0){
					try {
						//systemWebSocketHandler.broadcast(listpush,110001,"");
						MessageManager.getInstance().addbroadcast(0, 110001, listpush);
					} catch (Exception e) {
						e.printStackTrace();
						// TODO: handle exception
					}
				}
			}
			//充值成功推送消息
			Map<String, Object> mapthree=activityManager.giftbagmain(getid);
			wg.tongyipush(0,getid,mapthree.get("map"),150010,"");
			
			
			//2018-12-26
			Map<String,Object> mapfour=new HashMap<String,Object>();
			mapfour.put("status", 0);
			wg.tongyipush(0,wg.getServeruid(),mapfour,150046,"");
			out.print(superbag.getId()+"--");
			//2019-1-24
			if(superbag.getId()==281){
				Map<String, Object> mapsix=PlayerManager.getInstance().getwgopen(getid);
				if(mapsix!=null){
					MailManager.getInstance().sendmail("1元礼包", "恭喜您成功购买1元礼包，奖励已成功发放。感谢您的支持，祝您游戏愉快！", "",getid);
					wg.tongyipush(0,getid,mapsix.get("map"),10010,"");
				}
			}
			out.print("success");
			return ;
		}else{
			out.print("error4");
			return ;
		}
		%>
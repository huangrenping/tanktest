<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "web.webSocket.article.Article"%>
<%@ page import = "java.util.Arrays"%>
<%@ page import = "java.util.Map"%>
<%@ page import = "web.webSocket.company.Company"%>
<%@ page import = "web.webSocket.player.PlayerManager"%>
<%@ page import = "web.webSocket.pojo.WgCompany"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver8"%>
<%@ page import = "web.webSocket.food.FoodManager"%>
<%@ page import = "web.webSocket.food.Dish"%>
<%@ page import = "web.webSocket.food.FoodManager"%>
<%@ page import = "web.webSocket.mail.MailManager"%>
<%@ page import = "web.webSocket.treasure.TreasureManager"%>
<% 
			WgPlayerserver[] getplayers = PlayerManager.getInstance().getplayers();
		int[] cookingmoney = FoodManager.cookingmoney;
		for (WgPlayerserver wgPlayerserver : getplayers) {
			if(!wgPlayerserver.getPlayername().equals("GM") && !wgPlayerserver.getPlayername().equals("系统邮件")){
				
				String open =wgPlayerserver.getWgPlayerserver2().getOpen();
				int aflag = 0;
				int bflag = 0;
				if(open!=null){
				for (String str : open.split(",")) {
					if (str.equals("10026")) {
						aflag = 1;
					}
					if(str.equals("10053")){
						bflag = 1;
					}
				}
				}

				if(aflag==1){
					//已完成菜肴数量
					String [] cookingfinshnums= null;
					//正在制作菜肴数量
					String [] cookingdishnums = null;
					//正在制作的菜肴
					String [] cookingdishs =null;
					WgPlayerserver8 playerserver8 = wgPlayerserver.getWgPlayerserver8();
					String cookingdish = playerserver8.getCookingdish();
					if(cookingdish!=null &&!cookingdish.equals("")) {
						cookingdishs = cookingdish.split(",");
					}
					String cookingdishnum = playerserver8.getCookingdishnum();
					if(cookingdishnum!=null && !cookingdishnum.equals("")) {
						cookingdishnums = cookingdishnum.split(",");
					}
					String cookingfinshnum = playerserver8.getCookingfinshnum();
					//out.println(cookingfinshnum+"----");
					if(cookingfinshnum!=null && !cookingfinshnum.equals("")) {
						cookingfinshnums = cookingfinshnum.split(",");
					}
					String food="";
					if(cookingdishs!=null){
						for (int i = 0; i < cookingdishs.length; i++) {
						if(cookingdishs[i]!=null && (!cookingdishs[i].equals("-1") || !cookingdishs[i].equals("0"))) {
							int sum = 0;
							if(cookingdishnums!=null){
								if(cookingdishnums[i]!=null && !cookingdishnums[i].equals("0")) {
								sum+=Integer.parseInt(cookingdishnums[i]);
								}
							}
							if(cookingfinshnums!=null){
								if(!cookingfinshnums[i].equals("0")) {
								sum+=Integer.parseInt(cookingfinshnums[i]);
								}
							}
							if(sum>0) {
								System.err.println("玩家id:"+wgPlayerserver.getServeruid()+"-------菜肴id:"+cookingdishs[i]+"-------数量:"+sum);
								Map<Integer, Dish> dishmap = FoodManager.getInstance().getDishMap();
								Dish dish = dishmap.get(Integer.parseInt(cookingdishs[i]));
								if(dish!=null){
									food+=dish.getArticleid()+":"+sum+",";
								}
							}
						}
					}
					}
					if(!food.equals("")){
						System.err.println("菜肴:"+food);
						MailManager.getInstance().fulisendmail("GM的邮件","邮件补偿菜肴发放","烹饪栏位去除，补偿所有烹饪中和已完成的所有菜肴请查收附件！", food, (long) -1, wgPlayerserver.getServeruid(), 1);
					}
					
					String newcookingdish="-1,-1,-1,-1,-1,-1";
					String newcookingdishnum="0,0,0,0,0,0";
					String newcookingfinshnum="0,0,0,0,0,0";
					playerserver8.setCookingdish(newcookingdish);
					playerserver8.setCookingdishnum(newcookingdishnum);
					playerserver8.setCookingfinshnum(newcookingfinshnum);
					playerserver8.setCookingtype("0,0,0,0,0,0");
					playerserver8.setDirty(true);
					
					//玩家烹饪格子
					String [] cookingfields = {};
					int summoney=0;
					playerserver8 = wgPlayerserver.getWgPlayerserver8();
					String cookingfield = playerserver8.getCookingfield();
					if(cookingfield!=null && !cookingfield.equals("")) {
						cookingfields = cookingfield.split(",");
					}
					for (int i = 0; i < cookingfields.length; i++) {
						if(cookingfields[i].equals("1")){
							summoney+=cookingmoney[i];
						}
					}
					if(summoney>0){
						MailManager.getInstance().fulisendmail("GM的邮件","邮件补偿钻石","烹饪栏位去除，补偿开启栏位花费的砖石请查收附件！", "1000024:"+summoney, (long) -1, wgPlayerserver.getServeruid(), 1);
					}
					String newcookingfield="1,0,0,0,0,0";
				
					playerserver8.setCookingfield(newcookingfield);
					playerserver8.setDirty(true);
					System.err.println("玩家id:"+wgPlayerserver.getServeruid()+"-------玩家补偿砖石:"+summoney);
				
					System.err.println("--------------------------------------------------"+wgPlayerserver.getServeruid());
				}
				
				
				if(bflag==1){
					//藏宝阁是否开启；
					WgPlayerserver8 playerserver8 = wgPlayerserver.getWgPlayerserver8();
					int buffadd=playerserver8.buffadd(TreasureManager.foodCutTimeType);
					if(buffadd>0){
						Map<Integer, Integer> mapone=playerserver8.getMapbuffadd().get(TreasureManager.foodCutTimeType);
						if(mapone.get(801)!=null){
							mapone.put(801, 100);
						}
						if(mapone.get(802)!=null){
							mapone.put(802, 100);
						}
						if(mapone.get(803)!=null){
							mapone.put(803, 150);
						}
						if(mapone.get(804)!=null){
							mapone.put(804, 150);
						}
						playerserver8.savebuffadd();
						System.err.println("----------------------buffchange----------------------------"+wgPlayerserver.getServeruid());
					}
				}
			}
		
		
		}
		out.println("success");
		
%>
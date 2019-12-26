package web.game.common;

import web.game.pojo.WgPlayer;
import web.game.util.Util;

public class Commoncost {
	//货币类型；
	public static int goldtype=0;
	public static int diamondtype=1;
	
	
	//增加道具类型；
	public static int knapsack=0; //背包；
	public static int levelup=1;//升级；
	public static int buytank=2;//购买坦克；
	
	public static void playerExpense(WgPlayer wgplayer,int aid,String expenseAmount, int currencyType,int resion){
		synchronized (wgplayer) {
			if(currencyType==Commoncost.goldtype){
				wgplayer.setGold(Util.UtilBigDecimal(wgplayer.getGold(), expenseAmount, 1));
			}else{
				int expense=Integer.valueOf(expenseAmount);
				if(currencyType==Commoncost.diamondtype){
					long now=wgplayer.getDiamond();
					wgplayer.setDiamond(now-expense);
				}	
				
			}
		}
	}
	
	public static void playerIncrease(WgPlayer wgplayer,int aid,String add, int currencyType,int resion){
		synchronized (wgplayer) {
			if(currencyType==Commoncost.goldtype){
				wgplayer.setGold(Util.UtilBigDecimal(wgplayer.getGold(), add,0));
			}else{
				int newadd=Integer.valueOf(add);
				if(currencyType==Commoncost.diamondtype){
					long now=wgplayer.getDiamond();
					wgplayer.setDiamond(now+newadd);
				}
			}
		}
		
	}
	
	
	

}

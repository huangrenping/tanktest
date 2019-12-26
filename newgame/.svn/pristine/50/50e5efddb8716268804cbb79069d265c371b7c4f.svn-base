package web.game.player;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.xuanzhi.tools.text.ParamUtils;

import web.game.common.GamecommonController;
import web.game.player.logic.PlayerLogicInt;
import web.game.util.JsonResultUtilgame;
import web.game.util.JsonResultgame;

public class PlayerController implements GamecommonController{
	private PlayerLogicInt playerLogicInt;

	public void setPlayerLogicInt(PlayerLogicInt playerLogicInt) {
		this.playerLogicInt = playerLogicInt;
	}
	
	public JsonResultgame<Map<String, Object>> httpSend(int type,long playerid,int eventID,String data){
		int error=0;
		String info="";
		Map<String,Object> map=new HashMap<String, Object>();
		try {
			if(type==1){
				map=playerLogicInt.user(playerid);
				error=(Integer) map.get("error");
			}else if(type==2){//七日奖励；
				map=playerLogicInt.sevenday(playerid);
				error=(Integer) map.get("error");
			}else if(type==3){//领取七日奖励；
				map=playerLogicInt.sevendayreward(playerid, data);
				error=(Integer) map.get("error");
			}else if(type==10){//同步数据；
				map=playerLogicInt.synchronousData(playerid,data);
				error=(Integer) map.get("error");
			}else if(type==11){ //购买坦克；
				map=playerLogicInt.buytank(playerid,data);
				error=(Integer) map.get("error");
				if(error==1){
					info=PlayerManager.content(2);
				}
			}else if(type==12){//排行榜；
				map=playerLogicInt.topall(playerid);
			}else if(type==13){
				//发送升级奖励；
				map=playerLogicInt.uplevel(playerid,data);
				error=(Integer) map.get("error");
				if(error==1){
					info=PlayerManager.content(3);
				}	
			}else if(type==100){
				map=playerLogicInt.test(playerid,data);
				error=(Integer) map.get("error");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return  JsonResultUtilgame.result(map,info,error,eventID,null);
	}

}

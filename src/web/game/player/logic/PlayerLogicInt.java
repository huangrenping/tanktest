package web.game.player.logic;

import java.util.Map;

public interface PlayerLogicInt {
	Map<String,Object> user(long playerid);
	Map<String,Object> test(long playerid,String data);
	Map<String,Object> synchronousData(long playerid,String data);
	
	Map<String,Object> sevenday(long playerid);
	
	Map<String,Object> sevendayreward(long playerid,String data);

	Map<String,Object> buytank(long playerid,String data);
	
	Map<String,Object> topall(long playerid);
	
	Map<String,Object> uplevel(long playerid,String data);
}

package web.game.common;

import java.util.Map;


import web.game.util.JsonResultgame;

public interface GamecommonController {
	JsonResultgame<Map<String, Object>> httpSend(int type,long playerid,int eventID,String data);
}

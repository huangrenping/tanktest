package web.game.tasks.logic;

import java.util.Map;

public interface TasksLogicInt {
	Map<String,Object> main(long playerid);
	
	Map<String,Object> taskmain(long playerid);
	
	Map<String,Object> taskdailyreceived(long playerid,String userdata);
	
	Map<String,Object> taskreceived(long playerid,String userdata);

}

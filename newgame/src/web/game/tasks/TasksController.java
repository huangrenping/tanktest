package web.game.tasks;

import java.util.HashMap;
import java.util.Map;

import javax.persistence.Transient;
import javax.servlet.http.HttpServletRequest;

import web.game.common.GamecommonController;
import web.game.language.Translate;
import web.game.player.PlayerManager;
import web.game.tasks.logic.TasksLogicInt;
import web.game.util.JsonResultUtilgame;
import web.game.util.JsonResultgame;

public class TasksController implements GamecommonController{
	private TasksLogicInt tasksLogicInt;

	public void setTasksLogicInt(TasksLogicInt tasksLogicInt) {
		this.tasksLogicInt = tasksLogicInt;
	}
	
	@Override
	public JsonResultgame<Map<String,Object>> httpSend(int type,long playerid,int eventID,String userdata){
		int error=0;
		String info="success";
		Map<String,Object> map=new HashMap<String, Object>();
		try {
			if(type==1){ //成就主界面；
				map=tasksLogicInt.main(playerid);
				error=(Integer) map.get("error");
			}else if(type==2){ //日常任务主界面；
				map=tasksLogicInt.taskmain(playerid);
				error=(Integer) map.get("error");
			}else if(type==3){//成就任务领取；
				map=tasksLogicInt.taskdailyreceived(playerid,userdata);
				error=(Integer) map.get("error");
				if(error==0){
					info="success";
				}else{
					info=PlayerManager.content(1);
				}
			}else if(type==4){//日常任务领取；
				map=tasksLogicInt.taskreceived(playerid,userdata);
				error=(Integer) map.get("error");
				if(error==0){
					info="success";
				}else{
					info=PlayerManager.content(1);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return  JsonResultUtilgame.result(map,info,error,eventID);
	}
	

}

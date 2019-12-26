package web.game.tasks.logic.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import web.game.article.Article2;
import web.game.article.ArticleManager;
import web.game.player.PlayerManager;
import web.game.pojo.WgPlayer;
import web.game.pojo.WgPlayer1;
import web.game.tasks.Dailytask;
import web.game.tasks.DailytaskClient;
import web.game.tasks.Task;
import web.game.tasks.TaskClient;
import web.game.tasks.TasksManager;
import web.game.tasks.logic.TasksLogicInt;
import web.game.user.Knapsack;
import web.game.util.JacksonManager;

/**
 * @author Administrator
 *
 */
/**
 * @author Administrator
 *
 */
public class TasksLogicImpl implements TasksLogicInt{

	@Override
	public Map<String, Object> main(long playerid) {
		Map<String, Object> map=new HashMap<String, Object>();
		WgPlayer wgplayer=PlayerManager.getInstance().getplayer(playerid);
		if(wgplayer==null){
			map.put("error", -1);
			return map;
		}
		WgPlayer1 wgPlayer1=wgplayer.getWgPlayer1();
		Map<Integer,List<Integer>> mapdailytasks=wgPlayer1.getMapdailytasks();
		TasksManager tasksManager=TasksManager.getInstance();
		List<Dailytask> listfristdaily=tasksManager.getListfristdaily();
		List<DailytaskClient> list=new ArrayList<DailytaskClient>();
		for (Dailytask dailytask : listfristdaily) {
			DailytaskClient dailytaskClient=new DailytaskClient();
			int tasktype=dailytask.getTasktype();
			int id=dailytask.getId();
			int num=0;
			int status=0;
			List<Integer> listone=mapdailytasks.get(tasktype);
			if(listone!=null){
				id=listone.get(0);
				num=listone.get(1);
				status=listone.get(2);
			}
			Dailytask ndailytask=null;
			if(id==dailytask.getId()){
				ndailytask=dailytask;
			}else{
				ndailytask=tasksManager.getMapdaily().get(id);
			}
			dailytaskClient.setCount(ndailytask.getCount());
			dailytaskClient.setDescription(ndailytask.getDescription());
			dailytaskClient.setFirst(ndailytask.getFirst());
			dailytaskClient.setId(ndailytask.getId());
			dailytaskClient.setName(ndailytask.getName());
			dailytaskClient.setNextid(ndailytask.getNextid());
			dailytaskClient.setReward(ndailytask.getReward());
			dailytaskClient.setTasktype(ndailytask.getTasktype());
			dailytaskClient.setType(ndailytask.getType());
			dailytaskClient.setNum(num);
			dailytaskClient.setStatus(status);
			list.add(dailytaskClient);
		}
		int error=0;
		map.put("list", list);
		map.put("error", error);
		return map;
	}

	@Override
	public Map<String, Object> taskmain(long playerid) {
		Map<String, Object> map=new HashMap<String, Object>();
		WgPlayer wgplayer=PlayerManager.getInstance().getplayer(playerid);
		if(wgplayer==null){
			map.put("error", -1);
			return map;
		}
		WgPlayer1 wgPlayer1=wgplayer.getWgPlayer1();
		Map<Integer,List<Integer>> maptasks=wgPlayer1.getMaptasks();
		
		List<TaskClient> tasklist=new ArrayList<TaskClient>();
		tasklist=new ArrayList<TaskClient>();
		TasksManager tasksManager=TasksManager.getInstance();
		Map<Integer, Task> taskmap=tasksManager.getTaskmap();
		for(Integer in:taskmap.keySet()){
			Task task=taskmap.get(in);
			int wgnum=0;
			int isreceive=0;
			TaskClient taskc=new TaskClient();
			taskc.setAdd(task.getAdd());
			taskc.setDescription(task.getDescription());
			taskc.setId(task.getId());
			taskc.setName(task.getName());
			taskc.setNum(task.getNum());
			taskc.setReward(task.getReward());
			taskc.setAdd(task.getAdd());
			taskc.setAddexperience(task.getAddexperience());
			taskc.setFactory(task.getFactory());
			taskc.setArgs(task.getArgs());
			taskc.setPaixu(task.getPaixu());
			List<Integer> listone=maptasks.get(task.getId());
			if(listone!=null){
				wgnum=listone.get(0);
				isreceive=listone.get(1);
			}
			taskc.setWgnum(wgnum);
			taskc.setIsreceive(isreceive);
			tasklist.add(taskc);
		}
		
		map.put("list", tasklist);
		int error=0;
		map.put("error", error);
		return map;	
	}

	
	/* (non-Javadoc)
	 * @领取日常任务；
	 */
	@Override
	public Map<String, Object> taskdailyreceived(long playerid, String userdata) {
		Map<String,String> httpget=JacksonManager.maphttpget(userdata);
		Map<String, Object> map=new HashMap<String, Object>();
		String oid=httpget.get("id");
		if(oid==null){
			map.put("error", -2);
			return map;
		}
		int id=Integer.valueOf(oid);
		WgPlayer wgplayer=PlayerManager.getInstance().getplayer(playerid);
		if(wgplayer==null){
			map.put("error", -1);
			return map;
		}
		Dailytask  dailytask=TasksManager.getInstance().getMapdaily().get(id);
		
		WgPlayer1 wgPlayer1=wgplayer.getWgPlayer1();
		List<Integer> list=wgPlayer1.getMapdailytasks().get(dailytask.getTasktype());
		if(list==null){
			map.put("error", -3);
			return map;
		}
		if(list.get(2)!=1){
			map.put("error", -4);
			return map;
		}
		list.set(2, 2);
		wgPlayer1.setMapdailytasks(wgPlayer1.getMapdailytasks());
		wgPlayer1.addnextdailytask(list.get(0));
		
		
		
		String award=dailytask.getReward();
		List<Article2> listarticle=ArticleManager.getarticlelist1(award);
		
		Knapsack knapsack=wgplayer.getKnapsack();
		knapsack.addknapsackall(award);
		//红点；
		wgPlayer1.openred(PlayerManager.dailytask);
		
		map.put("listarticle", listarticle);
		int error=0;
		map.put("error", error);
		return map;	
	}

	@Override
	public Map<String, Object> taskreceived(long playerid, String userdata) {
		Map<String,String> httpget=JacksonManager.maphttpget(userdata);
		Map<String, Object> map=new HashMap<String, Object>();
		String oid=httpget.get("id");
		if(oid==null){
			map.put("error", -2);
			return map;
		}
		int id=Integer.valueOf(oid);
		WgPlayer wgplayer=PlayerManager.getInstance().getplayer(playerid);
		if(wgplayer==null){
			map.put("error", -1);
			return map;
		}
		Task  task=TasksManager.getInstance().getTaskmap().get(id);
		
		WgPlayer1 wgPlayer1=wgplayer.getWgPlayer1();
		List<Integer> list=wgPlayer1.getMaptasks().get(id);
		if(list==null){
			map.put("error", -3);
			return map;
		}
		if(list.get(1)!=1){
			map.put("error", -4);
			return map;
		}
		list.set(1, 2);
		wgPlayer1.setMaptasks(wgPlayer1.getMaptasks());
		
		String award=task.getReward();
		List<Article2> listarticle=ArticleManager.getarticlelist1(award);
		
		Knapsack knapsack=wgplayer.getKnapsack();
		knapsack.addknapsackall(award);
		//红点；
		wgPlayer1.openred(PlayerManager.task);
		
		map.put("listarticle", listarticle);
		int error=0;
		map.put("error", error);
		return map;	
	}

}

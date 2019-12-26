package web.game.pojo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.*;

import org.springframework.scheduling.config.TaskManagementConfigUtils;

import com.google.gson.reflect.TypeToken;

import web.game.player.PlayerManager;
import web.game.tasks.Dailytask;
import web.game.tasks.Task;
import web.game.tasks.TasksManager;
import web.game.util.JacksonManager;

@Table(name = "wg_player1")
public class WgPlayer1 {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private Integer sid;

    private Long uid;

    private String tasks;
    @Transient
    private Map<Integer,List<Integer>> maptasks;
    
    private String dailytasks;
    
    @Transient
    private boolean dirty;
    
    
    private String knapsack;
    
    @Transient
    private Map<Integer,Integer> mapknapsack;
    
    
    private String sevendayrewsard;
    
    private String alltime;  //各种领取记录日志；
    
    @Transient
    private Map<Integer,Long> alltimes;
    
    
    private String red;
    
    @Transient
    private List<Integer> reds;
    
    //记录每级奖励钻石领取情况；
    private String levereward;
    
    @Transient
    private int[] leverewards;
    
    
    public String getLevereward() {
		return levereward;
	}

	public void setLevereward(String levereward) {
		this.levereward = levereward;
	}

	public int[] getLeverewards() {
		if(leverewards==null){
			if(levereward==null || "".equals(levereward)){
				leverewards=new int[40];
				levereward=JacksonManager.getInstance().getGson().toJson(leverewards);
			}else{
				leverewards=JacksonManager.getInstance().getGson().fromJson(levereward, int[].class);
			}
		}
		return leverewards;
	}

	public void setLeverewards(int[] leverewards) {
		levereward=JacksonManager.getInstance().getGson().toJson(leverewards);
		this.leverewards = leverewards;
	}

	public String getRed() {
		return red;
	}

	public void setRed(String red) {
		this.red = red;
	}

	public List<Integer> getReds() {
		int num=10;
		if(reds==null){
			if(red==null || "".equals(red)){
				reds=new ArrayList<Integer>();
				for (int i = 0; i <num; i++) {
					reds.add(0);
				}
				red=JacksonManager.getInstance().getGson().toJson(reds);
			}else{
				reds= JacksonManager.getInstance().getGson().fromJson(red, new TypeToken<List<Integer>>() {
				}.getType());
				if(reds.size()<10){
					for (int i = reds.size(); i < num; i++) {
						reds.add(0);
					}
				}
			}
		}
		return reds;
	}

	public void setReds(List<Integer> reds) {
		red=JacksonManager.getInstance().getGson().toJson(reds);
		this.reds = reds;
		this.dirty=true;
	}

	public String getAlltime() {
		return alltime;
	}

	public void setAlltime(String alltime) {
		this.alltime = alltime;
	}


	public Map<Integer, Long> getAlltimes() {
	  	if(alltimes==null){
    		if(alltime==null ||"".equals(alltime)){
    			alltimes=new HashMap<Integer, Long>();
    			alltime=JacksonManager.getInstance().getGson().toJson(alltimes);
    		}else{
    			alltimes= JacksonManager.getInstance().getGson().fromJson(alltime, new TypeToken<Map<Integer,Long>>() {
    				}.getType());
    		}
    	}
		return alltimes;
	}

	public void setAlltimes(Map<Integer, Long> alltimes) {
		alltime=JacksonManager.getInstance().getGson().toJson(alltimes);
		this.alltimes = alltimes;
		this.dirty=true;
	}


	@Transient
    private int[] sevendayrewsards;
    
	public String getSevendayrewsard() {
		return sevendayrewsard;
	}

	public void setSevendayrewsard(String sevendayrewsard) {
		this.sevendayrewsard = sevendayrewsard;
	}

	public int[] getSevendayrewsards() {
		if(sevendayrewsards==null){
			if(sevendayrewsard==null || "".equals(sevendayrewsard)){
				sevendayrewsards=new int[7];
				sevendayrewsard=JacksonManager.getInstance().getGson().toJson(sevendayrewsards);
			}else{
				sevendayrewsards=JacksonManager.getInstance().getGson().fromJson(sevendayrewsard, int[].class);
			}
		}
		return sevendayrewsards;
	}

	public void setSevendayrewsards(int[] sevendayrewsards) {
		sevendayrewsard=JacksonManager.getInstance().getGson().toJson(sevendayrewsards);
		this.sevendayrewsards = sevendayrewsards;
		this.dirty=true;
	}

	public String getKnapsack() {
		return knapsack;
	}

	public void setKnapsack(String knapsack) {
		this.knapsack = knapsack;
	}

	public Map<Integer, Integer> getMapknapsack() {
	  	if(mapknapsack==null){
    		if(knapsack==null ||"".equals(knapsack)){
    			mapknapsack=new HashMap<Integer, Integer>();
    			knapsack=JacksonManager.getInstance().getGson().toJson(mapknapsack);
    		}else{
    			mapknapsack= JacksonManager.getInstance().getGson().fromJson(knapsack, new TypeToken<Map<Integer,Integer>>() {
    				}.getType());
    		}
    	}
		return mapknapsack;
	}

	public void setMapknapsack(Map<Integer, Integer> mapknapsack) {
		knapsack=JacksonManager.getInstance().getGson().toJson(mapknapsack);
		this.mapknapsack = mapknapsack;
		System.out.println(knapsack);
		this.dirty=true;
	}
	
	public void setupdate(){
		PlayerManager.getInstance().updatewgplayer1(this);
		this.dirty=false;
	}

	public boolean isDirty() {
		return dirty;
	}

	public void setDirty(boolean dirty) {
		this.dirty = dirty;
	}

	
    public Map<Integer, List<Integer>> getMaptasks() {
	  	if(maptasks==null){
    		if(tasks==null ||"".equals(tasks)){
    			maptasks=new HashMap<Integer, List<Integer>>();
    			tasks=JacksonManager.getInstance().getGson().toJson(maptasks);
    		}else{
    			maptasks= JacksonManager.getInstance().getGson().fromJson(tasks, new TypeToken<Map<Integer, List<Integer>>>() {
    				}.getType());
    		}
    	}
		return maptasks;
	}

	public void setMaptasks(Map<Integer, List<Integer>> maptasks) {
		tasks=JacksonManager.getInstance().getGson().toJson(maptasks);
		this.maptasks = maptasks;
		this.dirty=true;
	}


	@Transient
    private Map<Integer,List<Integer>> mapdailytasks;
    

	public Map<Integer, List<Integer>> getMapdailytasks() {
	  	if(mapdailytasks==null){
    		if(dailytasks==null ||"".equals(dailytasks)){
    			mapdailytasks=new HashMap<Integer, List<Integer>>();
    			dailytasks=JacksonManager.getInstance().getGson().toJson(mapdailytasks);
    		}else{
    			mapdailytasks= JacksonManager.getInstance().getGson().fromJson(dailytasks, new TypeToken<Map<Integer, List<Integer>>>() {
    				}.getType());
    		}
    	}
		return mapdailytasks;
	}

	public void setMapdailytasks(Map<Integer, List<Integer>> mapdailytasks) {
		dailytasks=JacksonManager.getInstance().getGson().toJson(mapdailytasks);
		this.mapdailytasks = mapdailytasks;
		this.dirty=true;
	}

	/**
     * @return id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * @return sid
     */
    public Integer getSid() {
        return sid;
    }

    /**
     * @param sid
     */
    public void setSid(Integer sid) {
        this.sid = sid;
    }

    /**
     * @return uid
     */
    public Long getUid() {
        return uid;
    }

    /**
     * @param uid
     */
    public void setUid(Long uid) {
        this.uid = uid;
    }

    /**
     * @return tasks
     */
    public String getTasks() {
        return tasks;
    }

    /**
     * @param tasks
     */
    public void setTasks(String tasks) {
        this.tasks = tasks == null ? null : tasks.trim();
    }

    /**
     * @return dailytasks
     */
    public String getDailytasks() {
        return dailytasks;
    }

    /**
     * @param dailytasks
     */
    public void setDailytasks(String dailytasks) {
        this.dailytasks = dailytasks == null ? null : dailytasks.trim();
    }

	@Override
	public String toString() {
		return "WgPlayer1 [id=" + id + ", sid=" + sid + ", uid=" + uid + ", tasks=" + tasks + ", dailytasks="
				+ dailytasks + "]";
	}
	
	public void hearbeat(){
		if(this.dirty==true){
			this.setupdate();
		}
	}
    
	
	//adddailytasks;
	public void adddailytasks(int tasktype,int num,int addtype){
		TasksManager.getInstance().firstdailytasks(this);
		//addtype=0 赋值，  addtype=1增加；
		Map<Integer,  List<Integer>> map=this.getMapdailytasks();
		List<Integer> listone=map.get(tasktype);
		if(listone==null){
			System.out.println("-----异常");
		}else{
			if(addtype==1){
				listone.set(1, listone.get(1)+num);
			}else{
				listone.set(1, num);
			}
			int id=listone.get(0);
			if(listone.get(2)==0){
				Dailytask dailytask=TasksManager.getInstance().getMapdaily().get(id);
				if(dailytask.getCount()<=listone.get(1)){
					listone.set(2, 1);
					this.addred(PlayerManager.dailytask, 1);
				}
			}
		}
		this.setMapdailytasks(map);
		//红点；
	}
	
	//开启下一个任务；
	public void addnextdailytask(int taskid){
		Map<Integer,  List<Integer>> map=this.getMapdailytasks();
		Dailytask dailytask=TasksManager.getInstance().getMapdaily().get(taskid);
		if(dailytask.getNextid()>0){
			int nextid=dailytask.getNextid();
			Dailytask dailytasknext=TasksManager.getInstance().getMapdaily().get(nextid);
			List<Integer> listone=map.get(dailytasknext.getTasktype());
			if(listone!=null){
				listone.set(0, dailytasknext.getId());
				listone.set(2, 0);
				this.setMapdailytasks(map);
				if(dailytasknext.getCount()<=listone.get(1)){
					listone.set(2, 1);
					this.addred(PlayerManager.dailytask, 1);
				}
			}	
		}
	}
	
	
	public void openred(int type){
		int flag=0;
		if(type==PlayerManager.dailytask){
			Map<Integer,  List<Integer>> map=this.getMapdailytasks();
			for ( List<Integer> listone : map.values()) {
				if(listone.get(2)==1){
					flag=1;
					break;
				}
			}
		}else if(type==PlayerManager.task){
			 Map<Integer,List<Integer>> maptasks=this.getMaptasks();
			 for (List<Integer> listone : maptasks.values()) {
				 if(listone.get(1)==1){
						flag=1;
						break;
					}
			}
		}else if(type==PlayerManager.sevenday){
			int[] sevendayrewsards=this.getSevendayrewsards();
			for (int i : sevendayrewsards) {
				if(i==1){
					flag=1;
					break;
				}
			}
		}
		this.addred(type, flag);
	}
	
	
	
	
	
	
	public void addtask(int id,int num,int type){
		Map<Integer,  List<Integer>> map=this.getMaptasks();
		List<Integer> listone=map.get(id);
		if(listone==null){
			listone=new ArrayList<Integer>();
			listone.add(0,0);
			listone.add(1,0);
			map.put(id, listone);
			this.setMaptasks(map);
		}
		if(listone.get(1)==0){
			if(type==0){
				listone.set(0, num);
			}else{
				listone.set(0, listone.get(0)+num);
			}
			Task task=TasksManager.getInstance().getTaskmap().get(id);
			if(task.getNum()<=listone.get(0)){
				listone.set(1, 1);
				listone.set(0, task.getNum());
				this.addred(PlayerManager.task, 1);
			}
			this.setMaptasks(map);
			
		}
	}
	
	public void addred(int type,int flag){
		this.getReds().set(type, flag);
		this.setReds(this.getReds());
	}
	
	public void resetdate(long time,int type){
		if(type==1 || type==-1){
			this.getMaptasks().clear();
			this.setMaptasks(this.getMaptasks());
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
    
    
}
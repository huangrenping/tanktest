package web.game.tasks;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.xml.sax.SAXException;

import com.xuanzhi.tools.configuration.Configuration;
import com.xuanzhi.tools.configuration.ConfigurationException;
import com.xuanzhi.tools.configuration.DefaultConfigurationBuilder;
import com.xuanzhi.tools.watchdog.ConfigFileChangedAdapter;
import com.xuanzhi.tools.watchdog.ConfigFileChangedListener;

import web.game.pojo.WgPlayer1;

public class TasksManager implements Runnable, ConfigFileChangedListener{
	public static TasksManager self;

	public static TasksManager getInstance() {
		return self;
	}
	
	// 全部
	private Map<Integer, Task> taskmap;
	
	private String xmlfile;
	private String xmlfile2;
	
	private Map<Integer,List<Dailytask>> mapdailytask;
	
	private Map<Integer,Dailytask> mapdaily;
	
	
	public Map<Integer, Dailytask> getMapdaily() {
		return mapdaily;
	}

	public void setMapdaily(Map<Integer, Dailytask> mapdaily) {
		this.mapdaily = mapdaily;
	}

	private Map<Integer,Dailytask> mapfirstdaily;
	
	private List<Dailytask> listfristdaily;
	
	public List<Dailytask> getListfristdaily() {
		return listfristdaily;
	}

	public void setListfristdaily(List<Dailytask> listfristdaily) {
		this.listfristdaily = listfristdaily;
	}

	public Map<Integer, Dailytask> getMapfirstdaily() {
		return mapfirstdaily;
	}

	public void setMapfirstdaily(Map<Integer, Dailytask> mapfirstdaily) {
		this.mapfirstdaily = mapfirstdaily;
	}

	public Map<Integer, Task> getTaskmap() {
		return taskmap;
	}

	public void setTaskmap(Map<Integer, Task> taskmap) {
		this.taskmap = taskmap;
	}

	public String getXmlfile() {
		return xmlfile;
	}

	public void setXmlfile(String xmlfile) {
		this.xmlfile = xmlfile;
	}

	public String getXmlfile2() {
		return xmlfile2;
	}

	public void setXmlfile2(String xmlfile2) {
		this.xmlfile2 = xmlfile2;
	}

	public void init() {
		self = this;
		long start = System.currentTimeMillis();
		try {
			loadxml();
			System.out.println("[TasksManager初始化完成] ["+ (System.currentTimeMillis() - start) + "ms]");
		} catch (Exception e) {
			e.printStackTrace();
		}
		ConfigFileChangedAdapter.getInstance().addListener(new File(xmlfile),this);
		ConfigFileChangedAdapter.getInstance().addListener(new File(xmlfile2),this);
	}
	
	public synchronized void loadxml() throws SAXException, IOException,
	ConfigurationException {
		// 全部类型
		taskmap = new HashMap<Integer, Task>();
		Configuration rootConfig = new DefaultConfigurationBuilder()
				.buildFromFile(xmlfile);
		Configuration nationsConfig[] = rootConfig.getChildren("task");
		for (Configuration nationConfig : nationsConfig) {
			int id = nationConfig.getAttributeAsInteger("id", 0);
			String name = nationConfig.getAttribute("name", "");
			int num = nationConfig.getAttributeAsInteger("num", 0);
			String reward = nationConfig.getAttribute("reward", "");
			int add = nationConfig.getAttributeAsInteger("add", 0);
			int addexperience = nationConfig.getAttributeAsInteger("addexperience", 0);
			String description = nationConfig.getAttribute("description", "");
			String args = nationConfig.getAttribute("args", "");
			String factory = nationConfig.getAttribute("factory", "");
			int toid = nationConfig.getAttributeAsInteger("toid", 0);
			int paixu = nationConfig.getAttributeAsInteger("paixu", 0);
			Task task = new Task();
			task.setAdd(add);
			task.setDescription(description);
			task.setId(id);
			task.setName(name);
			task.setNum(num);
			task.setReward(reward);
			task.setAddexperience(addexperience);
			task.setFactory(factory);
			task.setArgs(args);
			task.setToid(toid);
			task.setPaixu(paixu);
			taskmap.put(id, task);
		}
		mapdaily=new HashMap<Integer,Dailytask>();
		mapdailytask=new HashMap<Integer,List<Dailytask>>();
		mapfirstdaily=new HashMap<Integer, Dailytask>();
		listfristdaily=new ArrayList<Dailytask>();
		//日常任务表
		Configuration rootConfig2 = new DefaultConfigurationBuilder()
				.buildFromFile(xmlfile2);
		Configuration nationsConfig2[] = rootConfig2.getChildren("dailytask");
		for (Configuration nationConfig : nationsConfig2) {
			int id = nationConfig.getAttributeAsInteger("id", 0);
			String name = nationConfig.getAttribute("name", "");
			int type = nationConfig.getAttributeAsInteger("type", 0);
			String reward = nationConfig.getAttribute("reward", "");
			int tasktype = nationConfig.getAttributeAsInteger("tasktype", 0);
			int nextid = nationConfig.getAttributeAsInteger("nextid", 0);
			int count = nationConfig.getAttributeAsInteger("count", 0);
			int first = nationConfig.getAttributeAsInteger("first", 0);
			String description = nationConfig.getAttribute("description", "");
			Dailytask dailytask=new Dailytask();
			dailytask.setReward(reward);
			dailytask.setCount(count);
			dailytask.setDescription(description);
			dailytask.setFirst(first);
			dailytask.setId(id);
			dailytask.setName(name);
			dailytask.setNextid(nextid);
			dailytask.setTasktype(tasktype);
			dailytask.setType(type);
			mapdaily.put(id, dailytask);
			if(mapdailytask.get(type)==null){
				List<Dailytask> listone=new ArrayList<Dailytask>();
				listone.add(dailytask);
				mapdailytask.put(type, listone);
			}else{
				List<Dailytask> listone=mapdailytask.get(type);
				listone.add(dailytask);
			}
			if(first==1){
				mapfirstdaily.put(tasktype, dailytask);
				listfristdaily.add(dailytask);
			}
	
		}
		System.out.println("日常任务更新完毕！");
	}
	@Override
	public void fileChanged(File arg0) {
		
	}

	@Override
	public void run() {
		
	}
	
	public void destroy(){
		
	}
	
	// 初始化dailytasks
	public void firstdailytasks(WgPlayer1 WgPlayer1){
		Map<Integer,List<Integer>> mapdailytasks=WgPlayer1.getMapdailytasks();
		List<Dailytask> listfristdaily=this.getListfristdaily();
		//System.out.println(listfristdaily.size()+"@@@@@@@@@@"+mapdailytasks.size());
		if(listfristdaily.size()==mapdailytasks.size()){
			return ;
		}
		Map<Integer,List<Integer>> mapdailytasks2=new HashMap<Integer, List<Integer>>();
		
		for (Dailytask dailytask : listfristdaily) {
			int tasktype=dailytask.getTasktype();
			List<Integer> listone=mapdailytasks.get(tasktype);
			if(listone==null){
				listone=new ArrayList<Integer>();
				mapdailytasks.put(dailytask.getTasktype(), listone);
				listone.add(0,dailytask.getId());
				listone.add(1,0);
				listone.add(2,0);
			}
			mapdailytasks2.put(tasktype, listone);
		}
		WgPlayer1.setMapdailytasks(mapdailytasks2);
	}
	
	

}

package web.game.tank;

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

public class TankManager  implements ConfigFileChangedListener{

	public static TankManager self;
	
	public static TankManager getInstance(){
		return self;
	}
	
	private Map<Integer,TankLevel> maptanklevel;
	
	private List<Tank> listtank;
	private Map<Integer,Tank> maptank;
	
	private Map<Integer,Integer> mapskin;
	
	private Map<Integer,Integer> maplevel;
	
	
	public Map<Integer, TankLevel> getMaptanklevel() {
		return maptanklevel;
	}
	public void setMaptanklevel(Map<Integer, TankLevel> maptanklevel) {
		this.maptanklevel = maptanklevel;
	}
	public Map<Integer, Integer> getMaplevel() {
		return maplevel;
	}
	public void setMaplevel(Map<Integer, Integer> maplevel) {
		this.maplevel = maplevel;
	}
	public Map<Integer, Integer> getMapskin() {
		return mapskin;
	}
	public void setMapskin(Map<Integer, Integer> mapskin) {
		this.mapskin = mapskin;
	}
	public List<Tank> getListtank() {
		return listtank;
	}
	public void setListtank(List<Tank> listtank) {
		this.listtank = listtank;
	}
	public Map<Integer, Tank> getMaptank() {
		return maptank;
	}
	public void setMaptank(Map<Integer, Tank> maptank) {
		this.maptank = maptank;
	}

	private String xmlfile;
	
	private String xmlfile1;
	
	public void setXmlfile1(String xmlfile1) {
		this.xmlfile1 = xmlfile1;
	}
	public void setXmlfile(String xmlfile) {
		this.xmlfile = xmlfile;
	}
	public void init(){
		self = this;
		long start = System.currentTimeMillis();
		try {
			loadxml();
			System.out.println("[TankManager初始化完成] ["
					+ (System.currentTimeMillis() - start) + "ms]");
		} catch (Exception e) {
			e.printStackTrace();
		}
		ConfigFileChangedAdapter.getInstance().addListener(new File(xmlfile), this);
	}
	public synchronized void loadxml() throws SAXException, IOException,ConfigurationException {
		listtank=new ArrayList<Tank>();
		maptank=new HashMap<Integer, Tank>();
		mapskin=new HashMap<Integer, Integer>();
		maplevel=new HashMap<Integer, Integer>();
		Configuration rootConfig = new DefaultConfigurationBuilder()
				.buildFromFile(xmlfile);
		Configuration nationsConfig[] = rootConfig.getChildren("tank");
		for (Configuration nationConfig : nationsConfig) {
			int id = nationConfig.getAttributeAsInteger("id", 0);
			int level = nationConfig.getAttributeAsInteger("level", 0);
			int articleid = nationConfig.getAttributeAsInteger("articleid", 0);
			int tankskinid = nationConfig.getAttributeAsInteger("tankskinid",0);
			int range = nationConfig.getAttributeAsInteger("range",0);
			int attackspeed = nationConfig.getAttributeAsInteger("attackspeed",0);
			int bullettype = nationConfig.getAttributeAsInteger("bullettype",0);
			int price1 = nationConfig.getAttributeAsInteger("price1",0);
			int plusprice1 = nationConfig.getAttributeAsInteger("plusprice1",0);
			
			String name = nationConfig.getAttribute("name", "");
			String produce = nationConfig.getAttribute("produce", "");
			String attack = nationConfig.getAttribute("attack", "");
			String hp = nationConfig.getAttribute("hp", "");
			String price = nationConfig.getAttribute("price", "");
			String plusprice = nationConfig.getAttribute("plusprice", "");
			Tank tank=new Tank();
			tank.setArticleid(articleid);
			tank.setAttack(attack);
			tank.setAttackspeed(attackspeed);
			tank.setBullettype(bullettype);
			tank.setHp(hp);
			tank.setId(tankskinid);
			tank.setLevel(level);
			tank.setName(name);
			tank.setPlusprice(plusprice);
			tank.setPlusprice1(plusprice1);
			tank.setPrice(price);
			tank.setPrice1(price1);
			tank.setProduce(produce);
			tank.setRange(range);
			tank.setTankskinid(tankskinid);
			listtank.add(tank);
			maptank.put(id, tank);
			mapskin.put(tankskinid, id);
			maplevel.put(level, id);
		}
		
		maptanklevel=new HashMap<Integer, TankLevel>();
		Configuration rootConfig1 = new DefaultConfigurationBuilder()
				.buildFromFile(xmlfile1);
		Configuration nationsConfig1[] = rootConfig1.getChildren("level");
		for (Configuration nationConfig : nationsConfig1) {
			int level = nationConfig.getAttributeAsInteger("level", 0);
			int reward = nationConfig.getAttributeAsInteger("reward", 0);
			String goldreward = nationConfig.getAttribute("goldreward", "");
			String random = nationConfig.getAttribute("random", "");
			TankLevel tankLevel=new TankLevel();
			tankLevel.setId(level);
			tankLevel.setReward(reward);
			tankLevel.setGoldreward(goldreward);
			tankLevel.setRandom(random);
			maptanklevel.put(level, tankLevel);
		}
		
		System.out.println("article道具表完成更新");
	}
	@Override
	public void fileChanged(File arg0) {
		try {
			loadxml();
			System.out.println("article更新");
		} catch (SAXException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public int[] tanklevel(int[] tankskid){
		int level[]=new int[tankskid.length];
		for (int i = 0; i < tankskid.length; i++) {
			Integer id=this.getMapskin().get(tankskid[i]);
			if(id!=null){
				level[i]=this.getMaptank().get(id).getLevel();
			}
		}
		return level;
	}
	
	
	
	public void destroy(){
		
	}

}

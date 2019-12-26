package web.game.player;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.xml.sax.SAXException;

import com.github.pagehelper.PageHelper;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.xuanzhi.tools.configuration.Configuration;
import com.xuanzhi.tools.configuration.ConfigurationException;
import com.xuanzhi.tools.configuration.DefaultConfigurationBuilder;
import com.xuanzhi.tools.watchdog.ConfigFileChangedAdapter;
import com.xuanzhi.tools.watchdog.ConfigFileChangedListener;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;
import web.game.language.Transaltecontent;
import web.game.mapper.WgMainMapper;
import web.game.mapper.WgPlayer1Mapper;
import web.game.mapper.WgPlayerMapper;
import web.game.pojo.WgMain;
import web.game.pojo.WgPlayer;
import web.game.pojo.WgPlayer1;
import web.game.util.GameServerManager;
import web.game.util.JacksonManager;
import web.game.util.JsonNewResult;
import web.game.util.PublicIDManager;
import web.game.util.SendgetManager;
import web.game.util.Util;


public class PlayerManager  implements ConfigFileChangedListener{
	//判断用户在线时间；
	public static long onlinetime=1*60*1000;
	
	public static int[] sevendayarticle={1000301,1000302,1000303,1000304,1000305,1000306,1000307};
	
	
	public static Logger logger = LoggerFactory.getLogger(PlayerManager.class.getName());
	public static PlayerManager self;
	public static PlayerManager getInstance(){
		return self;
	}
	public static int dailytask=0;
	public static int task=1;
	public static int sevenday=2;
	
	private String xmlfile;
	
	public void setXmlfile(String xmlfile) {
		this.xmlfile = xmlfile;
	}
	private Map<Integer,Transaltecontent> mapTransaltecontent;
	
	public Map<Integer, Transaltecontent> getMapTransaltecontent() {
		return mapTransaltecontent;
	}

	public void setMapTransaltecontent(Map<Integer, Transaltecontent> mapTransaltecontent) {
		this.mapTransaltecontent = mapTransaltecontent;
	}
	
	public static String content(int id){
		Transaltecontent t=PlayerManager.getInstance().getMapTransaltecontent().get(id);
		if(t==null){
			return "";
		}else{
			return t.getContent();
		}
	}
	
	//排行榜数据；
	private long top1;
	
	public long getTop1() {
		return top1;
	}

	public void setTop1(long top1) {
		this.top1 = top1;
	}
	List<WgPlayer> listtop1=new ArrayList<WgPlayer>();
	
	
	public List<WgPlayer> getListtop1() {
		return listtop1;
	}

	public void setListtop1(List<WgPlayer> listtop1) {
		this.listtop1 = listtop1;
	}
	private int serverid;
	
	private int translate;
	
	private int version;
	
	public int getServerid() {
		return serverid;
	}

	public void setServerid(int serverid) {
		this.serverid = serverid;
	}

	public int getTranslate() {
		return translate;
	}

	public void setTranslate(int translate) {
		this.translate = translate;
	}

	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		System.out.println(version+"----------------");
		this.version = version;
	}
	@Autowired
	public WgPlayerMapper wgPlayerMapper;
	
	@Autowired
	public WgPlayer1Mapper wgPlayer1Mapper;
	
	@Autowired
	public WgMainMapper wgMainMapper;
	
	public WgMain wgmain;
	
	public WgMain getWgmain() {
		if(wgmain==null){
			WgMain wgmain1=new WgMain();
			wgmain1.setSid(this.getServerid());
			WgMain wgmain2=wgMainMapper.selectOne(wgmain1);
			if(wgmain2==null){
				wgmain1.setTime(System.currentTimeMillis());
				wgMainMapper.insertSelective(wgmain1);
				wgmain=wgMainMapper.selectOne(wgmain1);
			}else{
				wgmain=	wgmain2;
			}
		}
		return wgmain;
	}

	public void setWgmain(WgMain wgmain) {
		this.wgmain = wgmain;
	}
	public void updatewgmain(WgMain wgmain){
		if(wgmain.isDirty()==true){
			wgMainMapper.updateByPrimaryKeySelective(wgmain);
			wgmain.setDirty(false);
		}
	}
	
	

	//拿到wgplayer1数据；
	public WgPlayer1 getwgplayer1(long serveruid,int sid){
		WgPlayer1 wgPlayer1=new WgPlayer1();
		wgPlayer1.setSid(sid);
		wgPlayer1.setUid(serveruid);
		WgPlayer1 wgPlayera=wgPlayer1Mapper.selectOne(wgPlayer1);
		if(wgPlayera==null){
			wgPlayer1Mapper.insertSelective(wgPlayer1);
			wgPlayer1=wgPlayer1Mapper.selectByPrimaryKey(wgPlayer1);
			return wgPlayer1;
		}else{
			return wgPlayera;
		}
	}
	
	public void updatewgplayer1(WgPlayer1 wgPlayer1){
		wgPlayer1Mapper.updateByPrimaryKeySelective(wgPlayer1);
	}
	
	public void updatewgplayer(WgPlayer wgPlayer){
		wgPlayerMapper.updateByPrimaryKeySelective(wgPlayer);
	}
	
	private boolean openLock;
	private Hashtable<Long,WgPlayer> idplayermap=new Hashtable<Long, WgPlayer>();
	private Hashtable<String,Long> nameplayermap=new Hashtable<String, Long>();
	
	private Map<String,Long> maptoken=new HashMap<String, Long>();
	private Map<Long,String> longtoken=new HashMap<Long, String>();
	
	
	public Map<Long, String> getLongtoken() {
		return longtoken;
	}

	public void setLongtoken(Map<Long, String> longtoken) {
		this.longtoken = longtoken;
	}

	public Map<String, Long> getMaptoken() {
		return maptoken;
	}
	public void setMaptoken(Map<String, Long> maptoken) {
		this.maptoken = maptoken;
	}
	public void addToIDMap(long id, WgPlayer wgPlayerserver) {
		if (openLock) {
			synchronized (this) {
				idplayermap.put(id, wgPlayerserver);
			}
		} else {
			idplayermap.put(id, wgPlayerserver);
		}
	}
	public void addtonamemap(WgPlayer wgPlayerserver){
		if (openLock) {
			synchronized (this) {
				if(wgPlayerserver.getRolename()!=null){
					nameplayermap.put(wgPlayerserver.getRolename(), wgPlayerserver.getServeruid());
				}
				nameplayermap.put(wgPlayerserver.getUsername(),  wgPlayerserver.getServeruid());
			}
		} else {
			if(wgPlayerserver.getRolename()!=null){
				nameplayermap.put(wgPlayerserver.getRolename(), wgPlayerserver.getServeruid());
			}
			//nameplayermap.put(wgPlayerserver.getPlayername(), wgPlayerserver.getServeruid());
			nameplayermap.put(wgPlayerserver.getUsername(),  wgPlayerserver.getServeruid());
		}
	}
	public boolean isOpenLock() {
		return openLock;
	}
	public void setOpenLock(boolean openLock) {
		this.openLock = openLock;
	}
	public Hashtable<Long, WgPlayer> getIdplayermap() {
		return idplayermap;
	}
	public void setIdplayermap(Hashtable<Long, WgPlayer> idplayermap) {
		this.idplayermap = idplayermap;
	}
	public Hashtable<String, Long> getNameplayermap() {
		return nameplayermap;
	}
	public void setNameplayermap(Hashtable<String, Long> nameplayermap) {
		this.nameplayermap = nameplayermap;
	}
	public void init(){
		self=this;
		getWgmain();
		long start=System.currentTimeMillis();
		long t1 = System.currentTimeMillis() - start;
		System.out.println();
		try {
			loadxml();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (logger.isInfoEnabled())
			logger.info("[PlayerManager初始化完成] [t1:{}ms] [t2:{}ms]",
					new Object[] { t1, (System.currentTimeMillis() - start) });
		ConfigFileChangedAdapter.getInstance().addListener(new File(xmlfile), this);
	}
	
	
	public synchronized void loadxml() throws SAXException, IOException,ConfigurationException {
		mapTransaltecontent=new HashMap<Integer, Transaltecontent>();
		Configuration rootConfig = new DefaultConfigurationBuilder()
				.buildFromFile(xmlfile);
		Configuration nationsConfig[] = rootConfig.getChildren("translate");
		for (Configuration nationConfig : nationsConfig) {
			int id = nationConfig.getAttributeAsInteger("id", 0);
			String content = nationConfig.getAttribute("content","");
			Transaltecontent t=new Transaltecontent();
			t.setId(id);
			t.setContent(content);
			mapTransaltecontent.put(id, t);
		}
		System.out.println("translate道具表完成更新");
	}
	
	
	
	/**
	 * @param token
	 * @param ckectusername
	 * @return用户登入验证token；
	 */
	public WgPlayer checktoken(String token,String ckectusername){
		Long playerid=this.getMaptoken().get(token);
		if(playerid==null){
			//boss服务端去拿；
			String url=GameServerManager.getInstance().getWeburl()+"/Api/checkUser?token="+token;
			String getreturn=SendgetManager.SendGET(url);
			System.out.println(url);
			Gson gson=JacksonManager.getInstance().getGson();
			JsonNewResult<Map<String,String>> userlist=gson.fromJson(getreturn, new TypeToken<JsonNewResult<Map<String,String>>>(){}.getType());
			int status=userlist.getStatus();
			if(status==0){
				Map<String,String> mapone=userlist.getData();
				String username=mapone.get("username");
				String rolename=mapone.get("account");
				System.out.println("username---------"+username);
				if(!ckectusername.equals(username)){
					return null;
				}
				WgPlayer wp=getplayerusername(username);
				if(wp.getRolename()==null || !wp.getRolename().equals(rolename)){
					wp.setRolename(rolename);
					this.addtonamemap(wp);
				}
				wp.setOnline(true);
				this.addtonamemap(wp);
				this.addToIDMap(wp.getServeruid(), wp);
				
				//删除老token，防止多个用户同事登入；
				this.getMaptoken().remove(this.getLongtoken().get(wp.getServeruid())); 
				this.getMaptoken().put(token, wp.getServeruid());
				this.getLongtoken().put(wp.getServeruid(), token);
				return wp;
			}else{
				return null;
			}
		}else{
			return this.getplayer(playerid);
		}
	}
	
	public WgPlayer checktoken2(String token){
		Long playerid=this.getMaptoken().get(token);
		if(playerid!=null){
			WgPlayer wgplayer=this.getplayer(playerid);
			return wgplayer;
		}else{
			return null;
		}
		
	}
	
	public WgPlayer getplayerusername(String s){
		Long playerid=this.nameplayermap.get(s);
		if(playerid==null){
			WgPlayer wp=new WgPlayer();
			wp.setSid(GameServerManager.getInstance().getServerid());
			wp.setUsername(s);
			WgPlayer wp1=wgPlayerMapper.selectOne(wp);
			if(wp1==null){
				return adduser(wp);
			}else{
				return wp1;
			}
		}else{
			return this.getplayer(playerid);
		}
	}
	
	//写入新玩家；
	public WgPlayer adduser(WgPlayer wp){
		wp.setServeruid(PublicIDManager.getInstance().nextId(PublicIDManager.ID_TYPES[0]));
		wp.setTime(System.currentTimeMillis());//注册时间；
		
		wp.setGold("500");
		wp.setDiamond(0l);
		wp.setLevel(1);
		wp.setNowtankid(1000101);
		wp.setTitlelevel(1);
		
		wp.getPackitems();
		wp.getBattletanks();
		wp.getGoldbuyNums();
		wp.getDiamondbuynums();
		wp.getSyntanknums();
		wp.setKillnum(0l);
		wp.setMissionlevel(1);
		wgPlayerMapper.insertSelective(wp);
		wp=wgPlayerMapper.selectByPrimaryKey(wp);
		return wp;
	}
	
	
	
	
	
	public WgPlayer getplayer(long playerid){
		WgPlayer wgPlayerserver=idplayermap.get(playerid);
		return wgPlayerserver;
	}
	
	public WgPlayer[] getplayers(){
		WgPlayer wgPlayer[]=this.getIdplayermap().values().toArray(new WgPlayer[0]);
		return wgPlayer;
	}
	
	
	
	
	public static void main(String[] args) {
		Gson gson=new Gson();
		String getreturn=SendgetManager.SendGET("http://cms.wenyoyo.com/Api/checkUser?token=81015018209430cd6a4eb2a3974beda7");
		JsonNewResult<Map<String,Object>> userlist=gson.fromJson(getreturn, new TypeToken<JsonNewResult<Map<String,Object>>>(){}.getType());
		int status=userlist.getStatus();
		if(status==0){
			Map<String,Object> mapone=userlist.getData();
			String username=(String) mapone.get("username");
			System.out.println(username);
		}
		System.out.println(getreturn);
	}
	
	//七日登入；
	public static void sevenday(WgPlayer wgPlayer){
		WgPlayer1 wgPlayer1=wgPlayer.getWgPlayer1();
		int[] sevendayrewsards=wgPlayer1.getSevendayrewsards();
		int flag=0;
		for (int i = 0; i < sevendayrewsards.length; i++) {
			if(sevendayrewsards[i]==1){
				flag=1;
				break;
			}
		}
		if(flag==0 && sevendayrewsards[sevendayrewsards.length-1]!=2){
			Map<Integer,Long> alltimes=wgPlayer1.getAlltimes();
			Long time=alltimes.get(1);
			if(time==null){
				flag=2;
				alltimes.put(1, System.currentTimeMillis());
				wgPlayer1.setAlltimes(alltimes);
			}else{
				//判断今天是否领取过；
				long day=Util.dayDifflongtime(time, System.currentTimeMillis());
				if(day>1){
					flag=2;
				}
			}
			if(flag==2){
				for (int i = 0; i < sevendayrewsards.length; i++) {
					if(sevendayrewsards[i]==0){
						sevendayrewsards[i]=1;
						//红点；
						wgPlayer1.addred(PlayerManager.sevenday, 1);
						break;
					}
				}
				wgPlayer1.setSevendayrewsards(sevendayrewsards);
			}
		}
	}
	
	//登入调用；
	public static void wgmain(WgPlayer wgPlayer){
		PlayerManager.sevenday(wgPlayer);
		wgPlayer.resetuser();
	}
	
	
	
	
	public void destroy(){
		long time=System.currentTimeMillis();
		Collection<WgPlayer> wplist=this.getIdplayermap().values();
		List<WgPlayer> listwgplayers=new ArrayList<WgPlayer>();
		listwgplayers.addAll(wplist);
		try {
			for (WgPlayer wgPlayer : listwgplayers) {
				try {
					wgPlayer.heartbeat(time);
				} catch (Exception e) {
					
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("用户心跳异常！");
		}
		this.updatewgmain(this.getWgmain());
	}

	@Override
	public void fileChanged(File arg0) {
		try {
			loadxml();
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
}

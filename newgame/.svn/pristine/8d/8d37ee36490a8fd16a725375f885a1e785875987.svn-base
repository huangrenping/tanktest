package web.game.pojo;

import java.util.Arrays;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;

import web.game.player.PlayerManager;
import web.game.user.Knapsack;
import web.game.util.JacksonManager;
import web.game.util.Util;

@Table(name = "wg_player")
public class WgPlayer {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private Integer sid;

    private Long serveruid;

    private String playername;  //游戏内用户名；
    
    private String rolename;   //注册角色名；

    private String username;
    
    private String avatar;
    
    private Long diamond;
    
    private String gold;
    
    private Integer level;
    
    private String profit;  //收益
    
    private Integer profittime;  //收益时间；
    
    private String channel;
    
    private Long time;
    
	private Integer nowtankid;  //1000101
	
	private Integer titlelevel;  //1
	
	private String packitem;   //1000101,0,0,0,0,0,0,0,0,0
	
	@Transient
	private int[] packitems;
	
	private String battletank; //1001,0,0,0,0,0,0,0[0,0,0]
	@Transient
	private int[] battletanks;
	
	private String goldbuynum; //0,0,0,0,0,0,040个0；
	@Transient
	private int[] goldbuyNums;
	
	private String diamondbuynum; //40个坦克钻石购买次数
	@Transient
	private int[] diamondbuynums;
	
	private String syntanknum;  //40种坦克合成次数
	@Transient
	private int[] syntanknums;
	
	private Integer serial;
	
	private Long serialtime; 
	
	private Long logintime;
	
	private Long onlinetime;
	
	
	@Transient
	private boolean online;
	
	@Transient
	private long lastlogintime;
	
	
	private Long killnum;   //1
	
	private Integer missionlevel;  //1
	
	private Long missionleveltime;
	
	private Integer totaldiamond;
	
	private Long restetime;
	
	
	public Long getRestetime() {
		return restetime;
	}

	public void setRestetime(Long restetime) {
		this.restetime = restetime;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getRolename() {
		return rolename;
	}

	public void setRolename(String rolename) {
		this.rolename = rolename;
	}

	public long getLastlogintime() {
		return lastlogintime;
	}

	public void setLastlogintime(long lastlogintime) {
		this.online=true;
		this.lastlogintime = lastlogintime;
	}

	public boolean isOnline() {
		return online;
	}

	public void setOnline(boolean online) {
		this.online = online;
	}

	public Long getOnlinetime() {
		return onlinetime;
	}

	public void setOnlinetime(Long onlinetime) {
		this.onlinetime = onlinetime;
	}

	public Long getLogintime() {
		return logintime;
	}

	public void setLogintime(Long logintime) {
		this.logintime = logintime;
	}

	public Long getSerialtime() {
		return serialtime;
	}

	public void setSerialtime(Long serialtime) {
		this.serialtime = serialtime;
	}

	public Integer getSerial() {
		return serial;
	}

	public void setSerial(Integer serial) {
		this.serial = serial;
	}

	public int[] getPackitems() {
		if(packitems==null){
			if(packitem==null || "".equals(packitem)){
				packitems=new int[10];
				packitems[0]=1000101;
				packitem=JacksonManager.getInstance().getGson().toJson(packitems);
			}else{
				packitems=JacksonManager.getInstance().getGson().fromJson(packitem, int[].class);
			}
		}
		return packitems;
	}

	public void setPackitems(int[] packitems) {
		packitem=JacksonManager.getInstance().getGson().toJson(packitems);
		this.packitems = packitems;
		this.dirty=true;
	}

	public int[] getBattletanks() {
		if(battletanks==null){
			if(battletank==null || "".equals(battletank)){
				battletanks=new int[5];
				battletanks[0]=1001;
				battletank=JacksonManager.getInstance().getGson().toJson(battletanks);
			}else{
				battletanks=JacksonManager.getInstance().getGson().fromJson(battletank, int[].class);
			}
		}
		return battletanks;
	}

	public void setBattletanks(int[] battletanks) {
		battletank=JacksonManager.getInstance().getGson().toJson(battletanks);
		this.battletanks = battletanks;
		this.dirty=true;
	}

	public int[] getGoldbuyNums() {
		if(goldbuyNums==null){
			if(goldbuynum==null || "".equals(goldbuynum)){
				goldbuyNums=new int[40];
				goldbuynum=JacksonManager.getInstance().getGson().toJson(goldbuyNums);
			}else{
				goldbuyNums=JacksonManager.getInstance().getGson().fromJson(goldbuynum, int[].class);
			}
		}
		return goldbuyNums;
	}

	public void setGoldbuyNums(int[] goldbuyNums) {
		goldbuynum=JacksonManager.getInstance().getGson().toJson(goldbuyNums);
		this.goldbuyNums = goldbuyNums;
		this.dirty=true;
	}

	public int[] getDiamondbuynums() {
		if(diamondbuynums==null){
			if(diamondbuynum==null || "".equals(diamondbuynum)){
				diamondbuynums=new int[40];
				diamondbuynum=JacksonManager.getInstance().getGson().toJson(diamondbuynums);
			}else{
				diamondbuynums=JacksonManager.getInstance().getGson().fromJson(diamondbuynum, int[].class);
			}
		}
		return diamondbuynums;
	}

	public void setDiamondbuynums(int[] diamondbuynums) {
		diamondbuynum=JacksonManager.getInstance().getGson().toJson(diamondbuynums);
		this.diamondbuynums = diamondbuynums;
		this.dirty=true;
	}

	public int[] getSyntanknums() {
		if(syntanknums==null){
			if(syntanknum==null || "".equals(syntanknum)){
				syntanknums=new int[40];
				syntanknum=JacksonManager.getInstance().getGson().toJson(syntanknums);
			}else{
				syntanknums=JacksonManager.getInstance().getGson().fromJson(syntanknum, int[].class);
			}
		}
		return syntanknums;
	}

	public void setSyntanknums(int[] syntanknums) {
		syntanknum=JacksonManager.getInstance().getGson().toJson(syntanknums);
		this.syntanknums = syntanknums;
		this.dirty=true;
	}

	
	public Integer getTotaldiamond() {
		return totaldiamond;
	}

	public void setTotaldiamond(Integer totaldiamond) {
		this.totaldiamond = totaldiamond;
	}

	public Long getMissionleveltime() {
		return missionleveltime;
	}

	public void setMissionleveltime(Long missionleveltime) {
		this.missionleveltime = missionleveltime;
	}

	public Integer getNowtankid() {
		return nowtankid;
	}

	public void setNowtankid(Integer nowtankid) {
		this.nowtankid = nowtankid;
	}

	public Integer getTitlelevel() {
		return titlelevel;
	}

	public void setTitlelevel(Integer titlelevel) {
		this.titlelevel = titlelevel;
	}

	public String getPackitem() {
		return packitem;
	}

	public void setPackitem(String packitem) {
		this.packitem = packitem;
	}

	public String getBattletank() {
		return battletank;
	}

	public void setBattletank(String battletank) {
		this.battletank = battletank;
	}

	public String getGoldbuynum() {
		return goldbuynum;
	}

	public void setGoldbuynum(String goldbuynum) {
		this.goldbuynum = goldbuynum;
	}

	public String getDiamondbuynum() {
		return diamondbuynum;
	}

	public void setDiamondbuynum(String diamondbuynum) {
		this.diamondbuynum = diamondbuynum;
	}

	public String getSyntanknum() {
		return syntanknum;
	}

	public void setSyntanknum(String syntanknum) {
		this.syntanknum = syntanknum;
	}

	public Long getKillnum() {
		return killnum;
	}

	public void setKillnum(Long killnum) {
		this.killnum = killnum;
	}

	public Integer getMissionlevel() {
		return missionlevel;
	}

	public void setMissionlevel(Integer missionlevel) {
		this.missionlevel = missionlevel;
	}

	public Long getTime() {
		return time;
	}

	public void setTime(Long time) {
		this.time = time;
	}

	public String getChannel() {
		return channel;
	}

	public void setChannel(String channel) {
		this.channel = channel;
	}
	
	public void setupdate(){
		PlayerManager.getInstance().updatewgplayer(this);
		this.dirty=false;
	}
	@Transient
    private boolean dirty;
    
    
	public boolean isDirty() {
		return dirty;
	}

	public void setDirty(boolean dirty) {
		this.dirty = dirty;
	}
    //
    @Transient
    private WgPlayer1 wgPlayer1;

    public WgPlayer1 getWgPlayer1() {
    	if(wgPlayer1==null){
    		wgPlayer1=PlayerManager.getInstance().getwgplayer1(serveruid, sid);
    	}
		return wgPlayer1;
	}
    
    @JsonIgnore
    @Transient
    private Knapsack knapsack;

	public Knapsack getKnapsack() {
		if(knapsack==null){
			knapsack=new Knapsack(this);
		}
		return knapsack;
	}

	public void setKnapsack(Knapsack knapsack) {
		this.knapsack = knapsack;
	}

	public void setWgPlayer1(WgPlayer1 wgPlayer1) {
		this.wgPlayer1 = wgPlayer1;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}
	

	public String getProfit() {
		return profit;
	}

	public void setProfit(String profit) {
		this.profit = profit;
	}

	public Integer getProfittime() {
		return profittime;
	}

	public void setProfittime(Integer profittime) {
		this.profittime = profittime;
	}

	public String getGold() {
		return gold;
	}

	public void setGold(String gold) {
		this.gold = gold;
	}

	public Long getDiamond() {
		return diamond;
	}

	public void setDiamond(Long diamond) {
		this.diamond = diamond;
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
     * @return serveruid
     */
    public Long getServeruid() {
        return serveruid;
    }

    /**
     * @param serveruid
     */
    public void setServeruid(Long serveruid) {
        this.serveruid = serveruid;
    }

    /**
     * @return playername
     */
    public String getPlayername() {
        return playername;
    }

    /**
     * @param playername
     */
    public void setPlayername(String playername) {
        this.playername = playername == null ? null : playername.trim();
    }

    /**
     * @return username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username
     */
    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }
    
    
    /**
     * @param addgold
     * 字符串金币增加;
     */
    public void addgold(String addgold){
    	this.gold=Util.UtilBigDecimal(this.gold, addgold, 0);
    	this.dirty=true;
    }
    
    public void adddiamond(int add){
    	this.diamond=this.diamond+add;
    	this.dirty=true;
    }

	
	@Override
	public String toString() {
		return "WgPlayer [id=" + id + ", sid=" + sid + ", serveruid=" + serveruid + ", playername=" + playername
				+ ", username=" + username + ", diamond=" + diamond + ", gold=" + gold + ", level=" + level
				+ ", profit=" + profit + ", profittime=" + profittime + ", channel=" + channel + ", time=" + time
				+ ", nowtankid=" + nowtankid + ", titlelevel=" + titlelevel + ", packitem=" + packitem + ", packitems="
				+ Arrays.toString(packitems) + ", battletank=" + battletank + ", battletanks="
				+ Arrays.toString(battletanks) + ", goldbuynum=" + goldbuynum + ", goldbuyNums="
				+ Arrays.toString(goldbuyNums) + ", diamondbuynum=" + diamondbuynum + ", diamondbuynums="
				+ Arrays.toString(diamondbuynums) + ", syntanknum=" + syntanknum + ", syntanknums="
				+ Arrays.toString(syntanknums) + ", serial=" + serial + ", serialtime=" + serialtime + ", logintime="
				+ logintime + ", onlinetime=" + onlinetime + ", online=" + online + ", lastlogintime=" + lastlogintime
				+ ", killnum=" + killnum + ", missionlevel=" + missionlevel + ", dirty=" + dirty + ", wgPlayer1="
				+ wgPlayer1 + ", knapsack=" + knapsack + "]";
	}

	public void heartbeat(long time){
		if(this.isOnline()==true){
			 if(time-this.getLastlogintime()<PlayerManager.onlinetime){
				 this.setOnline(false);
			 }
		}
		//重置；
		if(time-this.restetime>=24 * 60 * 60 * 1000){
			//并且在线；
			if(this.isOnline()){
				//判断是否在线；
	    		resetData(time,0);
			}
    	}
		if(this.dirty==true){
			this.setupdate();
		}
		if(this.wgPlayer1!=null){
			this.wgPlayer1.hearbeat();
		}
	}
	
	public void resetData(long time,int type){
		edtiresettime();
		this.getWgPlayer1().resetdate(time, -1);
		this.dirty=true;
	}
	
	//重置时间；
	public void edtiresettime(){
		String s1=Util.getDate(System.currentTimeMillis(), 2);
    	long timestart=Util.getLongTime(s1,1);
    	System.out.println(Util.getDate(timestart, 2));
		restetime=timestart;
		this.dirty=true;
	}
	
	
	
	
	public void resetuser(){
		long nowtime = System.currentTimeMillis();
		long refreshtime = this.getRestetime();
    	if(nowtime-refreshtime>=24 * 60 * 60 * 1000){
    		System.out.println("----aaa");
    		resetData(nowtime,0);
    	}else{
    		System.out.println("----bbb");
    		//获取凌晨时间；
    	 	String s1=Util.getDate(refreshtime, 2);
        	long timestart=Util.getLongTime(s1,1);
        	if(nowtime-timestart>=24 * 60 * 60 * 1000){
        		resetData(nowtime,0);
        	}
    	}
	}
    
    
    
    
    
}
package web.game.user;

import web.game.pojo.WgPlayer;
import web.game.util.Util;

public class Wgplayerclient {
	private String channel;
	private String playername;
	private String rolename;
	private String username;
	private String gold;
	private long diamond;
	private int level;
	private int missionlevel;
	private int totaldiamond;
	private long time;
	private String time1;
	private long serveruid;
	
	
	public long getServeruid() {
		return serveruid;
	}
	public void setServeruid(long serveruid) {
		this.serveruid = serveruid;
	}
	public long getTime() {
		return time;
	}
	public void setTime(long time) {
		this.time = time;
	}
	public String getTime1() {
		return time1;
	}
	public void setTime1(String time1) {
		this.time1 = time1;
	}
	public String getChannel() {
		return channel;
	}
	public void setChannel(String channel) {
		this.channel = channel;
	}
	public String getPlayername() {
		return playername;
	}
	public void setPlayername(String playername) {
		this.playername = playername;
	}
	public String getRolename() {
		return rolename;
	}
	public void setRolename(String rolename) {
		this.rolename = rolename;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getGold() {
		return gold;
	}
	public void setGold(String gold) {
		this.gold = gold;
	}
	public long getDiamond() {
		return diamond;
	}
	public void setDiamond(long diamond) {
		this.diamond = diamond;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getMissionlevel() {
		return missionlevel;
	}
	public void setMissionlevel(int missionlevel) {
		this.missionlevel = missionlevel;
	}
	public int getTotaldiamond() {
		return totaldiamond;
	}
	public void setTotaldiamond(int totaldiamond) {
		this.totaldiamond = totaldiamond;
	}
	
	public static Wgplayerclient getWgplayerclient(WgPlayer wgPlayer){
		if(wgPlayer==null){
			return null;
		}else{
			Wgplayerclient wg=new Wgplayerclient();
			wg.setChannel(wgPlayer.getChannel());
			wg.setDiamond(wgPlayer.getDiamond());
			wg.setGold(wgPlayer.getGold());
			wg.setLevel(wgPlayer.getLevel());
			wg.setMissionlevel(wgPlayer.getMissionlevel());
			wg.setPlayername(wgPlayer.getPlayername());
			wg.setRolename(wgPlayer.getRolename());
			wg.setTotaldiamond(wgPlayer.getTotaldiamond());
			wg.setUsername(wgPlayer.getUsername());
			wg.setTime(wgPlayer.getTime());
			wg.setTime1(Util.getDate(wgPlayer.getTime(),2));
			wg.setServeruid(wgPlayer.getServeruid());
			return wg;
		}
	}

}

package web.game.common;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.List;

import web.game.player.PlayerManager;
import web.game.pojo.WgPlayer;

public class Game implements Runnable{
	public static final long HEART_TIME = 1*60*1000;
	public static Game self;
	public static Calendar PUBLIC_CAL = Calendar.getInstance();
	private int refreshDay;
	private  int flag=0;
	private int key=0;
	public String[] newflag={"0","0","0","0","0","0","0","0"};//使用到下标3
	
	
	public int getKey() {
		return key;
	}
	public void setKey(int key) {
		this.key = key;
	}
	public Thread thread = null;
	
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	public static Game getInstance(){
		return self;
	}
	public void init(){
		thread = new Thread(this,"Game");
		thread.start();
		self = this;
		System.out.println("[系统初始化] [游戏主心跳] ["+this.getClass().getName()+"] [初始化成功]");
	}
	public  PlayerManager playerManager;
	
	public PlayerManager getPlayerManager() {
		if(playerManager==null){
			playerManager=PlayerManager.getInstance();
		}
		return playerManager;
	}
	public void setPlayerManager(PlayerManager playerManager) {
		this.playerManager = playerManager;
	}
	@Override
	public void run() {
		while(true){
			try {
				Thread.sleep(HEART_TIME);
				if(!ContextLoadFinishedListener.isLoadFinished()) {
					continue;
				}
				long time=System.currentTimeMillis();
				key++;
				PUBLIC_CAL = Calendar.getInstance();
				int day = PUBLIC_CAL.get(Calendar.DAY_OF_YEAR);
				int hourTime = PUBLIC_CAL.get(Calendar.HOUR_OF_DAY);
				int minTime = PUBLIC_CAL.get(Calendar.MINUTE);
				if(key%10==0){
					//System.out.println(day+"-"+hourTime+"-"+minTime+"--------------serverid:--心跳！");
				}
				PlayerManager playerManager=this.getPlayerManager();
				if(playerManager==null){
					continue;
				}
				Collection<WgPlayer> wplist=playerManager.getIdplayermap().values();
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
				flag=0;
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}
	public void destroy(){
		
	}
	
	
}

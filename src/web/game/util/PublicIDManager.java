package web.game.util;

import java.util.Hashtable;
import org.springframework.beans.factory.annotation.Autowired;

import web.game.mapper.WgPublicidMapper;
import web.game.pojo.WgPublicid;


public class PublicIDManager implements Runnable{
	public long updatePeriod = 10000;
	
	public static final int[] ID_TYPES = new int[] { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17,18,19,20,21,22,23,24};
	@Autowired 
	public WgPublicidMapper wgPublicidMapper;
	private Hashtable<Integer, WgPublicid> sequenceMap=new Hashtable<Integer, WgPublicid>();
	public static PublicIDManager self=null;
	public static PublicIDManager getInstance(){
		return self;
	}
	
	public Hashtable<Integer, WgPublicid> getSequenceMap() {
		if(sequenceMap==null){
			sequenceMap=new Hashtable<Integer, WgPublicid>();
		}
		return sequenceMap;
	}
	public void setSequenceMap(Hashtable<Integer, WgPublicid> sequenceMap) {
		this.sequenceMap = sequenceMap;
	}
	private int serverId = -1;
	
	public void setServerId(int serverId) {
		this.serverId = serverId;
	}
	public void init(){
		self=this;
		long start = System.currentTimeMillis();
		//this.serverId =GameServerManager.getInstance().getServerid();
		for (int i = 0; i < ID_TYPES.length; i++) {
			WgPublicid publcid=gettype(ID_TYPES[i]);
			if(publcid!=null){
				sequenceMap.put(ID_TYPES[i],publcid);
				//System.out.println("PublicIDManager------------------------------------------success！");
				//System.out.println(publcid.getId()+"---"+publcid.getLastid());
			}else{
				WgPublicid publcidone =new WgPublicid();
				publcidone.setType(ID_TYPES[i]);
				long firstid = Long.parseLong("1" + formatServerId(this.serverId) + "00000000001");
				publcidone.setLastid(firstid);
				publcidone.setSrverid(serverId);
				save(publcidone);
				sequenceMap.put(ID_TYPES[i],publcidone);
				//System.out.println("PublicIDManager------------------------------------------first！");
			}
		}	
		System.out.println("[PublicIDManager初始化完成][------]["
				+ (System.currentTimeMillis() - start) + "ms]");

		Thread t=new Thread(this,"PublicIDManager");
		t.start();
		
		
		
/*		String username="-1";

		WgPlayerserver wgpsystem=new WgPlayerserver();
		wgpsystem.setUsername(username);
		wgpsystem.setSid(this.serverId);
		if(wgPlayerserverMapper.selectOne(wgpsystem)==null){
			PlayerManager.getInstance().createPlayersystem("-1", "系统邮件", 0,"");
			PlayerManager.getInstance().createPlayersystem("-2", "GM", 0,"");
		};*/
/*		WgPublicid wp=new WgPublicid();
		wp.setId(19);
		wp.setType(20);
		wgPublicidMapper.updateByPrimaryKeySelective(wp);*/
		//long nextid=nextId(5);
/*		long nextid1=nextId(5);
		long nextid2=nextId(5);
		long nextid3=nextId(5);
		long nextid4=nextId(5);
		long nextid5=nextId(5);
		long nextid6=nextId(5);
		long nextid7=nextId(6);*/
		//System.out.println("************************************************");

//		long nextid=nextId(1);
//		//System.out.println("--------"+nextid);
//		Publicid pd=new Publicid();
//		pd.setId(1);
//		pd.setLastid(nextid);
//		update(pd);

	}
	private String formatServerId(long serverId) {
		if (serverId < 10) {
			return "000" + serverId;
		} else if (serverId < 100) {
			return "00" + serverId;
		} else if (serverId < 1000) {
			return "0" + serverId;
		}else if(serverId < 10000){
			return String.valueOf(serverId);
		} else {
			throw new RuntimeException("当前序列系统的设计服务器最大id不能超过9999");
		}
	}
	public WgPublicid gettype(int type){
		WgPublicid wp=new WgPublicid();
		wp.setType(type);
		wp.setSrverid(serverId);
		WgPublicid publcid=wgPublicidMapper.selectOne(wp);
		return publcid; 
	}
	public void save(WgPublicid publicid){
		wgPublicidMapper.insert(publicid);
	}
	public long nextId(int type) {
		WgPublicid pid = sequenceMap.get(type);
		if (pid != null) {
			synchronized (pid) {
				long nextid = pid.getLastid();
				pid.setLastid(nextid + 1);
				pid.setDirty(true);
				return pid.getLastid();
			}
		} else {
			throw new RuntimeException("严重错误！请求的序列类型未定义 type [" + type + "]");
		}
	}
	public void update(WgPublicid publicid){
		//publicidMapper.updateByPrimaryKeyone(publicid);	
		wgPublicidMapper.updateByPrimaryKeySelective(publicid);
	}
	
	
	
	public void destroy(){
		for (Integer key : sequenceMap.keySet()) {
			WgPublicid pd=sequenceMap.get(key);
			if(pd.isDirty()==true){
				update(pd);
				pd.setDirty(false);
			}
		}
	}
	
	@Override
	public void run() {
		while(true){
			try {
				Thread.sleep(updatePeriod);
				//System.out.println("run--------------------------------------------"+System.currentTimeMillis());
				for (Integer key : sequenceMap.keySet()) {
					WgPublicid pd=sequenceMap.get(key);
					if(pd.isDirty()==true){
						update(pd);
						pd.setDirty(false);
					}
				}
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	
	
	

}

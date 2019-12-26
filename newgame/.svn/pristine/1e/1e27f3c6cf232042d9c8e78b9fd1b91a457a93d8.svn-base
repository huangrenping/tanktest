package web.game.player.logic.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.github.pagehelper.PageHelper;
import com.google.gson.reflect.TypeToken;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;
import web.game.article.Article2;
import web.game.article.ArticleCommon;
import web.game.article.ArticleManager;
import web.game.common.Commoncost;
import web.game.player.PlayerClient;
import web.game.player.PlayerManager;
import web.game.player.logic.PlayerLogicInt;
import web.game.pojo.WgPlayer;
import web.game.tank.Tank;
import web.game.tank.TankLevel;
import web.game.tank.TankManager;
import web.game.user.Playertb;
import web.game.util.JacksonManager;

public class PlayerlogicImpl  implements PlayerLogicInt{

	@Override
	public Map<String, Object> user(long playerid) {
		Map<String, Object> map=new HashMap<String, Object>();
		WgPlayer wgplayer=PlayerManager.getInstance().getplayer(playerid);
		if(wgplayer==null){
			map.put("error", -1);
			return map;
		}
		int error=0;
		map.put("sid", wgplayer.getSid());
		map.put("serveruid", wgplayer.getServeruid());
		map.put("diamond", wgplayer.getDiamond());
		map.put("gold", wgplayer.getGold());
		map.put("playername", wgplayer.getPlayername());
		map.put("username", wgplayer.getUsername());
		//map.put("profit", wgplayer.getProfit());
		//map.put("profittime", wgplayer.getProfittime());
		map.put("level", wgplayer.getLevel());
		
		map.put("nowTankId", wgplayer.getNowtankid());
		map.put("titleLevel", wgplayer.getTitlelevel());
		map.put("packItem", wgplayer.getPackitems());
		map.put("battleTank", wgplayer.getBattletanks());
		map.put("goldbuyNum", wgplayer.getGoldbuyNums());
		map.put("diamondbuyNum", wgplayer.getDiamondbuynums());
		map.put("synTankNum", wgplayer.getSyntanknums());
		map.put("killNum", wgplayer.getKillnum());
		map.put("missionLevel", wgplayer.getMissionlevel());
		map.put("rolename", wgplayer.getRolename());
		map.put("serial", wgplayer.getSerial());
		PlayerManager.wgmain(wgplayer);
		wgplayer.setLogintime(System.currentTimeMillis());
		wgplayer.setDirty(true);
		map.put("error", error);
		return map;
	}

	@Override
	public Map<String, Object> test(long playerid,String userdata) {
		System.out.println(userdata);
		Map<String,String> httpget=JacksonManager.maphttpget(userdata);
		Map<String, Object> map=new HashMap<String, Object>();
		String oid=httpget.get("id");
		if(oid==null){
			map.put("error", -2);
			return map;
		}
		Integer id=Integer.valueOf(httpget.get("id"));
		System.out.println(id+"##############");
		
		WgPlayer wgplayer=PlayerManager.getInstance().getplayer(playerid);
		if(wgplayer==null){
			map.put("error", -1);
			return map;
		}
		int error=0;
		map.put("sid", wgplayer.getSid());
		map.put("serveruid", wgplayer.getServeruid());
		map.put("diamond", wgplayer.getDiamond());
		map.put("gold", wgplayer.getGold());
		map.put("playername", wgplayer.getPlayername());
		map.put("username", wgplayer.getUsername());
		map.put("profit", wgplayer.getProfit());
		map.put("profittime", wgplayer.getProfittime());
		map.put("level", wgplayer.getLevel());
		wgplayer.getWgPlayer1();
		
		wgplayer.getWgPlayer1().addtask(1, 1, 1);
		wgplayer.getWgPlayer1().adddailytasks(1, 100, 1);
		wgplayer.getKnapsack().addknapsackone(1000202, "1");
		wgplayer.getKnapsack().addknapsackone(1000001, "15");
		map.put("error", error);
		return map;
	}

	@Override
	public Map<String, Object> synchronousData(long playerid, String userdata) {
		int error=0;
		Map<String, Object> map=new HashMap<String, Object>();
		WgPlayer wgplayer=PlayerManager.getInstance().getplayer(playerid);
		if(wgplayer==null){
			map.put("error", -1);
			return map;
		}
		Playertb playertb= JacksonManager.getInstance().getGson().fromJson(userdata, new TypeToken<Playertb>() {
		}.getType());
		//System.out.println(playertb.toString());
		
		if(playertb.getGold()!=null){
			wgplayer.setGold(playertb.getGold());
		}
		if(playertb.getLevel()!=null){
			wgplayer.setLevel(playertb.getLevel());
		}
		if(playertb.getNowTankId()!=null){
			wgplayer.setNowtankid(playertb.getNowTankId());
		}
		if(playertb.getTitleLevel()!=null){
			wgplayer.setTitlelevel(playertb.getTitleLevel());
		}
		
		//---
		if(playertb.getPackItem()!=null){
			wgplayer.setPackitems(playertb.getPackItem());
		}
		if(playertb.getBattleTank()!=null){
			wgplayer.setBattletanks(playertb.getBattleTank());
		}
		if(playertb.getGoldbuyNum()!=null){
			wgplayer.setGoldbuyNums(playertb.getGoldbuyNum());
		}
		if(playertb.getDiamondbuyNum()!=null){
			wgplayer.setDiamondbuynums(playertb.getDiamondbuyNum());
		}
		if(playertb.getSynTankNum()!=null){
			wgplayer.setSyntanknums(playertb.getSynTankNum());
		}
		
		if(playertb.getKillNum()!=null){
			wgplayer.setKillnum(playertb.getKillNum());
		}
		if(playertb.getMissionLevel()!=null){
			wgplayer.setMissionlevel(playertb.getMissionLevel());
		}
		
		if(playertb.getSerial()!=null){
			wgplayer.setSerial(playertb.getSerial());
		}
		wgplayer.setSerialtime(System.currentTimeMillis());
		wgplayer.setDirty(true);
		map.put("serial", playertb.getSerial());
		map.put("red", wgplayer.getWgPlayer1().getReds());
		map.put("error", error);
		return map;
	}

	@Override
	public Map<String, Object> sevenday(long playerid) {
		int error=0;
		Map<String, Object> map=new HashMap<String, Object>();
		WgPlayer wgplayer=PlayerManager.getInstance().getplayer(playerid);
		if(wgplayer==null){
			map.put("error", -1);
			return map;
		}
		List<ArticleCommon> list=new ArrayList<ArticleCommon>();
		int[] sevendayrewsards=wgplayer.getWgPlayer1().getSevendayrewsards();
		
		int key=1;
		for (int articleid : PlayerManager.sevendayarticle) {
			ArticleCommon articleCommon=new ArticleCommon();
			List<Article2> listone=ArticleManager.getarticlelist(articleid, String.valueOf(1));
			articleCommon.setList(listone);
			articleCommon.setNum(key);
			articleCommon.setIsreward(sevendayrewsards[key-1]);
			key++;
			list.add(articleCommon);
		}
		map.put("list", list);
		map.put("error", error);
		return map;
	}

	@Override
	public Map<String, Object> sevendayreward(long playerid, String data) {
		int error=0;
		Map<String, Object> map=new HashMap<String, Object>();
		WgPlayer wgplayer=PlayerManager.getInstance().getplayer(playerid);
		if(wgplayer==null){
			map.put("error", -1);
			return map;
		}
		Map<String,String> httpget=JacksonManager.maphttpget(data);
		String oid=httpget.get("id");
		if(oid==null){
			map.put("error", -2);
			return map;
		}
		Integer id=Integer.valueOf(httpget.get("id"));
		if(id>7){
			map.put("error", 1);
			return map;
		}
		int[] sevendayrewsards=wgplayer.getWgPlayer1().getSevendayrewsards();
		if(sevendayrewsards[id]!=1){
			map.put("error", 2);
			return map;
		}
		sevendayrewsards[id]=2;
		wgplayer.getWgPlayer1().setSevendayrewsards(sevendayrewsards);
		int num=1;
		List<Article2> list=ArticleManager.getarticlelist(PlayerManager.sevendayarticle[id], String.valueOf(num));
		wgplayer.getKnapsack().addknapsackone(PlayerManager.sevendayarticle[id], String.valueOf(num));
		
		Map<Integer, Long> alltimes=wgplayer.getWgPlayer1().getAlltimes();
		alltimes.put(1, System.currentTimeMillis());
		wgplayer.getWgPlayer1().setAlltimes(alltimes);
		
		wgplayer.getWgPlayer1().openred(PlayerManager.sevenday);
		
		map.put("list", list);
		map.put("error", error);
		return map;
	}

	@Override
	public Map<String, Object> buytank(long playerid, String data) {
		int error=0;
		Map<String, Object> map=new HashMap<String, Object>();
		WgPlayer wgplayer=PlayerManager.getInstance().getplayer(playerid);
		if(wgplayer==null){
			map.put("error", -1);
			return map;
		}
		Map<String,String> httpget=JacksonManager.maphttpget(data);
		String oid=httpget.get("id");
		if(oid==null){
			map.put("error", -2);
			return map;
		}
		Integer id=Integer.valueOf(httpget.get("id"));
		Tank tank=TankManager.getInstance().getMaptank().get(id);
		if(tank==null){
			map.put("error", -3);
			return map;
		}
		if(wgplayer.getDiamond()<tank.getPrice1()){
			map.put("error", 1);
			return map;
		}
		Commoncost.playerExpense(wgplayer, 0, String.valueOf(tank.getPrice1()), Commoncost.diamondtype,Commoncost.buytank);
		
		int[] diamondbuynums=wgplayer.getDiamondbuynums();
		diamondbuynums[tank.getLevel()-1]=diamondbuynums[tank.getLevel()-1]+1;
		wgplayer.setDiamondbuynums(diamondbuynums);
		
		map.put("diamondbuynum", wgplayer.getDiamondbuynums());
		map.put("id", tank.getId());
		map.put("costdiamond", tank.getPrice1());
		map.put("diamond", wgplayer.getDiamond());
		map.put("error", error);
		return map;
	}

	@Override
	public Map<String, Object> topall(long playerid) {
		int error=0;
		Map<String, Object> map=new HashMap<String, Object>();
		PlayerManager playerManager=PlayerManager.getInstance();
		WgPlayer wgplayer=PlayerManager.getInstance().getplayer(playerid);
		if(wgplayer==null){
			map.put("error", -1);
			return map;
		}
		long nowtime=System.currentTimeMillis();
		List<WgPlayer> listtop1=playerManager.getListtop1();
		List<PlayerClient> list=new ArrayList<PlayerClient>();
		
		if(listtop1==null || nowtime-playerManager.getTop1()>=5*60*1000){
			//没5分钟刷新一次；
			Example example=new Example(WgPlayer.class);
			example.setOrderByClause("missionlevel desc,missionleveltime asc,time asc");
			Criteria criteria = example.createCriteria();
			criteria.andEqualTo("sid", playerManager.getServerid());
			PageHelper.startPage(1, 100);
			listtop1=playerManager.wgPlayerMapper.selectByExample(example);
			playerManager.setListtop1(listtop1);
			playerManager.setTop1(nowtime);
		}
		int myrank=0;
		int id=0;
		for (WgPlayer wgPlayer2 : listtop1) {
			id++;
			PlayerClient playerClient=new PlayerClient();
			if(wgPlayer2.getServeruid()==playerid){
				myrank=id;
			}
			playerClient.setRanking(id);
			playerClient.setAvatar(wgPlayer2.getAvatar());
			playerClient.setLevel(wgPlayer2.getLevel());
			playerClient.setNum(wgPlayer2.getMissionlevel());
			playerClient.setNum1(0);
			playerClient.setPlayername(wgPlayer2.getPlayername());
			playerClient.setUid(wgPlayer2.getServeruid());
			playerClient.setViplevel(0);
			list.add(playerClient);
		}
		map.put("myrank", myrank);
		map.put("list", list);
		map.put("error", error);
		return map;
	}

	@Override
	public Map<String, Object> uplevel(long playerid,String userdata) {
		int error=0;
		Map<String,String> httpget=JacksonManager.maphttpget(userdata);
		Map<String, Object> map=new HashMap<String, Object>();
		String oid=httpget.get("level");
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
		TankLevel tl=TankManager.getInstance().getMaptanklevel().get(id);
		if(tl==null){
			map.put("error", -3);
			return map;
		}
		int[] leverewards=wgplayer.getWgPlayer1().getLeverewards();
		if(leverewards[id-1]!=0){
			map.put("error", 1);
			return map;
		}
		Commoncost.playerIncrease(wgplayer, 0, String.valueOf(tl.getReward()), Commoncost.diamondtype,Commoncost.levelup);
		leverewards[id-1]=1;
		wgplayer.getWgPlayer1().setLeverewards(leverewards);
		map.put("error", error);
		return map;
	}
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
}

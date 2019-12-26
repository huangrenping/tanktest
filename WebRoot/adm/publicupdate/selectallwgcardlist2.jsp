<%@page import="web.webSocket.plot.PlotManager"%>
<%@ page language="java"
	import="java.util.*,
com.google.gson.Gson,web.webSocket.pojo.*,
web.webSocket.util.*,web.webSocket.card.*,
web.webSocket.plot.*,
web.webSocket.article.ArticleManager,
web.webSocket.mapper.WgPlayerserverMapper,
web.webSocket.entity.PlayerAndAllCard,
web.webSocket.entity.PlayerCard,
web.webSocket.util.JacksonManager,
org.codehaus.jackson.node.ObjectNode,
web.webSocket.player.PlayerManager,
tk.mybatis.mapper.entity.Example,
tk.mybatis.mapper.entity.Example.Criteria,
com.github.pagehelper.PageHelper,
com.github.pagehelper.PageInfo"


	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%!
public class PlayerAndAllCard2 {
	private String playerName;//玩家名
	private String userName;//玩家名
	private long serverUid;//
	private int R1;
	private int R2;
	private int R3;
	private int R4;
	private int SR1;
	private int SR2;
	private int SR3;
	private int SR4;
	private int SR5;
	private int SSR1;
	private int SSR2;
	private int SSR3;
	private int SSR4;
	private int SSR5;
	private int cardnum;
	private int yifunum;
	private int R;
	private int SR;
	private int SSR;
	private int level;
	private String guanka;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String UserName) {
		userName = UserName;
	}
	public String getGuanka() {
		return guanka;
	}
	public void setGuanka(String Guanka) {
		guanka = Guanka;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int levell) {
		level = levell;
	}
	public int getR() {
		return R;
	}
	public void setR(int rr) {
		R = rr;
	}
	public int getSR() {
		return SR;
	}
	public void setSR(int sRr) {
		SR = sRr;
	}
	
	public int getSSR() {
		return SSR;
	}
	public void setSSR(int sSSRr) {
		SSR = sSSRr;
	}
	public int getYifunum() {
		return yifunum;
	}
	public void setYifunum(int yifunum2) {
		yifunum = yifunum2;
	}
	public int getCardnum() {
		return cardnum;
	}
	public void setCardnum(int cardnum2) {
		cardnum = cardnum2;
	}
	public long getServerUid() {
		return serverUid;
	}
	public void setServerUid(long serverUid) {
		this.serverUid = serverUid;
	}
	public int getR1() {
		return R1;
	}
	public void setR1(int r1) {
		R1 = r1;
	}
	public int getR2() {
		return R2;
	}
	public void setR2(int r2) {
		R2 = r2;
	}
	public int getR3() {
		return R3;
	}
	public void setR3(int r3) {
		R3 = r3;
	}
	public int getR4() {
		return R4;
	}
	public void setR4(int r4) {
		R4 = r4;
	}
	public int getSR1() {
		return SR1;
	}
	public void setSR1(int sR1) {
		SR1 = sR1;
	}
	public int getSR2() {
		return SR2;
	}
	public void setSR2(int sR2) {
		SR2 = sR2;
	}
	public int getSR3() {
		return SR3;
	}
	public void setSR3(int sR3) {
		SR3 = sR3;
	}
	public int getSR4() {
		return SR4;
	}
	public void setSR4(int sR4) {
		SR4 = sR4;
	}
	public int getSR5() {
		return SR5;
	}
	public void setSR5(int sR5) {
		SR5 = sR5;
	}
	public int getSSR1() {
		return SSR1;
	}
	public void setSSR1(int sSR1) {
		SSR1 = sSR1;
	}
	public int getSSR2() {
		return SSR2;
	}
	public void setSSR2(int sSR2) {
		SSR2 = sSR2;
	}
	public int getSSR3() {
		return SSR3;
	}
	public void setSSR3(int sSR3) {
		SSR3 = sSR3;
	}
	public int getSSR4() {
		return SSR4;
	}
	public void setSSR4(int sSR4) {
		SSR4 = sSR4;
	}
	public int getSSR5() {
		return SSR5;
	}
	public void setSSR5(int sSR5) {
		SSR5 = sSR5;
	}
	public String getPlayerName() {
		return playerName;
	}
	public void setPlayerName(String playerName) {
		this.playerName = playerName;
	}
	
}
%>
<%
String start = request.getParameter("start");
String end = request.getParameter("end");
String lasttime = request.getParameter("time");
long lastlogintime=Long.valueOf(lasttime);


List<PlayerAndAllCard2> data=new ArrayList<PlayerAndAllCard2>();
PlayerManager playerManager = PlayerManager.getInstance();
CardManager cardManager = CardManager.getInstance();
int start1=Integer.valueOf(start);
int end1 =Integer.valueOf(end);
GameServerManager gameServerManager=GameServerManager.getInstance();
int sid=gameServerManager.getServerid();
Wgselectplayerserver ws=new Wgselectplayerserver();
ws.setSid(sid);
ws.setStart(start1);
ws.setEnd(end1);
WgPlayerserver wgp=new WgPlayerserver();
wgp.setSid(sid);
//int count=playerManager.wgPlayerserverMapper.selectCount(wgp);

Example example1=new Example(WgPlayerserver.class);
Criteria criteria1 = example1.createCriteria();
criteria1.andEqualTo("sid", sid);
criteria1.andGreaterThanOrEqualTo("lastlogintime", lastlogintime);
int count=playerManager.wgPlayerserverMapper.selectCountByExample(example1);
//List<WgPlayerserver> selectlimitbyonlintime = playerManager.wgPlayerserverMapper.selectlimitbyonlintime(ws);

PageHelper.startPage(start1, end1);
Example example=new Example(WgPlayerserver.class);
Criteria criteria = example.createCriteria();
criteria.andEqualTo("sid", sid);
criteria.andGreaterThanOrEqualTo("lastlogintime", lastlogintime);
List<WgPlayerserver> selectlimitbyonlintime=playerManager.wgPlayerserverMapper.selectByExample(example);

List<Long> uidlist =new ArrayList<Long>(); 
for (WgPlayerserver wgPlayerserver : selectlimitbyonlintime) {
	uidlist.add(wgPlayerserver.getServeruid());
}
Map<Long, List<WgPlayercard>> selectallCard = cardManager.selectallCard(uidlist);
for (WgPlayerserver wgPlayerserver : selectlimitbyonlintime) {
	PlayerAndAllCard2 allCard=new PlayerAndAllCard2();
	allCard.setPlayerName(wgPlayerserver.getPlayername());
	allCard.setServerUid(wgPlayerserver.getServeruid());
	List<WgPlayercard> listcard =selectallCard.get(wgPlayerserver.getServeruid());
	if(listcard==null){
		continue;
	}
	int cardnum=0;
	for (WgPlayercard wgPlayercard : listcard) {
		if (wgPlayercard != null) {
			CardClient cc = new CardClient();
			cc = cardManager.tocardclient(wgPlayercard);
			if (wgPlayercard.getType() == 0) {
				if (cc.getId() == 51003 || cc.getId() == 51004 || cc.getId() == 51005) {
					continue;
				}
				cardnum++;
				if(cc.getQuality()==1&&cc.getStar()==1){
					allCard.setR1(allCard.getR1()+1);
				}else if(cc.getQuality()==1&&cc.getStar()==2){
					allCard.setR2(allCard.getR2()+1);
				}else if(cc.getQuality()==1&&cc.getStar()==3){
					allCard.setR3(allCard.getR3()+1);
				}else if(cc.getQuality()==1&&cc.getStar()==4){
					allCard.setR4(allCard.getR4()+1);
				}else if(cc.getQuality()==2&&cc.getStar()==1){
					allCard.setSR1(allCard.getSR1()+1);
				}else if(cc.getQuality()==2&&cc.getStar()==2){
					allCard.setSR2(allCard.getSR2()+1);
				}else if(cc.getQuality()==2&&cc.getStar()==3){
					allCard.setSR3(allCard.getSR3()+1);
				}else if(cc.getQuality()==2&&cc.getStar()==4){
					allCard.setSR4(allCard.getSR4()+1);
				}else if(cc.getQuality()==2&&cc.getStar()==5){
					allCard.setSR5(allCard.getSR5()+1);
				}else if(cc.getQuality()==3&&cc.getStar()==1){
					allCard.setSSR1(allCard.getSSR1()+1);
				}else if(cc.getQuality()==3&&cc.getStar()==2){
					allCard.setSSR2(allCard.getSSR2()+1);
				}else if(cc.getQuality()==3&&cc.getStar()==3){
					allCard.setSSR3(allCard.getSSR3()+1);
				}else if(cc.getQuality()==3&&cc.getStar()==4){
					allCard.setSSR4(allCard.getSSR4()+1);
				}else if(cc.getQuality()==3&&cc.getStar()==5){
					allCard.setSSR5(allCard.getSSR5()+1);
				}
				
				if(cc.getQuality()==1&&(cc.getTuponum()>0||cc.getTupo()>0)){
					allCard.setR(allCard.getR()+1);
				}else if(cc.getQuality()==2&&(cc.getTuponum()>0||cc.getTupo()>0)){
					allCard.setSR(allCard.getSR()+1);
				}else if(cc.getQuality()==3&&(cc.getTuponum()>0||cc.getTupo()>0)){
					allCard.setSSR(allCard.getSSR()+1);
				}
			}
		}
	}
	allCard.setCardnum(cardnum);
	WgPlayerserver wg=playerManager.getplayer(wgPlayerserver.getServeruid());
	allCard.setYifunum(wg.getWgPlayerserver7().getAllyifunum());
	String[] ids=wg.getMaxcheckpoint().split(":");
	PlotManager plotManager=PlotManager.getInstance();
	if(ids.length>1){
		Section section=plotManager.getsection(Integer.valueOf(ids[1]));
		if(section!=null){
			String guanka=section.getChapterid()+":"+section.getOrder();
			allCard.setGuanka(guanka);
		}
	}
	allCard.setLevel(wg.getLevel());
	allCard.setUserName(wg.getUsername());
	data.add(allCard);
}
JacksonManager jm = JacksonManager.getInstance();
ObjectNode json = jm.createObjectNode();
json.putPOJO("data", data);
json.putPOJO("total", count);
String result2=jm.toJson(json);
out.print(result2);
%>
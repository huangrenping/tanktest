<%@page import="com.sun.tools.doclets.internal.toolkit.util.DocFinder.Output"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "java.util.ArrayList"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List"%>
<%@ page import = "java.util.Map"%>

<%@ page import = "org.codehaus.jackson.node.ObjectNode"%>

<%@ page import = "com.github.pagehelper.PageHelper"%>

<%@ page import = "tk.mybatis.mapper.entity.Example"%>
<%@ page import = "tk.mybatis.mapper.entity.Example.Criteria"%>
<%@ page import = "web.webSocket.article.ArticleManager"%>
<%@ page import = "web.webSocket.card.CardManager"%>
<%@ page import = "web.webSocket.player.PlayerManager"%>
<%@ page import = "web.webSocket.pojo.WgKnapsack"%>
<%@ page import = "web.webSocket.pojo.WgPlayercard"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver"%>
<%@ page import = "web.webSocket.util.GameServerManager"%>
<%@ page import = "web.webSocket.util.JacksonManager"%>
<%@ page import = "web.webSocket.card.Card"%>

<%!
	public class Userinfo{
		private String playername;
		private int level;
		private String username;
		private int cardnum;
		private int cardnum1;//大于1
		private int cardnum2;//大于5；
		private int daoju1;
		private int daoju2;
		private int daoju3;
		private int daoju4;
		private int n;
		private int r;
		private int sr;
		private int ssr;
		
				private int cardnum10;
		private int cardnum15;
		private int cardnum20;
		private int cardnum25;
		private int cardnum30;
		private int cardnum35;
		private int cardnum40;
		private int cardnum45;
		
		
		
		
		public int getCardnum10() {
			return cardnum10;
		}
		public void setCardnum10(int cardnum10) {
			this.cardnum10 = cardnum10;
		}
		public int getCardnum15() {
			return cardnum15;
		}
		public void setCardnum15(int cardnum15) {
			this.cardnum15 = cardnum15;
		}
		public int getCardnum20() {
			return cardnum20;
		}
		public void setCardnum20(int cardnum20) {
			this.cardnum20 = cardnum20;
		}
		public int getCardnum25() {
			return cardnum25;
		}
		public void setCardnum25(int cardnum25) {
			this.cardnum25 = cardnum25;
		}
		public int getCardnum30() {
			return cardnum30;
		}
		public void setCardnum30(int cardnum30) {
			this.cardnum30 = cardnum30;
		}
		public int getCardnum35() {
			return cardnum35;
		}
		public void setCardnum35(int cardnum35) {
			this.cardnum35 = cardnum35;
		}
		public int getCardnum40() {
			return cardnum40;
		}
		public void setCardnum40(int cardnum40) {
			this.cardnum40 = cardnum40;
		}
		public int getCardnum45() {
			return cardnum45;
		}
		public void setCardnum45(int cardnum45) {
			this.cardnum45 = cardnum45;
		}
		
		public int getN() {
			return n;
		}
		public void setN(int n) {
			this.n = n;
		}
		public int getR() {
			return r;
		}
		public void setR(int r) {
			this.r = r;
		}
		public int getSr() {
			return sr;
		}
		public void setSr(int sr) {
			this.sr = sr;
		}
		public int getSsr() {
			return ssr;
		}
		public void setSsr(int ssr) {
			this.ssr = ssr;
		}
		
		public int getDaoju4() {
			return daoju4;
		}
		public void setDaoju4(int daoju4) {
			this.daoju4 = daoju4;
		}
		public String getPlayername() {
			return playername;
		}
		public void setPlayername(String playername) {
			this.playername = playername;
		}
		public int getLevel() {
			return level;
		}
		public void setLevel(int level) {
			this.level = level;
		}
		public String getUsername() {
			return username;
		}
		public void setUsername(String username) {
			this.username = username;
		}
		public int getCardnum() {
			return cardnum;
		}
		public void setCardnum(int cardnum) {
			this.cardnum = cardnum;
		}
		public int getCardnum1() {
			return cardnum1;
		}
		public void setCardnum1(int cardnum1) {
			this.cardnum1 = cardnum1;
		}
		public int getCardnum2() {
			return cardnum2;
		}
		public void setCardnum2(int cardnum2) {
			this.cardnum2 = cardnum2;
		}
		public int getDaoju1() {
			return daoju1;
		}
		public void setDaoju1(int daoju1) {
			this.daoju1 = daoju1;
		}
		public int getDaoju2() {
			return daoju2;
		}
		public void setDaoju2(int daoju2) {
			this.daoju2 = daoju2;
		}
		public int getDaoju3() {
			return daoju3;
		}
		public void setDaoju3(int daoju3) {
			this.daoju3 = daoju3;
		}
	}
%>
<%
String start = request.getParameter("start");
String end = request.getParameter("end");
String lasttime = request.getParameter("time");
long lastlogintime=Long.valueOf(lasttime);
		PlayerManager playerManager = PlayerManager.getInstance();
		CardManager cardManager = CardManager.getInstance();
		int start1=Integer.valueOf(start);
		int end1 =Integer.valueOf(end);
		GameServerManager gameServerManager=GameServerManager.getInstance();
		int sid=gameServerManager.getServerid();
		Example example1=new Example(WgPlayerserver.class);
		Criteria criteria1 = example1.createCriteria();
		criteria1.andEqualTo("sid", sid);
		criteria1.andGreaterThanOrEqualTo("lastlogintime", lastlogintime);
		int count=playerManager.wgPlayerserverMapper.selectCountByExample(example1);
		
		
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
		
		
		// 拿背包数据；3000004 3000001 3000002 3000003
		List<Integer> listk=new ArrayList<Integer>();
		listk.add(3000004);
		listk.add(3000001);
		listk.add(3000002);
		listk.add(3000003);
		
		Example example2=new Example(WgKnapsack.class);
		example2.createCriteria().andEqualTo("del", 0).andIn("serveruid", uidlist).andIn("aid", listk);
		List<WgKnapsack> allknapsack=ArticleManager.getInstance().getWgKnapsackMapper().selectByExample(example2);
		
		
		
		
		Map<Long,Map<Integer,Integer>> mapk=new HashMap<Long, Map<Integer,Integer>>();
		
		
		for (WgKnapsack wgKnapsack : allknapsack) { 
		    if(wgKnapsack.getServeruid()==1000100000000609l){
		     //out.println(wgKnapsack.getAid()+"----"+wgKnapsack.getNum()+"<br>");
		    }
		   
			Map<Integer,Integer> mapone=mapk.get(wgKnapsack.getServeruid());
			if(mapone==null){
				mapone=new HashMap<Integer, Integer>();
				mapk.put(wgKnapsack.getServeruid(), mapone);
			};
			mapone.put(wgKnapsack.getAid(), wgKnapsack.getNum());
		}
		
		List<Userinfo>  listall=new ArrayList<Userinfo>();

		for (WgPlayerserver wgPlayerserver : selectlimitbyonlintime) {
		 	int cardnum=0;
			int cardnum1=0;
			int cardnum2=0;
			int cardnum10=0;
			int cardnum15=0;
			int cardnum20=0;
			int cardnum25=0;
			int cardnum30=0;
			int cardnum35=0;
			int cardnum40=0;
			int cardnum45=0;
			int n=0;
			int r=0;
			int sr=0;
			int ssr=0;
			Userinfo userinfo=new Userinfo();
			uidlist.add(wgPlayerserver.getServeruid());
			List<WgPlayercard> listcard =selectallCard.get(wgPlayerserver.getServeruid());
			if(listcard==null){
				continue;
			}
			cardnum++;
					for (WgPlayercard wgPlayercard : listcard) {
				if (wgPlayercard != null) {
					Card ca=cardManager.getcardone(wgPlayercard.getCardid());
					if(ca.getQuality()==0){
						n++;
					}
					if(ca.getQuality()==1){
						r++;
					}
					if(ca.getQuality()==2){
						sr++;
					}
					if(ca.getQuality()==3){
						ssr++;
					}
					
					
					if(wgPlayercard.getGrade()>1 && wgPlayercard.getGrade()<=5){
						cardnum1++;
					}
					if(wgPlayercard.getGrade()>5 && wgPlayercard.getGrade()<=10){
						cardnum2++;
					}
					if(wgPlayercard.getGrade()>10 && wgPlayercard.getGrade()<=15){
						cardnum10++;
					}
					if(wgPlayercard.getGrade()>15 && wgPlayercard.getGrade()<=20){
						cardnum15++;
					}
					if(wgPlayercard.getGrade()>20 && wgPlayercard.getGrade()<=25){
						cardnum20++;
					}
					if(wgPlayercard.getGrade()>25 && wgPlayercard.getGrade()<=30){
						cardnum25++;
					}
					if(wgPlayercard.getGrade()>30 && wgPlayercard.getGrade()<=35){
						cardnum30++;
					}
					if(wgPlayercard.getGrade()>35 && wgPlayercard.getGrade()<=40){
						cardnum35++;
					}
					if(wgPlayercard.getGrade()>40 && wgPlayercard.getGrade()<=45){
						cardnum40++;
					}
					if(wgPlayercard.getGrade()>45){
						cardnum45++;
					}	
				}
			}
			userinfo.setN(n);
			userinfo.setR(r);
			userinfo.setSr(sr);
			userinfo.setSsr(ssr);
			
			Map<Integer,Integer> mapuserone=mapk.get(wgPlayerserver.getServeruid());
			if(mapuserone!=null){
				if(mapuserone.get(3000004)!=null){
					userinfo.setDaoju1(mapuserone.get(3000004));
				}
				if(mapuserone.get(3000001)!=null){
					userinfo.setDaoju2(mapuserone.get(3000001));
				}
				if(mapuserone.get(3000002)!=null){
					userinfo.setDaoju3(mapuserone.get(3000002));
				}
				if(mapuserone.get(3000003)!=null){
					userinfo.setDaoju4(mapuserone.get(3000003));
				}
			}
			userinfo.setCardnum(cardnum);
			userinfo.setCardnum1(cardnum1);
			userinfo.setCardnum2(cardnum2);
			userinfo.setCardnum10(cardnum10);
			userinfo.setCardnum15(cardnum15);
			userinfo.setCardnum20(cardnum20);
			userinfo.setCardnum25(cardnum25);
			userinfo.setCardnum30(cardnum30);
			userinfo.setCardnum35(cardnum35);
			userinfo.setCardnum40(cardnum40);
			userinfo.setCardnum45(cardnum45);
			
			
			
			
			WgPlayerserver wg=playerManager.getplayer(wgPlayerserver.getServeruid());
			userinfo.setPlayername(wg.getPlayername());
			userinfo.setLevel(wg.getLevel());
			userinfo.setUsername(wg.getUsername());
			listall.add(userinfo);
		}
		JacksonManager jm = JacksonManager.getInstance();
		ObjectNode json = jm.createObjectNode();
		json.putPOJO("data", listall);
		json.putPOJO("total", count);
		String result2=jm.toJson(json);
		out.println(result2);
		
		
		
%>
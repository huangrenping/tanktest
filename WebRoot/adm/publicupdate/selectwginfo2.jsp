<%@page import="web.webSocket.card.CardManager"%>
<%@page import="web.webSocket.rightdress.RightdressManager"%>
<%@page import="web.webSocket.article.ArticleManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="web.webSocket.player.PlayerManager,
    java.util.*,
    net.sf.json.JSONArray,
    web.webSocket.util.MD5Util,
    net.sf.json.JsonConfig,
	web.webSocket.util.JacksonManager,
	org.codehaus.jackson.node.ObjectNode,
	web.webSocket.util.Util,
	web.webSocket.activity.WgPlayerservernew,
	web.webSocket.common.Publicmain,
	web.webSocket.mail.MailManager,
	web.webSocket.player.PlayerManager,
	web.webSocket.lovetree.Lovetree,
	web.webSocket.login.LoginManager,
	web.webSocket.arena.ArenaManager,
	web.webSocket.util.JacksonManager,
	org.codehaus.jackson.node.ObjectNode,
	web.webSocket.lovetree.Treefruit,
	web.webSocket.lovetree.LovetreeManager,
	web.webSocket.article.Article,
	web.webSocket.arena.Arenaplayer,
	web.webSocket.rightdress.Part,
	web.webSocket.card.Wgcard,
	web.webSocket.plotone.Plotone,
	web.webSocket.pojo.*,
	web.webSocket.material.MaterialConst,
	web.webSocket.util.GameServerManager"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
    <%!
    	public class AAA {

		private int uid;//id
		private String username;//账号
		private String playname;//用户名
		
		private int toufanum;//总数量
		private int onestartoufanum;//1星
		private int twostartoufanum;//2星
		private int threestartoufanum;//3星
		private int fourstartoufanum;//4星
		private int fivestartoufanum;//5星
		
		private int liannum;
		private int onestarliannum;//1星
		private int twostarliannum;//2星
		private int threestarliannum;//3星
		private int fourstarliannum;//4星
		private int fivestarliannum;//5星
		
		private int yifunum;
		private int onestaryifunum;//1星
		private int twostaryifunum;//2星
		private int threestaryifunum;//3星
		private int fourstaryifunum;//4星
		private int fivestaryifunum;//5星
		
		private int toushinum;
		private int onestartoushinum;//1星
		private int twostartoushinum;//2星
		private int threestartoushinum;//3星
		private int fourstartoushinum;//4星
		private int fivestartoushinum;//5星
		
		private int ershinum;
		private int onestarershinum;//1星
		private int twostarershinum;//2星
		private int threestarershinum;//3星
		private int fourstarershinum;//4星
		private int fivestarershinum;//5星
		
		private int xiangliannum;
		private int onestarxiangliannum;//1星
		private int twostarxiangliannum;//2星
		private int threestarxiangliannum;//3星
		private int fourstarxiangliannum;//4星
		private int fivestarxiangliannum;//5星
		
		
		private int xiezinum;
		private int onestarxiezinum;//1星
		private int twostarxiezinum;//2星
		private int threestarxiezinum;//3星
		private int fourstarxiezinum;//4星
		private int fivestarxiezinum;//5星
		

		
		private int beijingnum;
		private int onestarbeijingnum;//1星
		private int twostarbeijingnum;//2星
		private int threestarbeijingnum;//3星
		private int fourstarbeijingnum;//4星
		private int fivestarbeijingnum;//5星
		
		private int rnum;//r卡数量
		private int srnum;//sr卡数量
		private int ssrnum;//ssr卡数量
		
		private int yuehuinum;//约会开启的数量
		
		private int taozhuangnum;//套装数量
		
		private String taozhuanginfo;//套装id
		
		public int getTaozhuangnum() {
			return taozhuangnum;
		}

		public void setTaozhuangnum(int taozhuangnum) {
			this.taozhuangnum = taozhuangnum;
		}

		public int getUid() {
			return uid;
		}

		public void setUid(int uid) {
			this.uid = uid;
		}

		public String getUsername() {
			return username;
		}

		public void setUsername(String username) {
			this.username = username;
		}

		public String getPlayname() {
			return playname;
		}

		public void setPlayname(String playname) {
			this.playname = playname;
		}

		public int getToufanum() {
			return toufanum;
		}

		public void setToufanum(int toufanum) {
			this.toufanum = toufanum;
		}

		public int getOnestartoufanum() {
			return onestartoufanum;
		}

		public void setOnestartoufanum(int onestartoufanum) {
			this.onestartoufanum = onestartoufanum;
		}

		public int getTwostartoufanum() {
			return twostartoufanum;
		}

		public void setTwostartoufanum(int twostartoufanum) {
			this.twostartoufanum = twostartoufanum;
		}

		public int getThreestartoufanum() {
			return threestartoufanum;
		}

		public void setThreestartoufanum(int threestartoufanum) {
			this.threestartoufanum = threestartoufanum;
		}

		public int getFourstartoufanum() {
			return fourstartoufanum;
		}

		public void setFourstartoufanum(int fourstartoufanum) {
			this.fourstartoufanum = fourstartoufanum;
		}

		public int getFivestartoufanum() {
			return fivestartoufanum;
		}

		public void setFivestartoufanum(int fivestartoufanum) {
			this.fivestartoufanum = fivestartoufanum;
		}

		public int getLiannum() {
			return liannum;
		}

		public void setLiannum(int liannum) {
			this.liannum = liannum;
		}

		public int getOnestarliannum() {
			return onestarliannum;
		}

		public void setOnestarliannum(int onestarliannum) {
			this.onestarliannum = onestarliannum;
		}

		public int getTwostarliannum() {
			return twostarliannum;
		}

		public void setTwostarliannum(int twostarliannum) {
			this.twostarliannum = twostarliannum;
		}

		public int getThreestarliannum() {
			return threestarliannum;
		}

		public void setThreestarliannum(int threestarliannum) {
			this.threestarliannum = threestarliannum;
		}

		public int getFourstarliannum() {
			return fourstarliannum;
		}

		public void setFourstarliannum(int fourstarliannum) {
			this.fourstarliannum = fourstarliannum;
		}

		public int getFivestarliannum() {
			return fivestarliannum;
		}

		public void setFivestarliannum(int fivestarliannum) {
			this.fivestarliannum = fivestarliannum;
		}

		public int getYifunum() {
			return yifunum;
		}

		public void setYifunum(int yifunum) {
			this.yifunum = yifunum;
		}

		public int getOnestaryifunum() {
			return onestaryifunum;
		}

		public void setOnestaryifunum(int onestaryifunum) {
			this.onestaryifunum = onestaryifunum;
		}

		public int getTwostaryifunum() {
			return twostaryifunum;
		}

		public void setTwostaryifunum(int twostaryifunum) {
			this.twostaryifunum = twostaryifunum;
		}

		public int getThreestaryifunum() {
			return threestaryifunum;
		}

		public void setThreestaryifunum(int threestaryifunum) {
			this.threestaryifunum = threestaryifunum;
		}

		public int getFourstaryifunum() {
			return fourstaryifunum;
		}

		public void setFourstaryifunum(int fourstaryifunum) {
			this.fourstaryifunum = fourstaryifunum;
		}

		public int getFivestaryifunum() {
			return fivestaryifunum;
		}

		public void setFivestaryifunum(int fivestaryifunum) {
			this.fivestaryifunum = fivestaryifunum;
		}

		public int getToushinum() {
			return toushinum;
		}

		public void setToushinum(int toushinum) {
			this.toushinum = toushinum;
		}

		public int getOnestartoushinum() {
			return onestartoushinum;
		}

		public void setOnestartoushinum(int onestartoushinum) {
			this.onestartoushinum = onestartoushinum;
		}

		public int getTwostartoushinum() {
			return twostartoushinum;
		}

		public void setTwostartoushinum(int twostartoushinum) {
			this.twostartoushinum = twostartoushinum;
		}

		public int getThreestartoushinum() {
			return threestartoushinum;
		}

		public void setThreestartoushinum(int threestartoushinum) {
			this.threestartoushinum = threestartoushinum;
		}

		public int getFourstartoushinum() {
			return fourstartoushinum;
		}

		public void setFourstartoushinum(int fourstartoushinum) {
			this.fourstartoushinum = fourstartoushinum;
		}

		public int getFivestartoushinum() {
			return fivestartoushinum;
		}

		public void setFivestartoushinum(int fivestartoushinum) {
			this.fivestartoushinum = fivestartoushinum;
		}

		public int getErshinum() {
			return ershinum;
		}

		public void setErshinum(int ershinum) {
			this.ershinum = ershinum;
		}

		public int getOnestarershinum() {
			return onestarershinum;
		}

		public void setOnestarershinum(int onestarershinum) {
			this.onestarershinum = onestarershinum;
		}

		public int getTwostarershinum() {
			return twostarershinum;
		}

		public void setTwostarershinum(int twostarershinum) {
			this.twostarershinum = twostarershinum;
		}

		public int getThreestarershinum() {
			return threestarershinum;
		}

		public void setThreestarershinum(int threestarershinum) {
			this.threestarershinum = threestarershinum;
		}

		public int getFourstarershinum() {
			return fourstarershinum;
		}

		public void setFourstarershinum(int fourstarershinum) {
			this.fourstarershinum = fourstarershinum;
		}

		public int getFivestarershinum() {
			return fivestarershinum;
		}

		public void setFivestarershinum(int fivestarershinum) {
			this.fivestarershinum = fivestarershinum;
		}

		public int getXiangliannum() {
			return xiangliannum;
		}

		public void setXiangliannum(int xiangliannum) {
			this.xiangliannum = xiangliannum;
		}

		public int getOnestarxiangliannum() {
			return onestarxiangliannum;
		}

		public void setOnestarxiangliannum(int onestarxiangliannum) {
			this.onestarxiangliannum = onestarxiangliannum;
		}

		public int getTwostarxiangliannum() {
			return twostarxiangliannum;
		}

		public void setTwostarxiangliannum(int twostarxiangliannum) {
			this.twostarxiangliannum = twostarxiangliannum;
		}

		public int getThreestarxiangliannum() {
			return threestarxiangliannum;
		}

		public void setThreestarxiangliannum(int threestarxiangliannum) {
			this.threestarxiangliannum = threestarxiangliannum;
		}

		public int getFourstarxiangliannum() {
			return fourstarxiangliannum;
		}

		public void setFourstarxiangliannum(int fourstarxiangliannum) {
			this.fourstarxiangliannum = fourstarxiangliannum;
		}

		public int getFivestarxiangliannum() {
			return fivestarxiangliannum;
		}

		public void setFivestarxiangliannum(int fivestarxiangliannum) {
			this.fivestarxiangliannum = fivestarxiangliannum;
		}

		public int getXiezinum() {
			return xiezinum;
		}

		public void setXiezinum(int xiezinum) {
			this.xiezinum = xiezinum;
		}

		public int getOnestarxiezinum() {
			return onestarxiezinum;
		}

		public void setOnestarxiezinum(int onestarxiezinum) {
			this.onestarxiezinum = onestarxiezinum;
		}

		public int getTwostarxiezinum() {
			return twostarxiezinum;
		}

		public void setTwostarxiezinum(int twostarxiezinum) {
			this.twostarxiezinum = twostarxiezinum;
		}

		public int getThreestarxiezinum() {
			return threestarxiezinum;
		}

		public void setThreestarxiezinum(int threestarxiezinum) {
			this.threestarxiezinum = threestarxiezinum;
		}

		public int getFourstarxiezinum() {
			return fourstarxiezinum;
		}

		public void setFourstarxiezinum(int fourstarxiezinum) {
			this.fourstarxiezinum = fourstarxiezinum;
		}

		public int getFivestarxiezinum() {
			return fivestarxiezinum;
		}

		public void setFivestarxiezinum(int fivestarxiezinum) {
			this.fivestarxiezinum = fivestarxiezinum;
		}

		public String getTaozhuanginfo() {
			return taozhuanginfo;
		}

		public void setTaozhuanginfo(String taozhuanginfo) {
			this.taozhuanginfo = taozhuanginfo;
		}

		public int getBeijingnum() {
			return beijingnum;
		}

		public void setBeijingnum(int beijingnum) {
			this.beijingnum = beijingnum;
		}

		public int getOnestarbeijingnum() {
			return onestarbeijingnum;
		}

		public void setOnestarbeijingnum(int onestarbeijingnum) {
			this.onestarbeijingnum = onestarbeijingnum;
		}

		public int getTwostarbeijingnum() {
			return twostarbeijingnum;
		}

		public void setTwostarbeijingnum(int twostarbeijingnum) {
			this.twostarbeijingnum = twostarbeijingnum;
		}

		public int getThreestarbeijingnum() {
			return threestarbeijingnum;
		}

		public void setThreestarbeijingnum(int threestarbeijingnum) {
			this.threestarbeijingnum = threestarbeijingnum;
		}

		public int getFourstarbeijingnum() {
			return fourstarbeijingnum;
		}

		public void setFourstarbeijingnum(int fourstarbeijingnum) {
			this.fourstarbeijingnum = fourstarbeijingnum;
		}

		public int getFivestarbeijingnum() {
			return fivestarbeijingnum;
		}

		public void setFivestarbeijingnum(int fivestarbeijingnum) {
			this.fivestarbeijingnum = fivestarbeijingnum;
		}

		public int getRnum() {
			return rnum;
		}

		public void setRnum(int rnum) {
			this.rnum = rnum;
		}

		public int getSrnum() {
			return srnum;
		}

		public void setSrnum(int srnum) {
			this.srnum = srnum;
		}

		public int getSsrnum() {
			return ssrnum;
		}

		public void setSsrnum(int ssrnum) {
			this.ssrnum = ssrnum;
		}

		public int getYuehuinum() {
			return yuehuinum;
		}

		public void setYuehuinum(int yuehuinum) {
			this.yuehuinum = yuehuinum;
		}
}
     %> 
<%
String type=request.getParameter("type");
String id=request.getParameter("id");
String serveruid=request.getParameter("serveruid");
String articleandnum=request.getParameter("articleandnum");
String mark=request.getParameter("mark");
String replypeople=request.getParameter("replypeople");
PlayerManager playerManager=PlayerManager.getInstance();
int result=playerManager.resultjspkey(type);
if("".equals(type)||type==null){
}else if(result==1){
		GameServerManager gameServerManager=GameServerManager.getInstance();
		//String[] wguidarray={"1000100000002575","1000100000000756","1000100000002276","1000100000002009"};
		 String[] wguidarray={"1071000000000154","1071000000001332","1071000000000404","1071000000000914",
						     "1071000000001731","1071000000002021"};
		RightdressManager rightdressManager=RightdressManager.getInstance();
		CardManager cardManager=CardManager.getInstance();
		
		
		List<AAA> list=new ArrayList<AAA>();
		 for(int i=0;i<wguidarray.length;i++){
			WgPlayerserver player=playerManager.getplayer(Long.valueOf(wguidarray[i]));
			if(player==null){
				continue;
			}
			//System.out.println("player.getPlayername()===="+player.getPlayername());
			AAA a=new AAA();
			WgRightdress wgRightdress=player.getWgRightdress();
			a.setPlayname(player.getPlayername());
			a.setUsername(player.getUsername());
			//查套
			int taozhuangnum=0;
			String taozhuanginfo="";
			//拥有套装 1:0:1@2@3,2:1:4@5@6  套装id:奖励是否领取:套装部件id@套装部件id@套装部件id
			String suitids=wgRightdress.getSuitids();
			if(suitids!=null && !suitids.equals("")){
				String[] suitids2=suitids.split(",");
				for(int k=0;k<suitids2.length;k++){
					String[] suitids3=suitids2[k].split(":");
					if(Integer.valueOf(suitids3[1])>0){
						taozhuangnum++;
						taozhuanginfo+=suitids3[0]+",";
					}
				}
			}
			if(taozhuanginfo!=null && !taozhuanginfo.equals("")){
				if(taozhuanginfo.substring(taozhuanginfo.length()-1, taozhuanginfo.length()).equals(",")){
					taozhuanginfo=taozhuanginfo.substring(0, taozhuanginfo.length()-1);
				}
			}
			a.setTaozhuangnum(taozhuangnum);
			a.setTaozhuanginfo(taozhuanginfo);
			
			String rightdresss=wgRightdress.getRightdresss();
			if(rightdresss!=null && !rightdresss.equals("")){
				String[] rightdresss2=rightdresss.split(",");
				for(int j=0;j<rightdresss2.length;j++){
					Part part=rightdressManager.getone(Integer.valueOf(rightdresss2[j]));
					if(part!=null){
						if(part.getSecondtype()==0){
							//脸
							int rating = MaterialConst.getObject(
								part.getSecondtype(), part.getScore());
							if(rating==1){
								a.setOnestarliannum(a.getOnestarliannum()+1);
							}
							if(rating==2){
								a.setTwostarliannum(a.getTwostarliannum()+1);
							}
							if(rating==3){
								a.setThreestarliannum(a.getThreestarliannum()+1);
							}
							if(rating==4){
								a.setFourstarliannum(a.getFourstarliannum()+1);
							}
							if(rating==5){
								a.setFivestarliannum(a.getFivestarliannum()+1);
							}
						}
						if(part.getSecondtype()==1){
							//鞋子
							int rating = MaterialConst.getObject(
								part.getSecondtype(), part.getScore());
							if(rating==1){
								a.setOnestarxiezinum(a.getOnestarxiezinum()+1);
							}
							if(rating==2){
								a.setTwostarxiezinum(a.getTwostarxiezinum()+1);
							}
							if(rating==3){
								a.setThreestarxiezinum(a.getThreestarxiezinum()+1);
							}
							if(rating==4){
								a.setFourstarxiezinum(a.getFourstarxiezinum()+1);
							}
							if(rating==5){
								a.setFivestarxiezinum(a.getFivestarxiezinum()+1);
							}
						}
						if(part.getSecondtype()==2){
							//衣服
							int rating = MaterialConst.getObject(
								part.getSecondtype(), part.getScore());
							if(rating==1){
								a.setOnestaryifunum(a.getOnestaryifunum()+1);
							}
							if(rating==2){
								a.setTwostaryifunum(a.getTwostaryifunum()+1);
							}
							if(rating==3){
								a.setThreestaryifunum(a.getThreestaryifunum()+1);
							}
							if(rating==4){
								a.setFourstaryifunum(a.getFourstaryifunum()+1);
							}
							if(rating==5){
								a.setFivestaryifunum(a.getFivestaryifunum()+1);
							}
						}
						if(part.getSecondtype()==3){
							//耳环
							int rating = MaterialConst.getObject(
								part.getSecondtype(), part.getScore());
							if(rating==1){
								a.setOnestarershinum(a.getOnestarershinum()+1);
							}
							if(rating==2){
								a.setTwostarershinum(a.getTwostarershinum()+1);
							}
							if(rating==3){
								a.setThreestarershinum(a.getThreestarershinum()+1);
							}
							if(rating==4){
								a.setFourstarershinum(a.getFourstarershinum()+1);
							}
							if(rating==5){
								a.setFivestarershinum(a.getFivestarershinum()+1);
							}
						}
						if(part.getSecondtype()==4){
							//项链
							int rating = MaterialConst.getObject(
								part.getSecondtype(), part.getScore());
							if(rating==1){
								a.setOnestarxiangliannum(a.getOnestarxiangliannum()+1);
							}
							if(rating==2){
								a.setTwostarxiangliannum(a.getTwostarxiangliannum()+1);
							}
							if(rating==3){
								a.setThreestarxiangliannum(a.getThreestarxiangliannum()+1);
							}
							if(rating==4){
								a.setFourstarxiangliannum(a.getFourstarxiangliannum()+1);
							}
							if(rating==5){
								a.setFivestarxiangliannum(a.getFivestarxiangliannum()+1);
							}
						}
						if(part.getSecondtype()==5){
							//头发
							int rating = MaterialConst.getObject(
								part.getSecondtype(), part.getScore());
							if(rating==1){
								a.setOnestartoufanum(a.getOnestartoufanum()+1);
							}
							if(rating==2){
								a.setTwostartoufanum(a.getTwostartoufanum()+1);
							}
							if(rating==3){
								a.setThreestartoufanum(a.getThreestartoufanum()+1);
							}
							if(rating==4){
								a.setFourstartoufanum(a.getFourstartoufanum()+1);
							}
							if(rating==5){
								a.setFivestartoufanum(a.getFivestartoufanum()+1);
							}
						}
						if(part.getSecondtype()==6){
							//头饰
							int rating = MaterialConst.getObject(
								part.getSecondtype(), part.getScore());
							if(rating==1){
								a.setOnestartoushinum(a.getOnestartoushinum()+1);
							}
							if(rating==2){
								a.setTwostartoushinum(a.getTwostartoushinum()+1);
							}
							if(rating==3){
								a.setThreestartoushinum(a.getThreestartoushinum()+1);
							}
							if(rating==4){
								a.setFourstartoushinum(a.getFourstartoushinum()+1);
							}
							if(rating==5){
								a.setFivestartoushinum(a.getFivestartoushinum()+1);
							}
						}
						if(part.getSecondtype()==7){
							//背景
							int rating = MaterialConst.getObject(
								part.getSecondtype(), part.getScore());
							if(rating==1){
								a.setOnestarbeijingnum(a.getOnestarbeijingnum()+1);
							}
							if(rating==2){
								a.setTwostarbeijingnum(a.getTwostarbeijingnum()+1);
							}
							if(rating==3){
								a.setThreestarbeijingnum(a.getThreestarbeijingnum()+1);
							}
							if(rating==4){
								a.setFourstarbeijingnum(a.getFourstarbeijingnum()+1);
							}
							if(rating==5){
								a.setFivestarbeijingnum(a.getFivestarbeijingnum()+1);
							}
						}
					}
				}
			}
			//衣服查询完毕，查询卡牌
				int rnum=0;
				int srnum=0;
				int ssrnum=0;
				Wgcard wgcard=player.getCard();
				List<WgPlayercard> listwgcard=wgcard.getWgcardlist();
				for(int k=0;k<listwgcard.size();k++){
					WgPlayercard wgPlayercard=listwgcard.get(k);
					if(wgPlayercard.getType()==0){
						int quality=cardManager.getcardone(wgPlayercard.getCardid()).getQuality();
						if(quality==1){
							rnum++;
						}else if(quality==2){
							srnum++;
						}else if(quality==3){
							ssrnum++;
						}
					}
				}
				a.setRnum(rnum);
				a.setSrnum(srnum);
				a.setSsrnum(ssrnum);
				
				//查询开放剧情
				Plotone plotone=player.getPlotone();
				List<WgPlotchapterapt> listchapterapt=plotone.getListchapter();
				int opennum=0;
				for(int k=0;k<listchapterapt.size();k++){
					WgPlotchapterapt wgPlotchapterapt=listchapterapt.get(k);
					opennum+=wgPlotchapterapt.getOpen();
				}
				a.setYuehuinum(opennum);
				a.setUid(gameServerManager.getServerid());
				list.add(a);
		}
		
		JacksonManager jm = JacksonManager.getInstance();
		ObjectNode json = jm.createObjectNode();
		json.putPOJO("data", list);
		String result2=jm.toJson(json);
 		out.print(result2);
		
		
		int serveruid2=gameServerManager.getServerid();
		out.print(serveruid2+"区部分玩家信息查询完毕！");
}	
%>
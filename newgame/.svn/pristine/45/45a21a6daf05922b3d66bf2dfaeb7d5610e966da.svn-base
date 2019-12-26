<%@ page language="java"
	import="java.util.*,
com.google.gson.Gson,web.webSocket.pojo.*,
web.webSocket.util.*,web.webSocket.card.*,
web.webSocket.article.ArticleManager,
web.webSocket.mapper.WgPlayerserverMapper,
web.webSocket.entity.*,
web.webSocket.util.JacksonManager,
org.codehaus.jackson.node.ObjectNode,
com.github.pagehelper.PageHelper,
tk.mybatis.mapper.entity.Example,
tk.mybatis.mapper.entity.Example.Criteria,
web.webSocket.player.PlayerManager"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%
	PlayerManager playerManager = PlayerManager.getInstance();
	int type = Integer.valueOf(request.getParameter("type"));
	if (type == 0) {
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		int start1 = Integer.valueOf(start);
		int end1 = Integer.valueOf(end);
		List<PlayerAndAllCard> data = new ArrayList<PlayerAndAllCard>();
		List<PlayerAndAllPlotStar> allPlotStars = new ArrayList<PlayerAndAllPlotStar>();
		List<WgDatatongji> selectByExample = null;
		GameServerManager gameServerManager = GameServerManager.getInstance();
		int sid = gameServerManager.getServerid();
		PageHelper.startPage(start1, end1);
		Example wg7example = new Example(WgPlayerserver7.class);
		wg7example.setOrderByClause("maxcheckpoint desc");
		Criteria wg7criteria = wg7example.createCriteria();
		wg7criteria.andEqualTo("sid", sid);
		List<WgPlayerserver7> selectlimit = playerManager.wgPlayerserver7Mapper.selectByExample(wg7example);
		WgPlayerserver7 wgPlayerserver7 = new WgPlayerserver7();
		wgPlayerserver7.setSid(sid);
		int selectCount = playerManager.wgPlayerserver7Mapper.selectCount(wgPlayerserver7);
		List<Long> uids = new ArrayList<Long>();
		for (WgPlayerserver7 wg7 : selectlimit) {
			uids.add(wg7.getUid());
		}
		Example example = new Example(WgDatatongji.class);
		Criteria criteria = example.createCriteria();
		criteria.andIn("serveruid", uids);
		selectByExample = playerManager.wgDatatongjiMapper.selectByExample(example);
		if (selectByExample == null || selectByExample.size() < selectlimit.size()) {
			selectByExample = new ArrayList<WgDatatongji>();
			for (WgPlayerserver7 wg7 : selectlimit) {
				WgPlayerserver getplayer = PlayerManager.getInstance().getplayer(wg7.getUid());
				if (getplayer == null) {
					continue;
				}
				WgDatatongji dataPlotStarTongji = getplayer.dataPlotStarTongji();
				selectByExample.add(dataPlotStarTongji);
				getplayer.setWgDatatongji(null);
			}
		}
		for (WgDatatongji wgdata : selectByExample) {
			PlayerAndAllPlotStar allPlotStar = new PlayerAndAllPlotStar();
			WgPlayerserver getplayer = playerManager.getplayer(wgdata.getServeruid());
			allPlotStar.setPlayerName(getplayer.getPlayername());
			allPlotStar.setUid(getplayer.getUid());
			allPlotStar.setPlotStar(wgdata.getPlotstartongjimap());
			allPlotStar.setMaxplotnum(getplayer.getWgPlayerserver7().getMaxcheckpoint());
			allPlotStars.add(allPlotStar);
		}
		Collections.sort(allPlotStars, new Comparator<PlayerAndAllPlotStar>(){
			@Override
			public int compare(PlayerAndAllPlotStar o1, PlayerAndAllPlotStar o2) {
				int result=o2.getMaxplotnum()-o1.getMaxplotnum();
				return result;
			}
    	});
		JacksonManager jm = JacksonManager.getInstance();
		ObjectNode json = jm.createObjectNode();
		json.putPOJO("data", allPlotStars);
		json.putPOJO("total", selectCount);
		String result2 = jm.toJson(json);
		out.print(result2);
	}
	if (type == 1) {
		request.setCharacterEncoding("UTF-8");
		String playername = request.getParameter("playername");
		long palyerid=0l;
		if(playerManager.getplayerid(playername)!=null){
			palyerid=playerManager.getplayerid(playername);
		}else{
			String newNmae=new String(playername.getBytes("iso-8859-1"),"utf-8");
			if(playerManager.getplayerid(newNmae)!=null){
				palyerid=playerManager.getplayerid(newNmae);
			}
		}
		if(palyerid==0){
			out.print("查无此人");
			return;
		}
		WgPlayerserver getplayer = playerManager.getplayer(palyerid);
		if(getplayer==null){
			out.print("查无此人");
		}
		List<PlayerAndAllPlotStar> allPlotStarlist = new ArrayList<PlayerAndAllPlotStar>();
		PlayerAndAllPlotStar wgplotStar=new PlayerAndAllPlotStar();
		WgDatatongji datatongji = getplayer.dataPlotStarTongji();
		wgplotStar.setPlayerName(getplayer.getPlayername());
		wgplotStar.setUid(getplayer.getUid());
		wgplotStar.setPlotStar(datatongji.getPlotstartongjimap());
		wgplotStar.setMaxplotnum(getplayer.getWgPlayerserver7().getMaxcheckpoint());
		allPlotStarlist.add(wgplotStar);
		JacksonManager jm = JacksonManager.getInstance();
		ObjectNode json = jm.createObjectNode();
		json.putPOJO("data", allPlotStarlist);
		json.putPOJO("total", 1);
		String result = jm.toJson(json);
		out.print(result);
	}
%>
<%@ page language="java"
	import="java.util.*,
com.google.gson.Gson,web.webSocket.pojo.*,
web.webSocket.util.*,web.webSocket.card.*,
web.webSocket.article.ArticleManager,
web.webSocket.mapper.WgPlayerserverMapper,
web.webSocket.player.PlayerManager"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<%
	String username = request.getParameter("username");
	//String username = "C2280U9258921";
	WgPlayerserver wp = new WgPlayerserver();
	wp.setUsername(username);
	wp.setSid(GameServerManager.getInstance().getServerid());
	ArticleManager articleManager = ArticleManager.getInstance();
	//WgPlayerserverMapper wgPlayerserverMapper = articleManager.getWgPlayerserverMapper();
	//WgPlayerserver player = wgPlayerserverMapper.selectOne(wp);
	Long playerid=PlayerManager.getInstance().getplayerid(username);
	if(playerid==null){
	out.println("找不到这个玩家！");
	return ;
	}
	WgPlayerserver player=PlayerManager.getInstance().getplayer(playerid);
	if (player != null) {
		List<CardClient> list = new ArrayList<CardClient>();
		Wgcard wgcard = player.getCard();
		List<WgPlayercard> listcard = wgcard.getWgcardlist();
		CardManager cardManager = CardManager.getInstance();
		for (WgPlayercard wgPlayercard : listcard) {
			if (wgPlayercard != null) {
				CardClient cc = new CardClient();
				if (wgPlayercard.getType() == 0) {
					if (cc.getId() == 51003 || cc.getId() == 51004 || cc.getId() == 51005) {
						continue;
					}
					cc = cardManager.addcardclient(wgPlayercard, wgcard.getIdlist());
					list.add(cc);
				}
			}
		}
		String listStr = new Gson().toJson(list);
		request.setAttribute("cardlist", list);
	}
%>
<html>
<body>
	<table width="50%" style="text-align: center;" border="0" width="200" cellspacing="1"
cellpadding="0" bgcolor="#000000">
		<tr align="center"
bgcolor="#FFFFFF">
			<th>编号</th>
			<th>name</th>
			<th>质量</th>
			<th>当前star</th>
			<th>当前等级</th>
			<th>可升最大等级</th>
		</tr>
		<c:forEach var="card" items="${cardlist }">
			<tr align="center"
bgcolor="#FFFFFF">
				<td>${card.id }</td>
				<td>${card.name }</td>
				<td>${card.quality }</td>
				<td>${card.star }</td>
				<td>${card.grade }</td>
				<td>${card.maxgrade }</td>
				</tr>
		</c:forEach>
	</table>

</body>
</html>
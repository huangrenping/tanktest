<%@ page language="java" import="java.util.*,web.webSocket.player.PlayerManager,web.webSocket.pojo.WgPlayerserver" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'onwg.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <%
  PlayerManager playerManager=PlayerManager.getInstance();
	Collection<WgPlayerserver> wgplaylist=playerManager.getIdplayermap().values();
	List<WgPlayerserver> wglist=new ArrayList<WgPlayerserver>();
	for (WgPlayerserver wgPlayerserver : wgplaylist) {
		if(wgPlayerserver.isIslogin()==true){
			WgPlayerserver wg=wgPlayerserver;
			if(wg.getUsername().equals("-1") || wg.getUsername().equals("-2")){
				continue;
			}
			wglist.add(wg);
		}
	}
	int size = wglist.size();
	request.setAttribute("onwgsize", size);
  %>
  <body>
   玩家在线人数： ${onwgsize} <br>
  </body>
</html>

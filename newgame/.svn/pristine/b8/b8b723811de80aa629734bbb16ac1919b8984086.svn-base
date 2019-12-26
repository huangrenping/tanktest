<%@ page language="java"
	import="web.webSocket.player.PlayerManager,
	web.webSocket.pojo.WgPlayerserver7,
	web.webSocket.pojo.WgPlayerserver,
	web.webSocket.util.Util,
java.util.*"
	pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%

String change=request.getParameter("change");
if(change!=null&&change.equals("true")){
	PlayerManager playerManager = PlayerManager.getInstance();
	Hashtable<Long, WgPlayerserver> mapplayer=playerManager.getIdplayermap();
	List<WgPlayerserver> listwgplayers=null;
	Collection<WgPlayerserver> wplist=mapplayer.values();
	listwgplayers=new ArrayList<WgPlayerserver>();
	listwgplayers.addAll(wplist);
	synchronized (listwgplayers) {
		for (WgPlayerserver wgPlayerserver : listwgplayers) {
			WgPlayerserver7 wg7=wgPlayerserver.getWgPlayerserver7();
			String str=wg7.getRechargedouble();
			String[] split = str.split(",");
			int [] newstr=new int [split.length];
			String join = Util.Join(newstr, ",");
			wg7.setRechargedouble(join);
		}
	}
	request.setAttribute("status", "success");
}else{
	request.setAttribute("status", "error");
}

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'doresetallpay.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

</head>

<body>
	${status }
	<br>
</body>
</html>

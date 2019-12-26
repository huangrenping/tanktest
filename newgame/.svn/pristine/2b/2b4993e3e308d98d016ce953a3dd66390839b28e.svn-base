<%@ page language="java"
	import="java.util.*,
web.webSocket.player.PlayerManager,
web.webSocket.util.GameServerManager,
web.webSocket.util.Util,
web.webSocket.common.Publicmain,
web.webSocket.pojo.WgMain,
web.webSocket.message.MessageManager,
web.webSocket.activity.ActivityManager,
web.webSocket.activity2.Activity2Manager
"
	contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<%
int [] num={500,1000,2000,5000,10000,20000,50000,100000};
int [] art={1002651,1002652,1002653,1002654,1002655,1002656,1002657,1002658};
WgMain wgMain = ActivityManager.getInstance().getWgMain();
Map<Integer, List<List<String>>> powerfuls = wgMain.getPowerfuls();
List<List<String>> funlist = powerfuls.get(Activity2Manager.functionNumber1);
List<String> list0 = funlist.get(0);
list0.clear();
for (int numin : num) {
	list0.add(String.valueOf(numin));
}
List<String> list1 = funlist.get(1);
list1.clear();
for (int artin : art) {
	list1.add(String.valueOf(artin));
}
wgMain.setPowerfuls(powerfuls);
ActivityManager.getInstance().updatewgmain(wgMain);
	out.print("success");
%>

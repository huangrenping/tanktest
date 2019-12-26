<%@page import="web.webSocket.answer.AnswerManager"%>
<%@page import="web.webSocket.plot.PlotManager"%>
<%@ page language="java" import="java.util.*,
web.webSocket.player.PlayerManager,
web.webSocket.pojo.*,
web.webSocket.activity.ActivityManager,
web.webSocket.pojo.WgMain2,
web.webSocket.answer.*,
web.webSocket.arena.*,
web.webSocket.rightdress.RightdressManager,
web.webSocket.player.logic.impl.PlayerLogicImpl,
web.webSocket.util.*,
web.webSocket.rightdress.Part,
web.webSocket.card.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
ArenaManager arenaManager= ArenaManager.getInstance();
if(arenaManager.wgMain.getRobot()!=null&&!arenaManager.wgMain.getRobot().equals("")){
	String[] ss=arenaManager.wgMain.getRobot().split(",");
			out.print("机器人数量==="+ss.length);
}
List<WgArenamain> listarean=arenaManager.listallarean();
for (WgArenamain wgArenamain : listarean) {
	if(wgArenamain.getRanking()!=-1&&wgArenamain.getRanking()<=20){
		out.print("**真实玩家排名"+wgArenamain.getRanking()+"******uid=="+wgArenamain.getUid());
	}
}
int flag=0;
//arenaManager.getRankinkmap().remove(2);
for (int i = 1; i <=20 ; i++) {
	if(arenaManager.getRankinkmap().get(i)==null){
		flag=1;
		out.print("缺少排名==="+i);
	}
}
if(flag==0){
	out.print("不缺少排名");
}else{
	arenaManager.getRankinkmap().clear();
	arenaManager.getMapplayers().clear();
	arenaManager.wgMain.setRobot("");
	arenaManager.addareanplayerlist();
	out.print("重置结束");
}

%>

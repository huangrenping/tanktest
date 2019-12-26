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
			System.out.println("机器人数量==="+ss.length);
}
List<WgArenamain> listarean=arenaManager.listallarean();

Map<Integer, Long> rankinkmap2=new HashMap<Integer, Long>();
int lastranking=0;
for (WgArenamain wgArenamain : listarean) {
	if(wgArenamain.getRanking()>lastranking){
		lastranking=wgArenamain.getRanking();
	}
	rankinkmap2.put(wgArenamain.getRanking(), wgArenamain.getUid());	
}
int start =1;

for (int i = 1; i <= lastranking; i++) {
	if(rankinkmap2.get(i)==null){
		if(start>1000){
			System.out.println("机器人数量不够");
			arenaManager.robot(i);
		}else{
			arenaManager.addRoobTopaihang(start, i);
		}
		start++;
	}
}
if(start<=1000){
	for (int i = 1; i <= 1001-start; i++) {
		arenaManager.addRoobTopaihang(start, lastranking+i);
	}
}
out.println("机器人重置结束");
%>

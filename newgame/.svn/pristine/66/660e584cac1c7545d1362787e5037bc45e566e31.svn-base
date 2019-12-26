<%@page import="web.webSocket.answer.AnswerManager"%>
<%@page import="web.webSocket.plot.PlotManager"%>
<%@ page language="java" import="java.util.*,
web.webSocket.player.PlayerManager,
web.webSocket.pojo.*,
web.webSocket.activity.ActivityManager,
web.webSocket.pojo.WgMain2,
web.webSocket.answer.*,
web.webSocket.arena.*,
web.webSocket.activity.WgPlayerservernew6,
web.webSocket.rightdress.RightdressManager,
web.webSocket.player.logic.impl.PlayerLogicImpl,
web.webSocket.util.*,
web.webSocket.rightdress.Part,
web.webSocket.common.Publicmain,
web.webSocket.card.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
Publicmain.getInstance().sendCookingContestReward(ActivityManager.cookingContestActivity);
out.println("重置完毕");
%>

<%@page import="web.webSocket.answer.AnswerManager"%>
<%@page import="web.webSocket.plot.PlotManager"%>
<%@ page language="java"
	import="java.util.*,java.util.ArrayList,
java.util.Collection,
java.util.Collections,
java.util.Comparator,
java.util.Hashtable,
java.util.List,
web.webSocket.activity.WgPlayerservernew4,
web.webSocket.player.PlayerManager,
web.webSocket.plot.PlotManager,
web.webSocket.plot.Section,
web.webSocket.pojo.WgMail,
web.webSocket.pojo.WgPlayerserver,
web.webSocket.pojo.WgPlayerserver7,
web.webSocket.activity.ActivityManager,
web.webSocket.activity2.Activity2Manager,
web.webSocket.mail.MailManager,
web.webSocket.pojo.WgPlotsection"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<%

int[] artids1={932016,912017,933004,913003};
int[] num={8,8,35,35};
Hashtable<Long, WgPlayerserver> mapplayer = PlayerManager.getInstance().getIdplayermap();
List<WgPlayerserver> listwgplayers = null;
Collection<WgPlayerserver> wplist = mapplayer.values();
listwgplayers = new ArrayList<WgPlayerserver>();
listwgplayers.addAll(wplist);
//去除gm、系统邮件账号
for (WgPlayerserver wgPlayerserver : listwgplayers) {
	if (!wgPlayerserver.getPlayername().equals("GM") && !wgPlayerserver.getPlayername().equals("系统邮件")) {
		Map<Integer, Integer> activityGetShopNum = wgPlayerserver.getWgPlayerserver7().activityGetShopNum(Activity2Manager.hostVoteActivity);
		if(activityGetShopNum==null){
			continue;
		}
		int count=0;
		for (int i = 0; i < artids1.length; i++) {
			Integer integer = activityGetShopNum.get(artids1[i]);
			if(integer!=null){
				count+=integer*num[i];
			}
		}
		if(count==0){
			continue;
		}
		if(count>0){
			String content = "由于风华抉活动积分兑换商城商品价格变动，现补发差价，请注意查收！";
			try {
				MailManager.getInstance().fulisendmail("GM的邮件", "活动补偿差价", content, Activity2Manager.hostVoteMoney + ":"+count, (long) -1,
						wgPlayerserver.getServeruid(), 1);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		
	}
}
out.println("success");

%>

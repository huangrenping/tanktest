<%@page import="web.webSocket.answer.AnswerManager"%>
<%@page import="web.webSocket.plot.PlotManager"%>
<%@ page language="java" import="java.util.*,java.util.ArrayList,
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
web.webSocket.mail.MailManager,
web.webSocket.language.Translate,
web.webSocket.pojo.WgPlotsection" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
Long [] lids={1072800000011573l,1072800000011579l,1072800000011567l,1072800000011577l,1072800000011581l,1072800000011569l,1072800000011588l,1072800000011585l,1072800000011587l,1072800000011576l,1072800000011561l,1072800000011575l,1072800000011578l,1072800000011574l,1072800000011566l,1072800000011571l,1072800000011580l};
ArrayList<Long> arrayList = new ArrayList<Long>(Arrays.asList(lids));
Hashtable<Long, WgPlayerserver> mapplayer=PlayerManager.getInstance().getIdplayermap();
		List<WgPlayerserver> listwgplayers=null;
		Collection<WgPlayerserver> wplist=mapplayer.values();
		listwgplayers=new ArrayList<WgPlayerserver>();
		listwgplayers.addAll(wplist);
		List<WgPlayerserver> listwgplayers2=new ArrayList<WgPlayerserver>();;
		//去除gm、系统邮件账号
		for (WgPlayerserver wgPlayerserver : listwgplayers) {
			if(!wgPlayerserver.getPlayername().equals("GM") && !wgPlayerserver.getPlayername().equals("系统邮件")){
				WgPlayerserver7 wgPlayerserver7=wgPlayerserver.getWgPlayerserver7();
				if(wgPlayerserver7.getMaxcheckpoint()==0){
					if(wgPlayerserver.getMaxcheckpoint()!=null && !wgPlayerserver.getMaxcheckpoint().equals("")){
						int maxsectionid=Integer.valueOf(wgPlayerserver.getMaxcheckpoint().split(":")[1]);
						WgPlotsection wgPlotsection=wgPlayerserver.getPlot().getsection(maxsectionid);
						if(wgPlotsection!=null && wgPlotsection.getStatus()>0){
							wgPlayerserver7.setMaxcheckpoint(maxsectionid);
							//wgPlayerserver.getWgPlayerserver3().edtidailytask(OnlineTaskManager.maxsectionid, maxsectionid, 1);
						}else{
							maxsectionid=maxsectionid-1;
							if(maxsectionid<0){
								maxsectionid=0;
							}
							if(maxsectionid!=0){
								wgPlayerserver7.setMaxcheckpoint(maxsectionid);
								//wgPlayerserver.getWgPlayerserver3().edtidailytask(OnlineTaskManager.maxsectionid, maxsectionid, 1);
							}
						}
						listwgplayers2.add(wgPlayerserver);
					}
				}else{
					listwgplayers2.add(wgPlayerserver);
				}
			}
		}
		Collections.sort(listwgplayers2, new Comparator<WgPlayerserver>(){
			@Override
			public int compare(WgPlayerserver o1, WgPlayerserver o2) {
				WgPlayerserver7 o1wg7=o1.getWgPlayerserver7();
				WgPlayerserver7 o2wg7=o2.getWgPlayerserver7();
				
				int result=o2wg7.getMaxcheckpoint()-o1wg7.getMaxcheckpoint();
				if(result==0){
					long result2=o1wg7.getLastsetciontime()-o2wg7.getLastsetciontime();
					if(result2>0){
						result=1;
					}else if(result2==0){
						result=0;
					}else if(result2<0){
						result=-1;
					}
				}
				return result;
			}
    	});
		List<WgPlayerservernew4> wgnewlist=new ArrayList<WgPlayerservernew4>();
		PlotManager plotManager=PlotManager.getInstance();
		for (int i = 0; i < listwgplayers2.size(); i++) {
			WgPlayerserver wgPlayerserver=listwgplayers2.get(i);
			wgPlayerserver.setGuanranking((i+1));
			int sectionid=Integer.valueOf(wgPlayerserver.getWgPlayerserver7().getMaxcheckpoint());
			wgPlayerserver.setGuaninfo(sectionid);
			if(i<100){
				Section section=plotManager.getsection(sectionid);
				WgPlayerservernew4 wgnew=new WgPlayerservernew4();
				wgnew.setGuanranking(wgPlayerserver.getGuanranking());
				if(section!=null){
					wgnew.setGuaninfo(section.getChapterid()+"-"+section.getOrder());
				}else{
					wgnew.setGuaninfo("1-1");
				}
				wgnew.setPlayname(wgPlayerserver.getPlayername());
				wgnew.setServerid(wgPlayerserver.getServeruid());
				wgnewlist.add(wgnew);
				if(arrayList.indexOf(wgPlayerserver.getServeruid())==-1&&i<=35){
					if(section!=null){
				out.println(i+"---"+wgPlayerserver.getPlayername()+"--"+wgPlayerserver.getServeruid()+wgPlayerserver.getGuanranking()+"---"+section.getChapterid()+"-"+section.getOrder()+"<br>");
					}
				String content="";
				if(i<30){
					content="恭喜您在"+Translate.activityName_3+"活动中获得第"+wgPlayerserver.getGuanranking()+"名的优异成绩，活动奖励已发送致您的邮箱，请注意领取。谢谢您的参与！";
				}else{
					content="恭喜您在"+Translate.activityName_3+"活动中获得第"+30+"名的优异成绩，活动奖励已发送致您的邮箱，请注意领取。谢谢您的参与！";
				}
				try {
					if(wgPlayerserver.getGuanranking()==1){
						MailManager.getInstance().fulisendmail("GM的邮件", Translate.activityName_3+"活动", content,
								ActivityManager.guanqiajiangli2[0]+":1", (long)-1, wgPlayerserver.getServeruid() , 1);
					}else if(wgPlayerserver.getGuanranking()==2){
						MailManager.getInstance().fulisendmail("GM的邮件", Translate.activityName_3+"活动", content,
								ActivityManager.guanqiajiangli2[1]+":1", (long)-1, wgPlayerserver.getServeruid() , 1);
					}else if(wgPlayerserver.getGuanranking()==3){
						MailManager.getInstance().fulisendmail("GM的邮件", Translate.activityName_3+"活动", content,
								ActivityManager.guanqiajiangli2[2]+":1", (long)-1, wgPlayerserver.getServeruid() , 1);
					}else if(wgPlayerserver.getGuanranking()<=10){
						MailManager.getInstance().fulisendmail("GM的邮件", Translate.activityName_3+"活动", content,
								ActivityManager.guanqiajiangli2[3]+":1", (long)-1, wgPlayerserver.getServeruid() , 1);
					}else if(wgPlayerserver.getGuanranking()<=30){
						MailManager.getInstance().fulisendmail("GM的邮件", Translate.activityName_3+"活动", content,
								ActivityManager.guanqiajiangli2[4]+":1", (long)-1, wgPlayerserver.getServeruid() , 1);
					}else if(wgPlayerserver.getGuanranking()<=35){
						MailManager.getInstance().fulisendmail("GM的邮件", Translate.activityName_3+"活动", content,
								ActivityManager.guanqiajiangli2[4]+":1", (long)-1, wgPlayerserver.getServeruid() , 1);
					}
				} catch (Exception e) {
					// TODO: handle exception
				}
				}
			}
		}
		PlayerManager.getInstance().setWgnewlist4(wgnewlist);
		WgPlayerserver[] getplayers = PlayerManager.getInstance().getplayers();
		for (WgPlayerserver wgPlayerserver : getplayers) {
			if (!wgPlayerserver.getPlayername().equals("GM") && !wgPlayerserver.getPlayername().equals("系统邮件")) {
				//out.println(wgPlayerserver.getGuanranking()+"-------<br>");
			}
		}
%>

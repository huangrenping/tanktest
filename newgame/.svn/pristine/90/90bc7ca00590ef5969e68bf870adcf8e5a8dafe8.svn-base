<%@page import="com.sun.tools.doclets.internal.toolkit.util.DocFinder.Output"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList"%>
<%@ page import = "java.util.Collection"%>
<%@ page import = "java.util.Collections"%>
<%@ page import = "java.util.Comparator"%>
<%@ page import = "java.util.Hashtable"%>
<%@ page import = "java.util.List"%>

<%@ page import = "web.webSocket.activity.ActivityManager"%>
<%@ page import = "web.webSocket.activity.Huodong"%>
<%@ page import = "web.webSocket.activity.WgPlayerservernew6"%>
<%@ page import = "web.webSocket.common.Publicmain"%>
<%@ page import = "web.webSocket.language.Translate"%>
<%@ page import = "web.webSocket.player.PlayerManager"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver"%>
<%@ page import = "web.webSocket.util.Util"%>


<% 
PlayerManager playerManager=PlayerManager.getInstance();
		Hashtable<Long, WgPlayerserver> mapplayer = playerManager.getIdplayermap();
		List<WgPlayerserver> listwgplayers = null;
		Collection<WgPlayerserver> wplist = mapplayer.values();
		listwgplayers = new ArrayList<WgPlayerserver>();
		listwgplayers.addAll(wplist);
		Publicmain.getInstance().cookingRanking(listwgplayers);
		Huodong huodong = ActivityManager.getInstance().getHuodongmap().get(ActivityManager.cookingContestActivity);
		if (huodong == null) {
			return;
		}
		boolean open = Util.isOpenTime(huodong.getStarttime(), huodong.getEndtime());
		List<WgPlayerserver> listwgplayers2 = new ArrayList<WgPlayerserver>();
		// 去除gm、系统邮件账号
		for (WgPlayerserver wgPlayerserver : listwgplayers) {
			if (!wgPlayerserver.getPlayername().equals("GM") && !wgPlayerserver.getPlayername().equals(Translate.commonmessage5)) {
				Integer totalcookingscore = wgPlayerserver.getWgPlayerserver7().getTotalcookingscore();
				if(totalcookingscore==null){
					totalcookingscore=0;
				}
				if (totalcookingscore > 0) {
					listwgplayers2.add(wgPlayerserver);
				} else {
					// 避免玩家活动结束积分排名没有重置
					
				}
			}
		}
		Collections.sort(listwgplayers2, new Comparator<WgPlayerserver>() {
			@Override
			public int compare(WgPlayerserver o1, WgPlayerserver o2) {
				int result = o2.getWgPlayerserver7().getTotalcookingscore() - o1.getWgPlayerserver7().getTotalcookingscore();
				if (result == 0) {
					long result3 = o1.getWgPlayerserver7().getTotalcookingscoretime()-o2.getWgPlayerserver7().getTotalcookingscoretime();
					if (result3 > 0) {
						result = 1;
					} else if (result3 < 0) {
						result = -1;
					} else if (result3 == 0) {
						result = 0;
					}
					if (result == 0) {
						long result2 = o1.getServeruid() - o2.getServeruid();
						if (result2 > 0) {
							result = 1;
						} else if (result2 == 0) {
							result = 0;
						} else if (result2 < 0) {
							result = -1;
						}
					}
				}
				return result;
			}
		});

		List<WgPlayerservernew6> wgnewlist = new ArrayList<WgPlayerservernew6>();
		for (int i = 0; i < listwgplayers2.size(); i++) {
			WgPlayerserver wgPlayerserver = listwgplayers2.get(i);
			//前一百名
			if (i < 100) {
				//只记录前一百名
				wgPlayerserver.setCookingRanking(i+1);
				WgPlayerservernew6 wgnew = new WgPlayerservernew6();
				wgnew.setLevel(wgPlayerserver.getLevel());
				wgnew.setPlayname(wgPlayerserver.getPlayername());
				wgnew.setRanking((i + 1));
				wgnew.setServeruid(wgPlayerserver.getServeruid());
				wgnew.setViplevel(wgPlayerserver.getViplevel());
				wgnew.setAvatar(wgPlayerserver.getAvatar());
				wgnew.setPortraitid(wgPlayerserver.getWgPlayerserver7().getPortraitid());
				wgnew.setScoremax(wgPlayerserver.getWgPlayerserver7().getTotalcookingscore());
				wgnewlist.add(wgnew);
			}
			if(i>100){
				break;
			}
		}
		ActivityManager.getInstance().setCookingContestList(wgnewlist);
		Publicmain.getInstance().sendCookingContestReward(ActivityManager.cookingContestActivity);
		out.println("success");

	
%>
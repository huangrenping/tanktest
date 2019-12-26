<%@page import="com.sun.tools.doclets.internal.toolkit.util.DocFinder.Output"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.Map"%>

<%@ page import = "web.webSocket.player.PlayerManager"%>
<%@ page import = "web.webSocket.pojo.WgPlayerserver"%>


<% 
				String s="duokemeng49490959_sid765:8007,duokemeng51812060_sid229:8010,duokemeng50506650_sid789:8009,oppo53225331:3036,duokemeng51500102_sid222:8010,duokemeng49324023_sid756:8006,duokemeng51793475_sid228:8010,duokemeng49012730_sid747:8005,duokemeng51964454_sid230:8010,duokemeng50663556_sid200:8009,duokemeng51732887_sid228:8010,duokemeng51481640:232,duokemeng50886612_sid207:8009,duokemeng51311484_sid215:8010,duokemeng51495679_sid222:8010,duokemeng50535035_sid789:8009,duokemeng43948456_sid710:8000,duokemeng50039077_sid706:8000,duokemeng52383104_sid209:8009,duokemeng49409109_sid760:8006,duokemeng49556875_sid767:8007,duokemeng50705396_sid202:8009,duokemeng51225274_sid213:8010,duokemeng51811866_sid230:8010,duokemeng51675841_sid226:8010,sinagame50368441_sid2006:8400,duokemeng51196151_sid213:8010,duokemeng49527747_sid766:8007,duokemeng49485055_sid765:8007,duokemeng48294278_sid725:8002,duokemeng48447024:703,duokemeng51299975_sid215:8010,duokemeng50961844_sid208:8009,zhiwufeiyou49701098_sid2003:8400,duokemeng49260276_sid754:8006,duokemeng52973435:233,duokemeng49409153_sid760:8006,duokemeng51698509_sid227:8010,duokemeng51465855_sid221:8010,duokemeng52695460:233,duokemeng50992833_sid209:8009,duokemeng52806750:233,duokemeng49422618_sid761:8006,duokemeng50615731_sid201:8009,duokemeng49301383_sid755:8006,duokemeng48792618_sid739:8005,duokemeng49418619:703,duokemeng49277345_sid755:8006,duokemeng51492606_sid222:8010,duokemeng48234104_sid722:8002,duokemeng51571126_sid224:8010,duokemeng49874699_sid776:8008,duokemeng50978181_sid208:8009,duokemeng51747636_sid228:8010,duokemeng50462326_sid787:8009,duokemeng49398734_sid761:8006,duokemeng50594519_sid201:8009,duokemeng48965282_sid745:8005,duokemeng55855613:236,duokemeng51885971_sid229:8010,duokemeng48095947_sid715:8001,duokemeng51024925_sid708:8000,duokemeng49136400_sid749:8005";
		String s2[]=s.split(",");
		
		Map<Integer,Map<String,Boolean>> map=new HashMap<Integer, Map<String,Boolean>>();
		
		for (String string : s2) {
			String s3[]=string.split(":");
			int serverid=Integer.valueOf(s3[1]);
			String username=s3[0];
			
			Map<String,Boolean> mapone=map.get(serverid);
			if(mapone==null){
				mapone=new HashMap<String, Boolean>();
				map.put(serverid, mapone);
			}
			mapone.put(username, true);
		}
		
		Map<String,Boolean> mapserver=map.get(PlayerManager.getInstance().getServerid());
		if(mapserver==null){
			mapserver=new HashMap<String, Boolean>();
		}
		
		WgPlayerserver[] players=PlayerManager.getInstance().getplayers();
		for (WgPlayerserver wgPlayerserver : players) {
			Integer zhanlingbuygiftbag=wgPlayerserver.getWgPlayerserver2().getZhanlingbuygiftbag();
			if(zhanlingbuygiftbag!=null && zhanlingbuygiftbag==1){
				out.println("-----buy-----"+wgPlayerserver.getPlayername()+"---"+wgPlayerserver.getServeruid()+"<br>");
				if(mapserver.get(wgPlayerserver.getUsername())==null){
					wgPlayerserver.getWgPlayerserver2().setZhanlingbuygiftbag(0);
					out.println("-----delbuy-----"+wgPlayerserver.getPlayername()+"---"+wgPlayerserver.getServeruid()+"<br>");
				}
			}
		}

	out.println("success");

	
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.Iterator"%>
<%@ page import = "java.util.Map"%>

<%@ page import = "org.springframework.web.socket.WebSocketSession"%>

<%@ page import = "web.webSocket.common.Game"%>
<%@ page import = "web.webSocket.handler.SystemWebSocketHandler"%>



<%
//SystemWebSocketHandler.getInstance().errormap.clear();
		Map<String,WebSocketSession> sessionmap=SystemWebSocketHandler.getInstance().sessionmap;
		Map<String,Long> errormap=SystemWebSocketHandler.getInstance().errormap;
		System.out.println(SystemWebSocketHandler.getInstance().errormap.size());
		try {
			if(errormap.size()==0){
				return ;
			}
			long time=System.currentTimeMillis();
			Iterator<Map.Entry<String,Long>> entries = errormap.entrySet().iterator();
			while (entries.hasNext()) {
				Map.Entry<String,Long>  entry=entries.next();
				try {
					String wssid=entry.getKey();
					long lasttime=errormap.get(wssid);
					if(time-lasttime>=60*1000){
						System.out.println("----异常id");
						entries.remove();
						//玩家异常没有下线；
						WebSocketSession wss=sessionmap.get(wssid);
						if(wss!=null){
							wss.close();
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
%>


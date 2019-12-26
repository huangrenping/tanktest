package web.game.common.handler;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;


@Component
public class HandshakeInterceptor extends HttpSessionHandshakeInterceptor {

	@Override
	public boolean beforeHandshake(ServerHttpRequest request,
			ServerHttpResponse response, WebSocketHandler wsHandler,
			Map<String, Object> attributes) throws Exception {
		//System.out.println("before-------------");
		
		String token = ((ServletServerHttpRequest) request).getServletRequest().getParameter("token");
		String channel = ((ServletServerHttpRequest) request).getServletRequest().getParameter("channel");
		String username = ((ServletServerHttpRequest) request).getServletRequest().getParameter("username");
		//端;  android   ios   web   isapp;
		
		//验证用户连接；
		//http://webgame.xmwan.com/Webgame/yztoken/token/1/channel/hougong/
		//GameServerManager servers=GameServerManager.getInstance();
		//String weburl=servers.getWeburl();
		//int serverid=servers.getServerid();
		//String url=weburl+"/Webgame/yztoken/serverid/"+serverid+"/token/"+token+"/channel/"+channel+"/username/"+username;
		//if(Publicmain.getInstance().getWgMain().getIshefu()==1){
			//url=weburl+"/Webgame/yztoken/serverid/"+serverid+"/token/"+token+"/channel/"+channel+"/username/"+username;
		//}
		//String getreturn=SendgetManager.SendGET(url);
		
		//System.out.println(weburl+"/Webgame/yztoken/serverid/"+serverid+"/token/"+token+"/channel/"+channel);
		//System.out.println(getreturn+"---------");
//		if(getreturn.equals("success")){
//			
//
//		}else{
//			return false;
//		}

/*		System.out.println(token+"---------");
		System.out.println(channel+"---------");
		if(token!="111111"){
			return false;
		}*/
		
		
		
		  //System.out.println("Websocket:用户[ID:" + ((ServletServerHttpRequest) request).getServletRequest().getSession(false).getAttribute("user") + "]已经建立连接");
/*	        if (request instanceof ServletServerHttpRequest) {
	            ServletServerHttpRequest servletRequest = (ServletServerHttpRequest) request;
	            HttpSession session = servletRequest.getServletRequest().getSession(false);
	            if(session!=null){
		            Player player=(Player) session.getAttribute("Player");
		            if(player!=null){
	                System.out.println("用户id："+player.getUsername()+" 被加入");
	                attributes.put(String.valueOf(player.getId()),player); 
		            }else{
		            	System.out.println("user为空");
		            	return false;
		            }
	            }
	        }*/
		//System.out.println("Before Handshake");
		return super.beforeHandshake(request, response, wsHandler, attributes);
	}

	@Override
	public void afterHandshake(ServerHttpRequest request,
			ServerHttpResponse response, WebSocketHandler wsHandler,
			Exception ex) {
		//System.out.println("After Handshake");
		super.afterHandshake(request, response, wsHandler, ex);
	}

}

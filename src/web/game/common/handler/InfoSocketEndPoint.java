package web.game.common.handler;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
//创建websocket处理类
@Component
public class InfoSocketEndPoint extends TextWebSocketHandler {

	public InfoSocketEndPoint() {
		// TODO Auto-generated constructor stub
	}
    /**
     * js调用websocket.send时候，会调用该方法
     */
	@Override
	protected void handleTextMessage(WebSocketSession session,
			TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		super.handleTextMessage(session, message);
		TextMessage returnMessage = new TextMessage(message.getPayload()
				+ " received at server");
		session.sendMessage(returnMessage);
	}
	/**
     * 连接成功时候，会触发页面上onopen方法
     */
	@Override
	public void afterConnectionEstablished(WebSocketSession session)
			throws Exception {
		System.out.println("######################################");
		// TODO Auto-generated method stub
		super.afterConnectionEstablished(session);
	}
	
	
}

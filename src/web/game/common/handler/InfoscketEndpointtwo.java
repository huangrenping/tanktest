package web.game.common.handler;

import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class InfoscketEndpointtwo extends TextWebSocketHandler{

	@Override
	protected void handleTextMessage(WebSocketSession session,
			TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		super.handleTextMessage(session, message);
	}

	@Override
	protected void handleBinaryMessage(WebSocketSession session,
			BinaryMessage message) {
		// TODO Auto-generated method stub
		super.handleBinaryMessage(session, message);
	}

}

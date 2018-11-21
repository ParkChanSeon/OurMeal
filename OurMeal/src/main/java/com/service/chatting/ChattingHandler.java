package com.service.chatting;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ChattingHandler extends TextWebSocketHandler {
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

	// 클라이언트와 연결 이후에 실행되는 메서드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {		
		sessionList.add(session);
		System.out.printf("%s 연결됨\n", session.getId());
		
		// HttpSession에 저장된 정보를 WebSocketSession 에서 사용
		Map<String, Object> attrMap = session.getAttributes();
		System.out.printf("%s 연결됨\n", attrMap.get("address"));
	}

	// 클라이언트가 서버로 메시지를 전송했을 때 실행되는 메서드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		System.out.printf("%s로 부터 %s 받음\n", session.getId(), message.getPayload());
		
		Map<String, Object> attrMap = session.getAttributes();
		System.out.printf("%s로 부터 %s 받음\n", attrMap.get("address"), message.getPayload());
		for (WebSocketSession sess : sessionList) {
			//sess.sendMessage(new TextMessage(session.getId() + " : " + message.getPayload()));
			sess.sendMessage(new TextMessage(attrMap.get("address") + " : " + message.getPayload()));
		}
	}

	// 클라이언트와 연결을 끊었을 때 실행되는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		//System.out.printf("%s 연결 끊김\n", session.getId());		
		Map<String, Object> attrMap = session.getAttributes();
		System.out.printf("%s 연결 끊김\n", attrMap.get("address"));
	}
}
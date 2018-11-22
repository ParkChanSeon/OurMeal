package com.service.chatting;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import com.all.model.Member;

public class ChattingHandler extends TextWebSocketHandler {
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();	
	private String Userid = null;
	private String AdminId = null;
	private Boolean check = true;

	
	
	// 클라이언트와 연결 이후에 실행되는 메서드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
		session.sendMessage(new TextMessage("연결되어 있는 상태 입니다."));
	}

	// 클라이언트가 서버로 메시지를 전송했을 때 실행되는 메서드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		//System.out.printf("%s로 부터 %s 받음\n", session.getId(), message.getPayload());
		
		Map<String, Object> attrMap = session.getAttributes();
		Member member = (Member)attrMap.get("User");		
		
		//세션 길이가 0보다 크면서 admin이 접속했을때는 채팅을 전송해주고 
		/*
		for (WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(member.getMember_id() + " : " + message.getPayload()));
		}
		*/
	}

	// 클라이언트와 연결을 끊었을 때 실행되는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		//System.out.printf("%s 연결 끊김\n", session.getId());		
		//Map<String, Object> attrMap = session.getAttributes();
		System.out.println("연결 끊김");
		//System.out.printf("%s 연결 끊김\n", attrMap.get("address"));
	}
	
}
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
	private List<String> chattingList = new ArrayList<>();
	private int count = 0;
	boolean chaton = false;
	private String Userid = null;
	private String AdminId = null;
	private Boolean check = true;
	
	// 클라이언트와 연결 이후에 실행되는 메서드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {		
		//들어온 사람의 session 정보 저장
		Map<String, Object> attrMap = session.getAttributes();
		Member member = (Member)attrMap.get("User");
		
		//로그인한 회원이라면 chattinList에 저장
		if(member!=null) {
			chattingList.add(member.getMember_id());	
		}

		//현재 관리자가 접속중이지는 않지만 채팅 내용은 저장되어 있으며 관리자가 접속하면 알림을 주겠습니다.
		for(int i = 0; i<chattingList.size(); i++) {
			//채팅 리스트에 admin이 들어왔다면
			if(chattingList.get(i).equals("admin")) {
				session.sendMessage(new TextMessage(chattingList.get(i) + "님이 입장 하였습니다."));
				chaton = true;
			}else {
				session.sendMessage(new TextMessage("adminNotLogin"));
				chaton = false;
			}
		}		

		sessionList.add(session);
		System.out.println("현재 접속자 수 : " + sessionList.size());
		if(sessionList.size()!=2) {
			
		}
	}

	// 클라이언트가 서버로 메시지를 전송했을 때 실행되는 메서드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		//접속자 채팅리스트에 admin이 있다면 채팅 진행
		System.out.println("접속 연결했던 리스트 : " + chattingList.size());
		
		Map<String, Object> attrMap = session.getAttributes();
		Member member = (Member)attrMap.get("User");
		String member_id = member.getMember_id();
		
		if(member_id!=null) {
			if(chaton) {
				for (WebSocketSession sess : sessionList) {
					sess.sendMessage(new TextMessage(member_id + " : " + message.getPayload()));
				}
			}	
		}				

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
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
	boolean chaton = false;
	boolean chatting = true;
	boolean logon = false;
	boolean overlap = false;
	
	// 클라이언트와 연결 이후에 실행되는 메서드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {		
		//들어온 사람의 session 정보 저장
		Map<String, Object> attrMap = session.getAttributes();
		Member member = (Member)attrMap.get("User");
		
		//로그인한 회원이라면 chattinList에 저장
		if(member!=null) {
			chattingList.add(member.getMember_id());			
			logon = true;
		}

		//채팅 리스트에 아이디가 반복 된다면?
		String member_id = member.getMember_id(); 
		
		//현재 관리자가 접속중이지는 않지만 채팅 내용은 저장되어 있으며 관리자가 접속하면 알림을 주겠습니다.
		for(int i = 0; i<chattingList.size(); i++) {			
			//채팅 리스트에 admin이 들어왔다면
			if(chattingList.get(i).equals("admin")) {
				//session.sendMessage(new TextMessage(chattingList.get(i) + "님이 입장 하였습니다."));
				chaton = true;
			}

			//관리자가 채팅창 여러개 못뛰우도록
			if(chattingList.size()>1) {
				if(chattingList.get(0).equals("admin") && chattingList.get(1).equals(chattingList.get(0))) {
					chattingList.remove(i);
					overlap = true;
				}else {
					overlap = false;
				}
			}
			
			//일반 유저는 어차피 관리자가 로그인 하지 않는한 창을 여러개 실행할 수 없으며 admin이 로그인해야지만 사용할 수 있으니 패스
			if(sessionList.size()>2) {
				chatting = false;
			}
						
		}	
		
		//admin 로그인 했다면
		if(!chaton) {
			session.sendMessage(new TextMessage("adminNotLogin"));
		}
		
		//1:1로 채팅 진행 중이라면
		if(!chatting) {
			session.sendMessage(new TextMessage("chatting"));
		}
		
		//로그인 상태가 아니라면
		if(!logon) {
			session.sendMessage(new TextMessage("login"));
		}
		
		//중복 채팅창 실행시
		if(overlap) {
			session.sendMessage(new TextMessage("overlap"));
		}
		
		sessionList.add(session);
		System.out.println("현재 접속자 수 : " + sessionList.size());
		
		if(member_id!=null && chaton) {
			for (WebSocketSession sess : sessionList) {
				sess.sendMessage(new TextMessage(member_id + "님이 입장 하였습니다."));
			}
		}

	}

	// 클라이언트가 서버로 메시지를 전송했을 때 실행되는 메서드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		//접속자 채팅리스트에 admin이 있다면 채팅 진행
		System.out.println("접속 연결했던 리스트 : " + chattingList.size());
		System.out.println("0번 아이디 : " + chattingList.get(0));
		
		Map<String, Object> attrMap = session.getAttributes();
		Member member = (Member)attrMap.get("User");
		String member_id = member.getMember_id();
		
		if(member_id!=null && chaton) {
			for (WebSocketSession sess : sessionList) {
				sess.sendMessage(new TextMessage(member_id + " : " + message.getPayload()));
			}
		}

	}

	// 클라이언트와 연결을 끊었을 때 실행되는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.clear();		
		System.out.println("연결 끊김");
	}
	
}
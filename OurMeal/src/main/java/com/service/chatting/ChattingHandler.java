package com.service.chatting;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.all.model.Member;


public class ChattingHandler extends TextWebSocketHandler {
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	private List<String> chattingList;
	boolean chaton = false;
	boolean chatting = false;
	boolean logon = false;
	boolean overlap = false;	
	String member_id = null;
	// 클라이언트와 연결 이후에 실행되는 메서드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		chattingList = new ArrayList<>();
		System.out.println("오버랩 데이타 : " + overlap);		
		//들어온 사람의 session 정보 저장
		Map<String, Object> attrMap = session.getAttributes();
		Member member = (Member)attrMap.get("User");
		
		//로그인한 회원이라면 chattinList에 저장
		if(member!=null) {
			chattingList.add(member.getMember_id());
			logon = true;
			
			//채팅 리스트에 아이디가 반복 된다면?
			member_id = member.getMember_id();
			
			//현재 관리자가 접속중이지는 않지만 채팅 내용은 저장되어 있으며 관리자가 접속하면 알림을 주겠습니다.
			for(int i = 0; i<chattingList.size(); i++) {			
				//채팅 리스트에 admin이 들어왔다면
				if(chattingList.get(i).equals("admin")) {
					//session.sendMessage(new TextMessage(chattingList.get(i) + "님이 입장 하였습니다."));
					chaton = true;
				}

			}			
		}		

		//로그인 상태가 아니라면
		if(!logon) {
			session.sendMessage(new TextMessage("login"));
		}else {
			//admin 로그인 했다면 채팅 가능
			if(!chaton) {
				session.sendMessage(new TextMessage("adminNotLogin"));
			}	
		}
		
		//중복 채팅창 실행시
		if(overlap) {
			session.sendMessage(new TextMessage("overlap"));
		}
		
		if(member_id!=null && chaton) {
			sessionList.add(session);
			System.out.println("현재 접속자 수 : " + sessionList.size());
			
			//채팅 연결을 시도 했을때 2명이상이라면 메시지를 보내서 튕겨내야함 연결 자체가 끊어지면 다끊김
			if(sessionList.size()>2) {
				//1:1로 채팅 진행 중이라면
				System.out.println("여기서 메시지 보내야됨");

				session.sendMessage(new TextMessage("chatting"));
				sessionList.remove(2);
			}else {
				//일반 유저는 어차피 관리자가 로그인 하지 않는한 창을 여러개 실행할 수 없으며 admin이 로그인해야지만 사용할 수 있으니 패스
				for (WebSocketSession sess : sessionList) {
					sess.sendMessage(new TextMessage("<span class='member_id'>" + member_id + "님이 입장 하였습니다.<br/>"));
				}					
			}
	
		}

	}

	// 클라이언트가 서버로 메시지를 전송했을 때 실행되는 메서드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		if(member_id!=null && chaton) {
			Date today = new Date();
			System.out.println(today);
			
			SimpleDateFormat date = new SimpleDateFormat("yyyy년MM월dd일");
			SimpleDateFormat time = new SimpleDateFormat("a hh:mm:ss");
			
			//접속자 채팅리스트에 admin이 있다면 채팅 진행
			System.out.println("접속 연결했던 리스트 : " + chattingList.size());
			
			Map<String, Object> attrMap = session.getAttributes();
			Member member = (Member)attrMap.get("User");
			String member_id = member.getMember_id();
			
			String admin_html_start = "<div class='incoming_msg'><div class='received_msg'><div class='received_withd_msg'><p>";
			String admin_html_end = "</p><span class='time_date'>"+time.format(today)+"</span></div></div></div>";
			
			String user_html_start = "<div class='outgoing_msg'><div class='sent_msg'><p>";
			String user_html_end = "</p><span class='time_date'>"+time.format(today)+"</span> </div></div>";
			
			String s_html = null;
			String e_html = null;
			
			//자신이 보낸메시지를 판단하려면? 현재아이디와 맞는 경우 파란색을 보내주고 그게 아닌 경우 회색으로 보내준다.
				for(WebSocketSession sess : sessionList) {
					if(member_id.equals("admin")) {
						s_html = admin_html_start;
						e_html = admin_html_end;						
					}else {						
						s_html = user_html_start;						
						e_html = user_html_end;
					}
					
					sess.sendMessage(new TextMessage(s_html +"<b>"+member_id+"</b>" + " : " + message.getPayload() + e_html));
				}
			}

	}
	
	// 클라이언트와 연결을 끊었을 때 실행되는 메소드 같은사람이 두번 들어오면 안되...
	//채팅요청을 하면 대기열을 표시해 주면 좋을듯 첫번째 놈은 메시지 보내고 그이후부터는 몇번째순으로 대기 중이다 표시
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		Map<String, Object> attrMap = session.getAttributes();
		Member member = (Member)attrMap.get("User");
		
		member_id = member.getMember_id();
		
		if(member_id.equals("admin")) {
			sessionList.clear();
		}else {
			sessionList.get(0).sendMessage(new TextMessage(member_id + "님이 퇴장하였습니다."));	
		}
				
		//2라면 1이지워질거고 1이면 0이지워질거고
		sessionList.remove(sessionList.size()-1);
		
		System.out.println("연결 끊김");		
	}
	
}
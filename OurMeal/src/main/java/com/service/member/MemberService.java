package com.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.all.dao.*;
import com.all.model.*;

@Service
public class MemberService {

	@Autowired
	private MemberDAO dao;

	public void setDao(MemberDAO dao) {
		this.dao = dao;
	}
	// 회원가입
	@Transactional
	public void join (JoinRequest joinReq) {
		
	Member member = dao.selectById(joinReq);
		if(member != null) {
		
		throw new DuplicateIdException();	
		}
		
		dao.memberRegist(joinReq);
		
		
	}
	// 로그인
	public Member memberLogin(Member member) {
		return this.dao.memberLogin(member);
	}

	// 로그인 체크
	public Member memberLoginCheck(Member member) {
		return this.dao.memberLoginCheck(member);
	}	
	
	// 마이페이지
	public Member myPage(Member member) {
		return this.dao.myPage(member);
	}

	// 회원정보수정
	public int memberUpdate(Member member) {
		return this.dao.memberUpdate(member);
	}

	// 회원탈퇴
	public int memberDelete(Member member) {
		return this.dao.memberDelete(member);
	}
	
	//비번 체크
	public Member memberPasswordCheck(Member member) {
		return this.dao.memberPasswordCheck(member);
	}
	
	//비번 변경
	public int memberPasswordUpdate(Member member) {
		return this.dao.memberPasswordUpdate(member);
	}

	//회원 건강 정보 등록
	public int memberAddHealth(Health health) {
		return this.dao.memberAddHealth(health);
	}
	
	//회원 일일 대사량 데이터 가져오기
	public Health memberSelectHealth(Health health) {
		return this.dao.memberSelectHealth(health);
	}	
	
	// 아이디값으로 찾아오기
	public Member selectById(JoinRequest joinReq) {
		return dao.selectById(joinReq);
	}
	
	//프로필 사진 등록
	public int memberProfileImageUpload(Member member) {
		return dao.memberProfileImage(member);
	}
}

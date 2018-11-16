package com.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.all.dao.*;
import com.all.model.*;

@Service
public class MemberService {

	@Autowired
	private MemberDAO dao;

	public void setDao(MemberDAO dao) {
		this.dao = dao;
	}
/*
	// 회원가입
	public int memberRegist(Member member) {
		return this.dao.memberRegist(member);
	}
*/
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

}

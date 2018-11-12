package com.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.all.dao.MemberDAO;
import com.all.model.Member;

@Service
public class MyPageService {

	@Autowired
	private MemberDAO dao;
	
	public void setDao(MemberDAO dao) {
		this.dao = dao;
	}

	// 마이페이지
	public Member myPage(Member member) {
		return this.dao.myPage(member);
	}

}

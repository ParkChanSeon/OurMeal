package com.service.find;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.all.model.Member;
import com.controller.find.FindPwController;
import com.find.dao.FindDAO;

@Service
public class FindPwService {

	@Autowired
	private FindDAO dao;
	
	@Autowired
	private FindPwController controller; 

	public void setDao(FindDAO dao) {
		this.dao = dao;
	}
	
	// 비밀번호 찾기
	public Member findPw(Member member) {
		return this.dao.findPw(member);
	}

	// 비밀번호 찾기(랜덤)
	public void findPassword(Member member) {
		dao.findPassword(member);
	}
	
	// 아이디값으로 회원 여부 확인
	public int findById(Member member) {
		return dao.findById(member);
	}
}

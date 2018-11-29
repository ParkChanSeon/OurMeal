package com.service.find;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.all.model.Member;
import com.controller.find.FindPwController;
import com.find.dao.FindDAO;

@Service
public class FindService {

	@Autowired
	private FindDAO dao;
	
	@Autowired
	private FindPwController controller; 

	public void setDao(FindDAO dao) {
		this.dao = dao;
	}

	// 아이디 찾기
	public Member findId(Member member) {
		return this.dao.findId(member);
	}
	
	// 비밀번호 찾기
	public Member findPw(Member member) {
		return this.dao.findPw(member);
	}

	// 비밀번호 찾기(랜덤)
	public void findPassword(Member member) {
		dao.findPassword(member);
	}
}

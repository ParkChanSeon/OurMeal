package com.service.find;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.all.model.Member;
import com.find.dao.FindDAO;

@Service
public class FindPwService {

	@Autowired
	private FindDAO dao;

	public void setDao(FindDAO dao) {
		this.dao = dao;
	}
	
	// 비밀번호 찾기
	public Member findPw(Member member) {
		return dao.findPw(member);
	}
}

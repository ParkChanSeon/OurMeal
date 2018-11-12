package com.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.all.dao.MemberDAO;

@Service
public class MemberUpdateService {
	
	@Autowired
	private MemberDAO dao;
	
	public void setDao(MemberDAO dao) {
		this.dao = dao;
	}

}

package com.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

import com.all.dao.*;
import com.all.model.*;

@Service
public class MemberRegistService {

	@Autowired
	private MemberDAO dao;
	
	public void setDao(MemberDAO dao) {
		this.dao = dao;
	}
	
	//회원가입
	public int regist(Member member) {
		return this.dao.regist(member);
	}
}















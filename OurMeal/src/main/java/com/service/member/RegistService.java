package com.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.all.dao.MemberDAO;
import com.all.model.JoinRequest;
import com.all.model.Member;



@Service
public class RegistService {

	
	@Autowired
	MemberDAO dao ;
	
	
	
	
	
}

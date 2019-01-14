package com.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.all.model.Member;
import com.service.member.MemberService;

@RestController
public class M_MemberRegistController {
	
	@Autowired
	MemberService service;
	
	@RequestMapping(value="/m_regist", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String m_regist(Member member) {
		System.out.println(member.getMember_id() );
		System.out.println(member.getMember_name() );
		System.out.println(member.getMember_address() );
		System.out.println(member.getMember_email() );
		return null;
	}
	
	
}

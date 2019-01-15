package com.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.all.model.JoinRequest;
import com.all.model.Member;
import com.google.gson.Gson;
import com.service.member.MemberService;

@RestController
public class M_MemberRegistController {
	
	@Autowired
	MemberService service;
	
	@RequestMapping(value="/m_regist", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String m_regist(Member member) {
		System.out.println("회원가입 시작");
		System.out.println(member.getMember_id() );
		System.out.println(member.getMember_pw() );
		System.out.println(member.getMember_name() );
		System.out.println(member.getMember_sex());
		System.out.println(member.getMember_birth());
		System.out.println(member.getMember_phone());		
		System.out.println(member.getMember_address() );
		System.out.println(member.getMember_email() );
		
		JoinRequest join = new JoinRequest();
		join.setMember_id(member.getMember_id());
		join.setMember_pw(member.getMember_pw());
		join.setMember_name(member.getMember_name());
		join.setMember_sex(member.getMember_sex());
		join.setMember_birth(member.getMember_birth());
		join.setMember_phone(member.getMember_phone());
		join.setMember_address(member.getMember_address());
		join.setMember_email(member.getMember_email());
		
		Gson gson = new Gson();		
		try {
			service.join(join);
			return gson.toJson("1");
		} catch (Exception e) {
			return gson.toJson("0");
		}
	}
	
	
}

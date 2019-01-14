package com.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.all.model.Member;
import com.google.gson.Gson;
import com.service.member.MemberService;

@RestController
public class M_KingMemberLoginController {
	@Autowired
	private MemberService service;

	@RequestMapping(value="/restful/login", method=RequestMethod.POST)
	public String restful_login( Member member, HttpServletRequest req) {
		
		System.out.println("안드로이드 로그인 시작");
		System.out.println(member.getMember_id());
		Gson gson = new Gson();
		Member member1 = service.memberLogin(member);
		
		if(member1.getMember_id() != null) {
			HttpSession session = req.getSession();
			System.out.println(session.getId());
			String strJson = gson.toJson(member1);
			return strJson;
		} else {
			String strJson = gson.toJson(member1);
			return strJson;
		}
		
	}
}

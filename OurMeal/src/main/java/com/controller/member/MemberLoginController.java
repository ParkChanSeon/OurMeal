package com.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.all.model.Member;
import com.service.member.MemberService;

@Controller
public class MemberLoginController {

	@Autowired
	private MemberService service;

	@RequestMapping(value = "/memberLogin", method = RequestMethod.GET)
	public String memberLoginForm() {
		
		return "member/memberLoginForm";
	}

	@RequestMapping(value = "/memberLogin", method = RequestMethod.POST)
	public String select(Model model, Member member) {
		
		return "main/loginSuccessForm";
	}

}

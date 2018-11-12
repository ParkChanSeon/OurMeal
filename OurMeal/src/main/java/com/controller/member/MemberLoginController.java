package com.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.all.model.Member;
import com.service.member.MemberLoginService;

@Controller
public class MemberLoginController {

	@Autowired
	private MemberLoginService service;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String memberLogintForm() {
		
		return "memberLogintForm";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String select(Model model, Member member) {
		
		return "loginSuccessForm";
	}

}

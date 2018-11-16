package com.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.all.model.Member;
import com.service.member.MemberService;

@Controller
public class MyPageController {
	
	@Autowired
	private MemberService service;
	
	@RequestMapping(value="/myPage", method=RequestMethod.POST)
	public String selectOne(Model model, @RequestParam("member_id") String id) {
		Member member = new Member();
		member.setMember_id(id);
		
		model.addAttribute("myPage", service.myPage(member));		
		return "member/myPageForm";
	}

}

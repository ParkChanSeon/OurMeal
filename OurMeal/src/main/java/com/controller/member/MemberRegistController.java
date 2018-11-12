package com.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.all.model.Member;
import com.service.member.MemberService;

@Controller
public class MemberRegistController {
	
	@Autowired
	private MemberService service;
	
	@RequestMapping(value="/memberRegist", method=RequestMethod.GET)
    public String memberRegist(){
        return "member/memberRegistForm";
    }
	
	@RequestMapping(value="/memberRegist", method=RequestMethod.POST)
	public String insert(Model model, Member member) {
		System.out.println("memberRegist");
		
		model.addAttribute("memberRegist", service.memberRegist(member));	
		return "main/registSuccessForm";
	}

}

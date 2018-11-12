package com.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.all.model.Member;
import com.service.member.MemberRegistService;

@Controller
public class MemberRegistController {
	
	@Autowired
	private MemberRegistService service;
	
	@RequestMapping(value="/regist", method=RequestMethod.GET)
    public String registForm(){
        return "registForm";
    }
	
	@RequestMapping(value="/regist", method=RequestMethod.POST)
	public String insert(Model model, Member member) {
		System.out.println("regist");
		
		model.addAttribute("regist", service.regist(member));	
		return "registSuccessForm";
	}

}

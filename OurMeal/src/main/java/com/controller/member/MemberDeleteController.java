package com.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.service.member.MemberService;

@Controller
public class MemberDeleteController {
	
	@Autowired
	private MemberService service;
	
	@RequestMapping(value="/memberDelete", method=RequestMethod.GET)
    public String MemberUpdateForm(){
        return "main/deleteSuccessForm";
    }

}

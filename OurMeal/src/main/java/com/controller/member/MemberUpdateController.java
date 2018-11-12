package com.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.service.member.MemberUpdateService;

@Controller
public class MemberUpdateController {
	
	@Autowired
	private MemberUpdateService service;
	
	@RequestMapping(value="/memberUpdate", method=RequestMethod.GET)
    public String MemberUpdateForm(){
        return "memberUpdateForm";
    }

}

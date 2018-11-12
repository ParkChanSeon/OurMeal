package com.controller.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.service.member.MemberService;

@Controller
public class HealthController {
	
	@Autowired
	private MemberService service;
	
	@RequestMapping(value="/health", method=RequestMethod.GET)
    public String healthForm(){
        return "healthForm";
    }

}

package com.controller.member;

import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.all.model.JoinRequest;

import com.service.member.DuplicateIdException;
import com.service.member.RegistService;


 @Controller
public class MemberRegistController {
  
	

	@Autowired
	RegistService joinService;
	
	
	private static final String FORM_VIEW = "/join/joinForm";
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String join() {
		
		return FORM_VIEW;
	}
	
	
	@RequestMapping(value="/join", method=RequestMethod.POST )
	public String joinReq(HttpServletRequest req) {
		
		JoinRequest joinReq = new JoinRequest();
		
		
		/*
		System.out.println(req.getParameter("member_id"));
		System.out.println(req.getParameter("member_pw"));
		System.out.println(req.getParameter("member_ConfirmPassword"));
		System.out.println(req.getParameter("member_name"));
		System.out.println(req.getParameter("member_birth"));
		System.out.println(req.getParameter("member_sex"));
		System.out.println(req.getParameter("member_phone"));
		System.out.println(req.getParameter("roadAddrPart1"));
		System.out.println(req.getParameter("addrDetail"));
		System.out.println(req.getParameter("roadAddrPart2"));
		System.out.println(req.getParameter("member_email"));
		*/
		
		String member_address = req.getParameter("roadAddrPart1") + ", " 
		+req.getParameter("addrDetail") + " " +req.getParameter("roadAddrPart2");
		
		
		
		joinReq.setMember_id(req.getParameter("member_id"));
		joinReq.setMember_pw(req.getParameter("member_pw"));
		joinReq.setMember_ConfirmPassword(req.getParameter("member_ConfirmPassword"));
		joinReq.setMember_name(req.getParameter("member_name"));
		
		joinReq.setMember_birth(req.getParameter("member_birth"));
		
		joinReq.setMember_sex(req.getParameter("member_sex"));
		joinReq.setMember_phone(req.getParameter("member_phone"));
		joinReq.setMember_address(member_address);
		joinReq.setMember_email(req.getParameter("member_email"));
		
		
		req.setAttribute("member_id", req.getParameter("member_id"));
		
		
		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);
		
		joinReq.validate(errors);
		
		
		if(!errors.isEmpty()) {
			System.out.println("ERROR 발생");
			return FORM_VIEW;
		}
		
		try {
			joinService.join(joinReq);
			return "/join/joinSuccessForm";
		} catch (DuplicateIdException e) {
			errors.put("duplicateId", Boolean.TRUE);
			return FORM_VIEW;
		}
	
		
		
	}

}
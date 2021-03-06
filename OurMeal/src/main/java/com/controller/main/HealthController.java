package com.controller.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.all.model.Health;
import com.all.model.Member;
import com.service.member.MemberService;

@Controller
public class HealthController {
	
	@Autowired
	private MemberService service;
	
	@RequestMapping(value="/memberHelth", method=RequestMethod.POST)
    public String MemberHelth(Health health, Model model, HttpSession session, HttpServletRequest request){		
		Member member = (Member)session.getAttribute("User");
		
		if(member==null) {
			return "redirect:/";
		}
		
		Health member_health = null;
		
		if(member!=null) {			
			//member 값이 있을 경우만 칼로리 정보를 가져온다.
			health.setMember_id(member.getMember_id());
			member_health = service.memberSelectHealth(health);		
		}
		
		health.setMember_id(member.getMember_id());		
		
		int check = service.memberAddHealth(health);
		
		if(check==1) {
			model.addAttribute("Health", check);	
		}
		
		request.getSession().setAttribute("kcal", member_health);
		
		return "redirect:/memberUpdate";
    }

}

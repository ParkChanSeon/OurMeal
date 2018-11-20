package com.controller.member;

import java.util.Random;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.support.RequestPartServletServerHttpRequest;

import com.all.model.Health;
import com.all.model.Member;
import com.service.member.MemberService;

@Controller
public class MemberUpdateController {
	
	@Autowired
	private MemberService service;
	
	@RequestMapping(value="/test", method=RequestMethod.GET)
    public String test(HttpServletRequest request){
		String id = request.getParameter("pageNo");
		System.out.println("get 방식 id  가져오는 방법 : " + id);
        return "member/memberUpdateForm";
    }
	
	
	@RequestMapping(value="/memberUpdate", method=RequestMethod.GET)
    public String MemberUpdateForm(HttpSession session, Model model, Health health){	
		Member member = (Member)session.getAttribute("User");		
		
		if(member!=null) {			
			//member 값이 있을 경우만 칼로리 정보를 가져온다.
			health.setMember_id(member.getMember_id());
			Health member_health = service.memberSelectHealth(health);			
			model.addAttribute("kcal", member_health);
		}

        return "member/memberUpdateForm";
    }

	@RequestMapping(value="/memberUpdate", method=RequestMethod.POST)
    public String MemberUpdateForm(Member member, Model model, HttpServletRequest request){
		 //멤버서비스 통째로 service go

		int check = service.memberUpdate(member);
		String test = request.getParameter("member_birth");
		System.out.println(test);
		
		
		if(check==1) {			
			model.addAttribute("memberUpdate", check);
		}else {
			model.addAttribute("memberUpdate", check);
		}
        return "member/memberUpdateForm";
    }
	@RequestMapping(value="/memberUpdate_pw", method=RequestMethod.POST)
    public String MemberUpdatePW(ServletRequest request, Model model, HttpSession session){		 
		 //만약 개인정보 수정이라면 update 처리
		 String oldpw = request.getParameter("old_pw");
		 String newpw = request.getParameter("new_pw");
		 
		 Member member = (Member)session.getAttribute("User");
		 
		 System.out.println("예전 비번 : "+ oldpw);
		 System.out.println("바꿀 비번 : "+ newpw);
		 
		 //oldpw 쿼리 날려서 확인
		 member.setMember_pw(oldpw);		
		 Member checkPw = service.memberPasswordCheck(member);		 

		 if(checkPw!=null) {			 
			 member.setMember_pw(newpw);
			 int updatePw = service.memberPasswordUpdate(member);
			 model.addAttribute("PasswordUpdate", updatePw);
		 }else {
			 model.addAttribute("PasswordUpdate", 0);
		 }
		 
        return "member/memberUpdateForm";
    }
	
	@RequestMapping(value="/memberHelth", method=RequestMethod.POST)
    public String MemberHelth(Health health, Model model, HttpSession session){		
		
		Member member = (Member)session.getAttribute("User");
		
		if(member!=null) {			
			//member 값이 있을 경우만 칼로리 정보를 가져온다.
			health.setMember_id(member.getMember_id());
			Health member_health = service.memberSelectHealth(health);			
			model.addAttribute("kcal", member_health);
		}
		
		health.setMember_id(member.getMember_id());		
		
		int check = service.memberAddHealth(health);
		
		if(check==1) {
			model.addAttribute("Health", check);	
		}
		
        return "member/memberUpdateForm";
    }
	

}

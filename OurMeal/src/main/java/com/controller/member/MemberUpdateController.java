package com.controller.member;

import java.util.Random;

import javax.servlet.ServletRequest;
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
public class MemberUpdateController {
	
	@Autowired
	private MemberService service;
	
	@RequestMapping(value="/memberUpdate", method=RequestMethod.GET)
    public String MemberUpdateForm(HttpSession session){
		//세션 아이디가져와서 selelct 아이디로 한뒤에 member 정보를 가져와서 뿌려주면 끝.
		 Member member = (Member)session.getAttribute("User");
		 System.out.println("session 값  : "+member.getMember_id());		 
		  
		 //만약 개인정보 수정이라면 update 처리
		 
		 //패스워드 수정이라면 확인과정후 update 처리
		 
		 //신체사이즈 입력이라면 널값 확인후 insert 처리
		 //null pointer 익센션 처리
        return "member/memberUpdateForm";
    }

	@RequestMapping(value="/memberUpdate", method=RequestMethod.POST)
    public String MemberUpdateForm(Member member, Model model){		 
		 //멤버서비스 통째로 service go
		int check = service.memberUpdate(member);
		
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
		
		health.setMember_id(member.getMember_id());
		Random a = new Random();
		int b = a.nextInt(500);
		health.setHealth_no(b+"테스트중");
		health.setHealth_basal(2);//이값은 모야
		
		int check = service.memberAddHealth(health);
		
		if(check==1) {
			model.addAttribute("Health", check);	
		}
		
        return "member/memberUpdateForm";
    }
	

}

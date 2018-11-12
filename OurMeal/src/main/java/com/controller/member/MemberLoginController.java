package com.controller.member;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.all.model.Member;
import com.service.member.LoginFailException;
import com.service.member.MemberService;
import com.all.model.User;

@Controller
public class MemberLoginController {

	@Autowired
	private MemberService service;

	@RequestMapping(value = "/memberLogin", method = RequestMethod.GET)
	public String memberLoginForm() {
		
		return "member/memberLoginForm";
	}

	@RequestMapping(value = "/memberLogin", method = RequestMethod.POST)
	public String select(Model model, Member member, HttpServletRequest request) {
		String id = member.getMember_id();
		String password = member.getMember_pw();
		
		Map<String, Boolean> errors = new HashMap<>();
		model.addAttribute("errors", errors);
		
		if(id == null || id.isEmpty()) {
			errors.put("id", Boolean.TRUE);
		}
		
		if(password == null || password.isEmpty()) {
			errors.put("password", Boolean.TRUE);
		}
				
		if(!errors.isEmpty()) {
			return "main/loginSuccessForm";
		}
		
		try {			
			Member loginUser = service.memberLogin(member);
			User user = new User(loginUser.getMember_id(), loginUser.getMember_pw());
			
			request.getSession().setAttribute("loginUser", user);			
			
			return "redirect:/";
		}catch(LoginFailException e) {
			errors.put("idOrPwNotMatch", Boolean.TRUE);
			return "member/memberLoginForm";			
		}		
	}

}

package com.controller.member;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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

	@ResponseBody
	@RequestMapping(value = {"/memberLogin"}, method = RequestMethod.POST)	
	public String select(Model model, Member member, HttpServletRequest request) {
		//System.out.println(strJsonData.);
		return "{\"msg\" : \"Hello AJAX~!\"}"; 
		/*
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
		
		Member loginUser = service.memberLogin(member);

		try {
			User user = new User(loginUser.getMember_id(), loginUser.getMember_name());
			
			request.getSession().setAttribute("loginUser", user);
			return "member/memberLoginForm"; 
		}catch(LoginFailException e) {
			errors.put("idOrPwNotMatch", Boolean.TRUE);
			return "redirect:/";
		}
		*/	
		
	}
		
	@ResponseBody
	@RequestMapping(value="/member/checkId/{id}", method=RequestMethod.POST)
	public String checkId(@PathVariable("id") String data, Member member, Model model) {
		
		System.out.println(data);
		String idpw[] = data.split(",");
		
		String id = idpw[0];
		String pw = idpw[1];
		
		member.setMember_id(id);
		member.setMember_pw(pw);
				
		Member result = service.memberLoginCheck(member);
		
		String msg;
		if(result == null) {
			msg = "yes";			
		}else {
			msg = "no";
		}
		
		model.addAttribute(member);
		return "{\"value\" : \"" + msg + "\"}";
		
	}

}

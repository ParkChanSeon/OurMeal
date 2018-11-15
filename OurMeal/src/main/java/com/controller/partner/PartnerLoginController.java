package com.controller.partner;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.all.model.Member;
import com.all.model.Partner;
import com.all.model.User;
import com.service.member.MemberService;
import com.service.partner.PartnerService;

@Controller
public class PartnerLoginController {
	
	@Autowired
	private PartnerService service;
	
	@Autowired
	private MemberService mservice;

	@RequestMapping(value = "/partnerLogin", method = RequestMethod.GET)
	public String partnerLoginForm() {
		
		return "partner/partnerLoginForm";
	}

	@RequestMapping(value = "/partnerLogin", method = RequestMethod.POST)
	public String select(Model model, Partner partner) {
		
		return "main/loginSuccessForm";
	}
	
	@ResponseBody
	@RequestMapping(value="/partner/checkId/{id}", method=RequestMethod.POST)
	public String checkId(@PathVariable("id") String data, Member member, Model model, HttpServletRequest request) {
		
		System.out.println(data);
		String idpw[] = data.split(",");
		
		String id = idpw[0];
		String password = idpw[1];
		
		member.setMember_id(id);
		member.setMember_pw(password);
		
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
	
		Member loginUser = service.partnerLoginCheck(member);

		String msg;
		if(loginUser == null) {
			msg = "nodata";
			errors.put("idOrPwNotMatch", Boolean.TRUE);
			return "{\"value\" : \"" + msg + "\"}";			
		}else {
			msg = "data";
			//User user = new User(loginUser.getMember_id(), loginUser.getMember_name());
			
			request.getSession().setAttribute("User", loginUser);
			return "{\"value\" : \"" + msg + "\"}"; 
		}		
				
	}
	
}

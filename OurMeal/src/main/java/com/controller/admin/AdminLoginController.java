package com.controller.admin;

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

import com.all.model.Admin;
import com.all.model.Member;
import com.all.model.User;
import com.service.admin.AdminService;
import com.service.member.MemberService;

@Controller
public class AdminLoginController {
	
	@Autowired
	private AdminService service;

	@RequestMapping(value = "/adminLogin", method = RequestMethod.GET)
	public String adminLoginForm() {
		
		return "admin/adminLoginForm";
	}

	@RequestMapping(value = "/adminLogin", method = RequestMethod.POST)
	public String select(Model model, Admin admin) {
		
		return "admin/loginSuccessForm";
	}

	@ResponseBody
	@RequestMapping(value="/admin/checkId/{id}", method=RequestMethod.POST)
	public String checkId(@PathVariable("id") String data, Admin admin, Model model, HttpServletRequest request) {
		
		System.out.println(data);
		String idpw[] = data.split(",");
		
		String admin_id = idpw[0];
		String admin_pw = idpw[1];
		
		admin.setAdmin_id(admin_id);
		admin.setAdmin_pw(admin_pw);
		
		
		Map<String, Boolean> errors = new HashMap<>();
		model.addAttribute("errors", errors);
		
		if(admin_id == null || admin_id.isEmpty()) {
			errors.put("id", Boolean.TRUE);
		}
		
		if(admin_pw == null || admin_pw.isEmpty()) {
			errors.put("password", Boolean.TRUE);
		}
				
		if(!errors.isEmpty()) {
			return "main/loginSuccessForm";
		}
	
		//Admin loginAdmin = service.adminLoginCheck(admin);

		return "{\"value\" : \"\"}";
		/*
		String msg;
		if(loginAdmin == null) {
			msg = "nodata";
			errors.put("idOrPwNotMatch", Boolean.TRUE);
			return "{\"value\" : \"" + msg + "\"}";			
		}else {
			msg = "data";
			//User user = new User(loginUser.getMember_id(), loginUser.getMember_name());
			
			request.getSession().setAttribute("Admin", loginAdmin);
			return "{\"value\" : \"" + msg + "\"}"; 
		}
		*/		
				
	}
	
}

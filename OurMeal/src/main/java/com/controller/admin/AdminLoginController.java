package com.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.all.model.Admin;
import com.service.admin.AdminService;

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
		
		return "main/loginSuccessForm";
	}

}

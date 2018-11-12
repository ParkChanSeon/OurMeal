package com.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.service.admin.AdminService;

@Controller
public class AdminManagerController {
	
	@Autowired
	private AdminService service;

	@RequestMapping(value = "/adminManager", method = RequestMethod.GET)
	public String adminManagerForm() {
		
		return "admin/adminManagerForm";
	}

}

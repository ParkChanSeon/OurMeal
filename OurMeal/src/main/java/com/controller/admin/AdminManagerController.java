package com.controller.admin;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.service.admin.AdminService;

@Controller
public class AdminManagerController {
	
	@Autowired
	private AdminService service;

	@RequestMapping(value = "/adminManager", method = RequestMethod.GET)
	public String adminManagerForm(Model model) {
		List<Object> list = service.partnerList();
		
		model.addAttribute("confirm_list", list);
		return "admin/adminManagerForm";
	}
	
	@RequestMapping(value = "/adminManager", method = RequestMethod.POST)
	public String adminMemberConfirm(HttpServletRequest request) {
		String id = request.getParameter("confirm_id");
		
		//member 파트너 승인
		service.memberConfirm(id);		

		return "redirect:/adminManager";
	}

}

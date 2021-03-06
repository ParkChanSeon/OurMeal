package com.controller.find;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.all.model.Member;
import com.service.find.FindIdService;

@Controller
public class FindIdController {

	@Autowired
	private FindIdService service;

	// 아이디 찾기 폼
	@RequestMapping(value = "/idFind", method = RequestMethod.GET)
	public String idFind() throws Exception {

		return "/find/idFindForm";
	}

	// 아이디 찾기
	@RequestMapping(value = "/idSearch", method = RequestMethod.POST)
	public String idSearch(HttpServletRequest request, Model model) throws Exception {

		String member_name = request.getParameter("name");
		String member_email = request.getParameter("email");

		Member member = new Member();

		member.setMember_name(member_name);
		member.setMember_email(member_email);

		member = service.findId(member);

		model.addAttribute("findid", member);

		return "/find/idSearchForm";
	}
}

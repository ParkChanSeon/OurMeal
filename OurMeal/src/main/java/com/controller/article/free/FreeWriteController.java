package com.controller.article.free;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.all.model.FreeArticle;
import com.all.model.Member;
import com.service.articles.FreeArticleService;

@Controller
public class FreeWriteController {

	@Autowired
	private FreeArticleService service;
	
	@RequestMapping(value="/freeWriteSuccess", method=RequestMethod.POST)
	public String freeWrite(Model model, HttpServletRequest request, HttpSession session) {
		
		FreeArticle freeArticle = new FreeArticle();
		
		Member member = (Member)session.getAttribute("User");
		
		freeArticle.setMember_id(member.getMember_id());
		freeArticle.setFb_title(request.getParameter("fb_title"));
		freeArticle.setFb_content(request.getParameter("fb_content"));
		
		model.addAttribute("freeWrite", service.freeWrite(freeArticle));
		
		return "success/freeArticleWriteSuccessForm";
	}
	
}

package com.controller.article.qna.partner;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.all.model.Member;
import com.all.model.QnaPartnerArticle;
import com.service.articles.QnaPartnerArticleService;

@Controller
public class QnaPartnerWriteController {
	
	@Autowired
	private QnaPartnerArticleService service;
	
	@RequestMapping(value="/qnaPartnerWriteSuccess", method=RequestMethod.POST)
	public String qnaPartnerWrite(Model model, HttpServletRequest request, HttpSession session) {
		
		QnaPartnerArticle qnaPartnerArticle = new QnaPartnerArticle();
		
		Member member = (Member)session.getAttribute("User");
		
		qnaPartnerArticle.setMember_id(member.getMember_id());
		qnaPartnerArticle.setPqb_title(request.getParameter("pqb_title"));
		qnaPartnerArticle.setPqb_content(request.getParameter("pqb_content"));

		model.addAttribute("qnaPartnerWrite", service.qnaPartnerWrite(qnaPartnerArticle));
		
		return "success/qnaPartnerArticleWriteSuccessForm";
	}

}

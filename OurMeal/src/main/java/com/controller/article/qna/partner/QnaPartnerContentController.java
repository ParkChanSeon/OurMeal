package com.controller.article.qna.partner;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.all.model.QnaPartnerArticle;
import com.service.articles.QnaPartnerArticleService;

@Controller
public class QnaPartnerContentController {
	
	@Autowired
	private QnaPartnerArticleService service;
	
	@RequestMapping(value="/qnaPartnerUpdate", method=RequestMethod.GET)
	public String qnaPartnerUpdate(Model model, HttpServletRequest request) {
		
		QnaPartnerArticle qnaPartnerArticle = new QnaPartnerArticle();
		
		qnaPartnerArticle.setPqb_no(Integer.parseInt(request.getParameter("pqb_no")));
		
		model.addAttribute("qnaPartnerUpdate", service.qnaPartnerContent(qnaPartnerArticle));
		
		return "article/qnaPartnerUpdateForm";
		
	}
	
	@RequestMapping(value="/qnaPartnerDelete", method=RequestMethod.GET)
	public String qnaPartnerDelete(Model model, @RequestParam("pqb_no") String pqb_no) {
		
		QnaPartnerArticle qnaPartnerArticle = new QnaPartnerArticle();
		
		qnaPartnerArticle.setPqb_no(Integer.parseInt(pqb_no));
		
		model.addAttribute("qnaPartnerDelete", service.qnaPartnerDelete(qnaPartnerArticle));
		
		return "success/qnaPartnerArticleDeleteSuccessForm";
		
	}

}

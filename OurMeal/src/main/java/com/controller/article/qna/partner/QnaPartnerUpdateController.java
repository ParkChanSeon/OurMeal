package com.controller.article.qna.partner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.all.model.QnaPartnerArticle;
import com.service.articles.QnaPartnerArticleService;

@Controller
public class QnaPartnerUpdateController {
	
	@Autowired
	private QnaPartnerArticleService service;
	
	@RequestMapping(value="/qnaPartnerUpdateSuccess", method=RequestMethod.POST)
	public String qnaPartnerUpdate(Model model,
			@RequestParam("pqb_no") String pqb_no,
			@RequestParam("pqb_title") String pqb_title,
			@RequestParam("pqb_content") String pqb_content) {
		
		QnaPartnerArticle qnaPartnerArticle = new QnaPartnerArticle();
		
		qnaPartnerArticle.setPqb_no(Integer.parseInt(pqb_no));
		qnaPartnerArticle.setPqb_title(pqb_title);
		qnaPartnerArticle.setPqb_content(pqb_content);
		
		model.addAttribute("qnaPartnerUpdate", service.qnaPartnerUpdate(qnaPartnerArticle));
		
		return "success/qnaPartnerArticleUpdateSuccessForm";
	}

}

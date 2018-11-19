package com.controller.article.qna.partner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.all.model.QnaPartnerArticle;
import com.service.article.qna.QnaPartnerArticleService;

@Controller
public class QnaPartnerWriteController {
	
	@Autowired
	private QnaPartnerArticleService service;
	
	@RequestMapping(value="/qnaPartnerWriteSuccess", method=RequestMethod.POST)
	public String qnaPartnerWrite(Model model,
			@RequestParam(name="pqb_title") String pqb_title,
			@RequestParam(name="partner_id") String partner_id,
			@RequestParam(name="pqb_content") String pqb_content) {
		
		QnaPartnerArticle qnaPartnerArticle = new QnaPartnerArticle();
		qnaPartnerArticle.setPqb_title(pqb_title);
		qnaPartnerArticle.setPartner_id(partner_id);
		qnaPartnerArticle.setPqb_content(pqb_content);

		model.addAttribute("qnaPartnerWrite", service.qnaPartnerWrite(qnaPartnerArticle));
		return "success/articleWriteSuccessForm";
	}

}

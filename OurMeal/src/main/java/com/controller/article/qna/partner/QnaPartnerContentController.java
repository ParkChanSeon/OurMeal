package com.controller.article.qna.partner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.service.article.qna.QnaPartnerArticleService;

@Controller
public class QnaPartnerContentController {
	
	@Autowired
	private QnaPartnerArticleService service;
	
	@RequestMapping(value="/qnaPartnerUpdate", method=RequestMethod.POST)
	public String qnaPartnerUpdate() {
		return "article/qnaPartnerUpdateForm";
	}
	
	@RequestMapping(value="/qnaPartnerDelete", method=RequestMethod.GET)
	public String qnaPartnerDelete() {
		
		return "success/articleDeleteSuccessForm";
	}

}

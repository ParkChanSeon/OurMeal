package com.controller.article.qna.partner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.service.article.qna.QnaPartnerArticleService;

@Controller
public class QnaPartnerUpdateController {
	
	@Autowired
	private QnaPartnerArticleService service;
	
	@RequestMapping(value="/qnaPartnerUpdateSuccess", method=RequestMethod.POST)
	public String qnaPartnerUpdate() {
		return "success/articleUpdateSuccessForm";
	}
	
	@RequestMapping(value="/qnaPartnerContent", method=RequestMethod.GET)
	public String qnaPartnerContent() {
		
		return "article/qnaPartnerContentForm";
	}

}

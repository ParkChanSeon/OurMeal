package com.controller.article.qna.partner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.service.article.qna.QnaPartnerArticleService;

@Controller
public class QnaPartnerWriteController {
	
	@Autowired
	private QnaPartnerArticleService service;
	
	@RequestMapping(value="/qnaPartnerWriteSuccess", method=RequestMethod.POST)
	public String qnaPartnerWrite() {
				
		return "success/articleWriteSuccessForm";
	}

}

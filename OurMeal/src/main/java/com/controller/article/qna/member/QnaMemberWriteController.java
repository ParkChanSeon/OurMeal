package com.controller.article.qna.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.service.article.qna.QnaMemberArticleService;

@Controller
public class QnaMemberWriteController {
	
	@Autowired
	private QnaMemberArticleService service;
	
	@RequestMapping(value="/qnaMemberWriteSuccess", method=RequestMethod.POST)
	public String qnaMemberWrite() {
				
		return "success/articleWriteSuccessForm";
	}

}

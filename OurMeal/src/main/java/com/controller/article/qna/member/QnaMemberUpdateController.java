package com.controller.article.qna.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.service.article.qna.QnaMemberArticleService;

@Controller
public class QnaMemberUpdateController {
	
	@Autowired
	private QnaMemberArticleService service;
	
	@RequestMapping(value="/qnaMemberUpdateSuccess", method=RequestMethod.POST)
	public String qnaMemberUpdate() {
		return "success/articleUpdateSuccessForm";
	}
	
	@RequestMapping(value="/qnaMemberContent", method=RequestMethod.GET)
	public String qnaMemberContent() {
		
		return "article/qnaMemberContentForm";
	}

}

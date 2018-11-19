package com.controller.article.qna.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.service.article.qna.QnaMemberArticleService;

@Controller
public class QnaMemberContentController {
	
	@Autowired
	private QnaMemberArticleService service;
	
	@RequestMapping(value="/qnaMemberUpdate", method=RequestMethod.POST)
	public String qnaMemberUpdate() {
		return "article/qnaMemberUpdateForm";
	}
	
	@RequestMapping(value="/qnaMemberDelete", method=RequestMethod.GET)
	public String qnaMemberDelete() {
		
		return "success/articleDeleteSuccessForm";
	}

}

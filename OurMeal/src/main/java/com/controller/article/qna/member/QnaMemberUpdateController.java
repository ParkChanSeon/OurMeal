package com.controller.article.qna.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.all.model.QnaMemberArticle;
import com.service.articles.QnaMemberArticleService;

@Controller
public class QnaMemberUpdateController {
	
	@Autowired
	private QnaMemberArticleService service;
	
	@RequestMapping(value="/qnaMemberUpdateSuccess", method=RequestMethod.GET)
	public String qnaMemberUpdate(Model model,
			@RequestParam("mqb_no") String mqb_no,
			@RequestParam("mqb_title") String mqb_title,
			@RequestParam("mqb_content") String mqb_content) {
		
		QnaMemberArticle qnaMemberArticle = new QnaMemberArticle();
		
		qnaMemberArticle.setMqb_no(Integer.parseInt(mqb_no));
		qnaMemberArticle.setMqb_title(mqb_title);
		qnaMemberArticle.setMqb_content(mqb_content);
		
		model.addAttribute("qnaMemberUpdate", service.qnaMemberUpdate(qnaMemberArticle));
		
		return "success/qnaMemberArticleUpdateSuccessForm";
	}

}

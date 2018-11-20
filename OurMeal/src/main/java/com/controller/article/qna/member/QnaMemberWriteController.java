package com.controller.article.qna.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.all.model.QnaMemberArticle;
import com.service.article.qna.QnaMemberArticleService;

@Controller
public class QnaMemberWriteController {
	
	@Autowired
	private QnaMemberArticleService service;
	
	@RequestMapping(value="/qnaMemberWriteSuccess", method=RequestMethod.POST)
	public String qnaMemberWrite(Model model,
			@RequestParam(name="mqb_title") String mqb_title,
			@RequestParam(name="member_id") String member_id,
			@RequestParam(name="mqb_Content") String mqb_Content) {
		
		QnaMemberArticle qnaMemberArticle = new QnaMemberArticle();
		qnaMemberArticle.setMqb_title(mqb_title);
		qnaMemberArticle.setMember_id(member_id);
		qnaMemberArticle.setMqb_Content(mqb_Content);
				
		model.addAttribute("", service.qnaMemberWrite(qnaMemberArticle));
		return "success/articleWriteSuccessForm";
	}

}

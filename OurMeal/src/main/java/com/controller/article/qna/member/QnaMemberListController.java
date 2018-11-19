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
public class QnaMemberListController {
	
	@Autowired
	private QnaMemberArticleService service;
	
	@RequestMapping(value="/qnaMemberWrite", method=RequestMethod.GET)
	public String qnaMemberWrite() {
		return "article/qnaMemberWriteForm";
	}
	
	@RequestMapping(value="/qnaMemberContent", method=RequestMethod.POST)
	public String qnaMemberContent(Model model, @RequestParam("notice_no") String id) {
		QnaMemberArticle qnaMemberArticle = new QnaMemberArticle();
		qnaMemberArticle.setMember_id(id);
		
		model.addAttribute("qnaMemberList", service.qnaMemberList(qnaMemberArticle));
		return "article/qnaMemberContentForm";
	}

}

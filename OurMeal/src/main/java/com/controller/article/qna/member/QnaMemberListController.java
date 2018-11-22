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
public class QnaMemberListController {
	
	@Autowired
	private QnaMemberArticleService service;
	
	@RequestMapping(value="/qnaMemberWrite", method=RequestMethod.GET)
	public String qnaMemberWrite() {
		
		return "article/qnaMemberWriteForm";
		
	}
	
	@RequestMapping(value="/qnaMemberList", method=RequestMethod.GET)
	public String qnaMemberList(Model model) {
		
		QnaMemberArticle qnaMemberArticle = new QnaMemberArticle();
		
		model.addAttribute("qnaMemberList", service.qnaMemberList());
		
		return "article/qnaMemberListForm";
		
	}
	
	@RequestMapping(value="/qnaMemberContent", method=RequestMethod.GET)
	public String qnaMemberContent(Model model, @RequestParam("pageNo") String no) {
		
		QnaMemberArticle qnaMemberArticle = new QnaMemberArticle();
		
		qnaMemberArticle.setMqb_no(Integer.parseInt(no));
		
		model.addAttribute("qnaMemberContent", service.qnaMemberContent(qnaMemberArticle));
		
		return "article/qnaMemberContentForm";
	}

}

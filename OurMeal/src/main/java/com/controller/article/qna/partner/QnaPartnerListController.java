package com.controller.article.qna.partner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.all.model.QnaPartnerArticle;
import com.service.articles.QnaPartnerArticleService;

@Controller
public class QnaPartnerListController {
	
	@Autowired
	private QnaPartnerArticleService service;
	
	@RequestMapping(value="/qnaPartnerWrite", method=RequestMethod.GET)
	public String qnaPartnerWrite() {
		
		return "article/qnaPartnerWriteForm";
		
	}
	
	@RequestMapping(value="/qnaPartnerList", method=RequestMethod.GET)
	public String qnaPartnerList(Model model) {
		
		QnaPartnerArticle qnaPartnerArticle = new QnaPartnerArticle();
		
		model.addAttribute("qnaPartnerList", service.qnaPartnerList());
		
		return "article/qnaMemberListForm";
		
	}
	
	@RequestMapping(value="/qnaPartnerContent", method=RequestMethod.GET)
	public String qnaPartnerContent(Model model, @RequestParam("pageNo") String no) {
		
		QnaPartnerArticle qnaPartnerArticle = new QnaPartnerArticle();
		
		qnaPartnerArticle.setPqb_no(Integer.parseInt(no));
		
		model.addAttribute("qnaPartnerContent", service.qnaPartnerContent(qnaPartnerArticle));
		
		return "article/qnaPartnerContentForm";
	}

}

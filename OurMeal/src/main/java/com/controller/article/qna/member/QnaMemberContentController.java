package com.controller.article.qna.member;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.all.model.QnaMemberArticle;
import com.service.articles.QnaMemberArticleService;

@Controller
public class QnaMemberContentController {
	
	@Autowired
	private QnaMemberArticleService service;
	
	@RequestMapping(value="/qnaMemberUpdate", method=RequestMethod.GET)
	public String qnaMemberUpdate(Model model, HttpServletRequest request) {
		
		QnaMemberArticle qnaMemberArticle = new QnaMemberArticle();
		
		qnaMemberArticle.setMqb_no(Integer.parseInt(request.getParameter("mqb_no")));
		
		model.addAttribute("qnaMemberUpdate", service.qnaMemberContent(qnaMemberArticle));
		
		return "article/qnaMemberUpdateForm";
	}
	
	@RequestMapping(value="/qnaMemberDelete", method=RequestMethod.GET)
	public String qnaMemberDelete(Model model, @RequestParam("mqb_no") String mqb_no) {
		
		QnaMemberArticle qnaMemberArticle = new QnaMemberArticle();
		
		qnaMemberArticle.setMqb_no(Integer.parseInt(mqb_no));
		
		model.addAttribute("qnaMemberDelete", service.qnaMemberDelete(qnaMemberArticle));
		
		return "success/qnaMemberArticleDeleteSuccessForm";
	}

}

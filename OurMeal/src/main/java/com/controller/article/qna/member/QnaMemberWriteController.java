package com.controller.article.qna.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.all.model.Member;
import com.all.model.QnaMemberArticle;
import com.service.articles.QnaMemberArticleService;

@Controller
public class QnaMemberWriteController {
	
	@Autowired
	private QnaMemberArticleService service;
	
	@RequestMapping(value="/qnaMemberWriteSuccess", method=RequestMethod.POST)
	public String qnaMemberWrite(Model model, HttpServletRequest request, HttpSession session) {
		
		QnaMemberArticle qnaMemberArticle = new QnaMemberArticle();
		
		Member member = (Member)session.getAttribute("User");
		
		qnaMemberArticle.setMember_id(member.getMember_id());
		qnaMemberArticle.setMqb_title(request.getParameter("mqb_title"));
		qnaMemberArticle.setMqb_content(request.getParameter("mqb_content"));
				
		model.addAttribute("qnaMemberWrite", service.qnaMemberWrite(qnaMemberArticle));
		
		return "success/qnaMemberArticleWriteSuccessForm";
	}

}

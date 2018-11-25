package com.controller.article.qna.partner;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.all.model.Member;
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
		
		model.addAttribute("qnaPartnerList", service.qnaPartnerList());
		
		return "article/qnaPartnerListForm";
		
	}
	
	@RequestMapping(value="/qnaPartnerContent", method=RequestMethod.GET)
	public String qnaPartnerContent(Model model, HttpSession session, @RequestParam("pageNo") String no) {
		
		QnaPartnerArticle qnaPartnerArticle = new QnaPartnerArticle();
		
		qnaPartnerArticle.setPqb_no(Integer.parseInt(no));
		
		QnaPartnerArticle board = service.qnaPartnerContent(qnaPartnerArticle);
		Member member = (Member)session.getAttribute("User");
		
		String writer_id = board.getMember_id();
		String login_id = member.getMember_id();
		
		if(writer_id.equals(login_id)) {
			model.addAttribute("userCheck", 1);
		}
		
		model.addAttribute("qnaPartnerContent", board);
		
		return "article/qnaPartnerContentForm";
	}

}

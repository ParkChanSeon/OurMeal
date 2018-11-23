package com.controller.article.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.all.model.Admin;
import com.all.model.Member;
import com.all.model.NoticeArticle;
import com.service.articles.NoticeArticleService;

@Controller
public class NoticeWriteController {
	
	@Autowired
	private NoticeArticleService service;
	
	@RequestMapping(value="/noticeWriteSuccess", method=RequestMethod.POST)
	public String noticeWrite(Model model, HttpServletRequest request, HttpSession session) {
		
		NoticeArticle noticeArticle = new NoticeArticle();
		
		Member member = (Member)session.getAttribute("User");
		
		noticeArticle.setAdmin_id(member.getMember_id());
		noticeArticle.setNotice_title(request.getParameter("notice_title"));
		noticeArticle.setNotice_content(request.getParameter("notice_content"));
		
		model.addAttribute("noticeWrite", service.noticeWrite(noticeArticle));
		
		return "success/noticeArticleWriteSuccessForm";
	}

}

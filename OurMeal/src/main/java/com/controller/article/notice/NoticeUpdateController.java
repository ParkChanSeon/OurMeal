package com.controller.article.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.all.model.NoticeArticle;
import com.service.articles.NoticeArticleService;

@Controller
public class NoticeUpdateController {
	
	@Autowired
	private NoticeArticleService service;
	
	@RequestMapping(value="/noticeUpdateSuccess", method=RequestMethod.GET)
	public String noticeUpdate(Model model,
			@RequestParam("notice_no") String notice_no,
			@RequestParam("notice_title") String notice_title,
			@RequestParam("notice_content") String notice_content) {
		
		NoticeArticle noticeArticle = new NoticeArticle();
		
		noticeArticle.setNotice_no(Integer.parseInt(notice_no));
		noticeArticle.setNotice_title(notice_title);
		noticeArticle.setNotice_content(notice_content);
		
		model.addAttribute("noticeUpdate", service.noticeUpdate(noticeArticle));
		
		return "success/noticeArticleUpdateSuccessForm";
		
	}

}

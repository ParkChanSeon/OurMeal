package com.controller.article.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.service.article.notice.NoticeArticleService;

@Controller
public class NoticeContentController {
	
	@Autowired
	private NoticeArticleService service;
	
	@RequestMapping(value="/noticeUpdate", method=RequestMethod.POST)
	public String noticeUpdate() {
		return "article/noticeArticleUpdateForm";
	}
	
	@RequestMapping(value="/noticeDelete", method=RequestMethod.GET)
	public String noticeDelete() {
		
		return "success/articleDeleteSuccessForm";
	}

}

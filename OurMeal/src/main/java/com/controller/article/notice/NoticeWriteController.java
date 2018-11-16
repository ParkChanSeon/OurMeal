package com.controller.article.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.service.article.notice.NoticeArticleService;

@Controller
public class NoticeWriteController {
	
	@Autowired
	private NoticeArticleService service;
	
	@RequestMapping(value="/writeSuccess", method=RequestMethod.POST)
	public String noticeWrite() {
				
		return "success/articleWriteSuccessForm";
	}

}

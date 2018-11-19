package com.controller.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.service.article.notice.NoticeArticleService;

@Controller
public class MainFormController {
	
	@Autowired
	private NoticeArticleService service;
	
	@RequestMapping(value="/noticeList", method=RequestMethod.GET)
	public String noticeArticleWriteForm() {
		return "article/noticeArticleListForm";
	}

}

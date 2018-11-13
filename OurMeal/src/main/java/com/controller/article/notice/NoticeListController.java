package com.controller.article.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.all.model.NoticeArticle;
import com.service.article.notice.NoticeArticleService;

@Controller
public class NoticeListController {
	
	@Autowired
	private NoticeArticleService service;
	
	@RequestMapping(value="/noticeList", method=RequestMethod.GET)
	public String noticeArticleListForm() {
		return "article/noticeArticleListForm";
	}
	
	@RequestMapping(value="/noticeContent", method=RequestMethod.POST)
	public String insult(Model model, @RequestParam("notice_no") int no) {
		
		return "article/noticeArticleContentForm";
	}

}

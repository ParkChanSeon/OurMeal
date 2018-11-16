package com.controller.article.notice;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class NoticeContentController {
	
	@RequestMapping(value="/noticeUpdate", method=RequestMethod.POST)
	public String update() {
		return "article/noticeArticleUpdateForm";
	}
	
	@RequestMapping(value="/noticeDelete", method=RequestMethod.GET)
	public String delete() {
		
		return "success/articleDeleteSuccessForm";
	}

}

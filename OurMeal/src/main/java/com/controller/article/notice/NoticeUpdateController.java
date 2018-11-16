package com.controller.article.notice;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class NoticeUpdateController {
	
	@RequestMapping(value="/updateSuccess", method=RequestMethod.POST)
	public String UpdateSuccess() {
		return "success/articleUpdateSuccessForm";
	}
	
	@RequestMapping(value="/noticeContent", method=RequestMethod.GET)
	public String noticeArticleContentForm() {
		
		return "article/noticeArticleContentForm";
	}

}

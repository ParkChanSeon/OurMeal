package com.controller.article.success;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DeleteSuccessController {
	
	@RequestMapping(value="/noticeList", method=RequestMethod.GET)
	public String noticeArticleListForm() {
		return "article/noticeArticleListForm";
	}
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String mainForm() {
		
		return "mainForm";
	}

}

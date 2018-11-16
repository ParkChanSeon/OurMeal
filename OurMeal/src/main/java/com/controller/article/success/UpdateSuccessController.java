package com.controller.article.success;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UpdateSuccessController {
	
	@RequestMapping(value="/updateSuccessListgo", method=RequestMethod.GET)
	public String noticeList() {
		return "article/noticeArticleListForm";
	}
	
	@RequestMapping(value="/updateSuccessMaingo", method=RequestMethod.GET)
	public String main() {
		
		return "/main";
	}

}

package com.controller.article.success;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DeleteSuccessController {
	
	@RequestMapping(value="/deleteSuccessListGo", method=RequestMethod.GET)
	public String noticeList() {
		return "article/noticeArticleListForm";
	}
	
	@RequestMapping(value="/deleteSuccessMainGo", method=RequestMethod.GET)
	public String main() {
		
		return "/main";
	}

}

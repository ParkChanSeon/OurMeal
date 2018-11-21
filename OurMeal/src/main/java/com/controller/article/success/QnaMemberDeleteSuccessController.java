package com.controller.article.success;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class QnaMemberDeleteSuccessController {
	
	@RequestMapping(value="/qnaMemberDeleteSuccessListGo", method=RequestMethod.GET)
	public String qnaMemberList() {
		return "article/qnaMemberListForm";
	}
}

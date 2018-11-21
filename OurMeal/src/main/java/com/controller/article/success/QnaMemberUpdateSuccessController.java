package com.controller.article.success;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class QnaMemberUpdateSuccessController {
	
	@RequestMapping(value="/qnaMemberUpdateSuccessListGo", method=RequestMethod.GET)
	public String qnaMemberList() {
		return "article/qnaMemberListForm";
	}
}

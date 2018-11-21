package com.controller.article.success;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class NoticeUpdateSuccessController {
	
	@RequestMapping(value="/noticeUpdateSuccessListgo", method=RequestMethod.GET)
	public String noticeList() {
		return "success/noticeArticleUpdateSuccessForm";
	}
}

package com.controller.article.success;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class NoticeWriteSuccessController {
	
	@RequestMapping(value="/writeSuccessListGo", method=RequestMethod.GET)
	public String noticeList() {
		return "success/noticeArticleWriteSuccessForm";
	}
}

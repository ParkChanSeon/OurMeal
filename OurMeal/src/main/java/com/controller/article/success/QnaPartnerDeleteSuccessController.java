package com.controller.article.success;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class QnaPartnerDeleteSuccessController {
	
	@RequestMapping(value="/qnaPartnerDeleteSuccessListGo", method=RequestMethod.GET)
	public String qnaPartnerList() {
		return "article/qnaPartnerListForm";
	}
}

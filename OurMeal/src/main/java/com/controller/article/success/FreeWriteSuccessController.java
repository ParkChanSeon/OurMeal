package com.controller.article.success;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FreeWriteSuccessController {
	
	@RequestMapping(value="/freeWriteSuccessListGo", method=RequestMethod.GET)
	public String freeList() {
		return "article/freeArticleListForm";
	}
}

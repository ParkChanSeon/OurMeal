package com.controller.article.free;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.service.article.free.FreeArticleService;

@Controller
public class FreeContentController {

	private static final String FORM_VIEW = "article/freeArticleContentForm";
	private FreeArticleService freecontent = new FreeArticleService();
	
	@RequestMapping(value="/freecontent", method=RequestMethod.GET)
	private String processForm() {
			return FORM_VIEW;
	}
}

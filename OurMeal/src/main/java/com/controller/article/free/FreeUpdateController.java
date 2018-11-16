package com.controller.article.free;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.service.article.free.FreeArticleService;

@Controller
public class FreeUpdateController {

	private static final String FORM_VIEW = "article/freeArticleUpdateForm";

	private FreeArticleService freeContent =new FreeArticleService();

	private FreeArticleService freeUpdate = new FreeArticleService();
	
	@RequestMapping(value="/freeupdate", method=RequestMethod.GET)
	private String processForm(Model model ) {
		
		return FORM_VIEW;
	}
}

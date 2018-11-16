package com.controller.article.free;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.service.article.free.FreeArticleService;

@Controller
public class FreeListController {
	private static final String FORM_VIEW = "article/freeArticleListForm";
	private FreeArticleService freeList= new FreeArticleService();
	
	@RequestMapping(value="/freeboard", method=RequestMethod.GET)
	private String processForm(Model model ) {
		
		return FORM_VIEW;
	}
}

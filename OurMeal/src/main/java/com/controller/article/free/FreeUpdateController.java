package com.controller.article.free;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.service.article.free.FreeArticleService;

@Controller
public class FreeUpdateController {

	@Autowired
	private FreeArticleService service;
	
	@RequestMapping(value="/freeUpdateSuccess", method=RequestMethod.POST)
	public String freeUpdate() {
		return "success/articleUpdateSuccessForm";
	}
	
	@RequestMapping(value="/freeContent", method=RequestMethod.GET)
	public String freeContent() {
		
		return "article/freeArticleContentForm";
	}
	
}

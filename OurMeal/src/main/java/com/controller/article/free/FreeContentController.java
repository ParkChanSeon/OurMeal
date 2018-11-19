package com.controller.article.free;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.service.article.free.FreeArticleService;

@Controller
public class FreeContentController {

	@Autowired
	private FreeArticleService service;
	
	@RequestMapping(value="/freeUpdate", method=RequestMethod.POST)
	public String freeUpdate() {
		return "article/freeArticleUpdateForm";
	}
	
	@RequestMapping(value="/freeDelete", method=RequestMethod.GET)
	public String freeDelete() {
		
		return "success/articleDeleteSuccessForm";
	}
}

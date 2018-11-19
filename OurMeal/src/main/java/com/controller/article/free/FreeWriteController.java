package com.controller.article.free;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.service.article.free.FreeArticleService;

@Controller
public class FreeWriteController {

	@Autowired
	private FreeArticleService service;
	
	@RequestMapping(value="/freeWriteSuccess", method=RequestMethod.POST)
	public String freeWrite() {
				
		return "success/articleWriteSuccessForm";
	}
	
}

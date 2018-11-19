package com.controller.article.free;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.all.model.FreeArticle;
import com.service.article.free.FreeArticleService;

@Controller
public class FreeListController {
	
	@Autowired
	private FreeArticleService service;
	
	@RequestMapping(value="/freeWrite", method=RequestMethod.GET)
	public String freeWrite() {
		return "article/freeArticleWriteForm";
	}
	
	@RequestMapping(value="/freeContent", method=RequestMethod.POST)
	public String freeContent(Model model, @RequestParam("fb_no") int no) {
		FreeArticle freeArticle = new FreeArticle();
		freeArticle.setFb_no(no);
		
		model.addAttribute("freeList", service.freeList(freeArticle));
		return "article/freeArticleContentForm";
	}
	
}

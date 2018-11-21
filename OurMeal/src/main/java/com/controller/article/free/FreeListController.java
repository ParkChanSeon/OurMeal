package com.controller.article.free;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.all.model.FreeArticle;
import com.service.articles.FreeArticleService;

@Controller
public class FreeListController {
	
	@Autowired
	private FreeArticleService service;
	
	@RequestMapping(value="/freeWrite", method=RequestMethod.GET)
	public String freeWrite() {
		
		return "article/freeArticleWriteForm";
		
	}
	
	@RequestMapping(value="/freeList", method=RequestMethod.GET)
	public String freeList(Model model) {
		
		FreeArticle freeArticle = new FreeArticle();
		
		model.addAttribute("freeList", service.freeList());
		
		return "article/freeArticleListForm";
		
	}
	
	@RequestMapping(value="/freeContent", method=RequestMethod.GET)
	public String freeContent(Model model, @RequestParam("pageNo") String no) {
		
		FreeArticle freeArticle = new FreeArticle();
		
		freeArticle.setFb_no(Integer.parseInt(no));
		
		model.addAttribute("freeContent", service.freeContent(freeArticle));
		
		return "article/freeArticleContentForm";
	}
	
}

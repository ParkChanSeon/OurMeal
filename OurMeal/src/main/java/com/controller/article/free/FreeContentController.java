package com.controller.article.free;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.all.model.FreeArticle;
import com.service.articles.FreeArticleService;

@Controller
public class FreeContentController {

	@Autowired
	private FreeArticleService service;
	
	@RequestMapping(value="/freeUpdate", method=RequestMethod.GET)
	public String freeUpdate(Model model, HttpServletRequest request) {
		
		FreeArticle freeArticle = new FreeArticle();
		
		freeArticle.setFb_no(Integer.parseInt(request.getParameter("fb_no")));
		
		model.addAttribute("freeUpdate", service.freeContent(freeArticle));
		
		return "article/freeArticleUpdateForm";
	}
	
	@RequestMapping(value="/freeDelete", method=RequestMethod.GET)
	public String freeDelete(Model model, @RequestParam("fb_no") String fb_no) {
		
		FreeArticle freeArticle = new FreeArticle();
		
		freeArticle.setFb_no(Integer.parseInt(fb_no));
		
		model.addAttribute("freeDelete", service.freeDelete(freeArticle));
		
		return "success/freeArticleDeleteSuccessForm";
	}
	
}

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
public class FreeWriteController {

	@Autowired
	private FreeArticleService service;
	
	@RequestMapping(value="/freeWriteSuccess", method=RequestMethod.POST)
	public String freeWrite(Model model,
			@RequestParam(name="fb_title") String fb_title,
			@RequestParam(name="member_id") String member_id,
			@RequestParam(name="fb_content") String fb_content) {
		
		FreeArticle freeArticle = new FreeArticle();
		
		freeArticle.setFb_title(fb_title);
		freeArticle.setMember_id(member_id);
		freeArticle.setFb_content(fb_content);
		
		model.addAttribute("freeWrite", service.freeWrite(freeArticle));
		
		return "success/freeArticleWriteSuccessForm";
	}
	
}

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
public class FreeUpdateController {

	@Autowired
	private FreeArticleService service;
	
	@RequestMapping(value="/freeUpdateSuccess", method=RequestMethod.GET)
	public String freeUpdate(Model model,
			@RequestParam("fb_no") String fb_no,
			@RequestParam("fb_title") String fb_title,
			@RequestParam("fb_content") String fb_content) {
		
		FreeArticle freeArticle = new FreeArticle();
		
		/*try {
			freeArticle.setFb_no(Integer.parseInt(fb_no));
			freeArticle.setFb_title(fb_title);
			freeArticle.setFb_content(fb_content);
		} catch (Exception e) {
			// TODO: handle exception
		}*/
		
		freeArticle.setFb_no(Integer.parseInt(fb_no));
		freeArticle.setFb_title(fb_title);
		freeArticle.setFb_content(fb_content);
		
		model.addAttribute("freeUpdate", service.freeUpdate(freeArticle));
		
		return "success/freeArticleUpdateSuccessForm";
	}
	
}

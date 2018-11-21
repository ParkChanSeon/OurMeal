package com.controller.article.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.all.model.NoticeArticle;
import com.service.article.notice.NoticeArticleService;

@Controller
public class NoticeContentController {
	
	@Autowired
	private NoticeArticleService service;
	
	@RequestMapping(value="/noticeUpdate", method=RequestMethod.GET)
	public String noticeUpdate(Model model, @RequestParam("notice_no") String no) {
		System.out.println("gd1");
		NoticeArticle noticeArticle = new NoticeArticle();
		
		noticeArticle.setNotice_no(Integer.parseInt(no));
		
		model.addAttribute("noticeUpdate", service.noticeContent(noticeArticle));
		
		return "article/noticeArticleUpdateForm";
		
	}
	
	@RequestMapping(value="/noticeDelete", method=RequestMethod.GET)
	public String noticeDelete() {
		
		return "success/articleDeleteSuccessForm";
		
	}

}

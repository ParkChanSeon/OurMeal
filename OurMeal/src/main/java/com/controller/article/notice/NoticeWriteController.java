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
public class NoticeWriteController {
	
	@Autowired
	private NoticeArticleService service;
	
	@RequestMapping(value="/noticeWriteListGo", method=RequestMethod.GET)
	public String noticeWriteListGo() {
		
		return "article/noticeArticleListForm";
		
	}
	
	@RequestMapping(value="/noticeWriteSuccess", method=RequestMethod.POST)
	public String noticeWrite(Model model,
			@RequestParam(name="notice_title") String notice_title,
			@RequestParam(name="admin_id") String admin_id,
			@RequestParam(name="notice_content") String notice_content) {
		
		NoticeArticle noticeArticle = new NoticeArticle();
		noticeArticle.setNotice_title(notice_title);
		noticeArticle.setAdmin_id(admin_id);
		noticeArticle.setNotice_content(notice_content);
		
		model.addAttribute("noticeWrite", service.noticeWrite(noticeArticle));				
		return "success/articleWriteSuccessForm";
	}

}

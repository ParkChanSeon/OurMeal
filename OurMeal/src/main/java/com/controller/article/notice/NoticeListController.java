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
public class NoticeListController {
	
	@Autowired
	private NoticeArticleService service;
	
	@RequestMapping(value="/noticeWrite", method=RequestMethod.GET)
	public String noticeWrite() {
		
		return "article/noticeArticleWriteForm";
		
	}
	
	@RequestMapping(value="/noticeList", method=RequestMethod.GET)
	public String noticeList(Model model) {
		System.out.println("notice list aaaaaa.");
		NoticeArticle noticeArticle = new NoticeArticle();
		
		model.addAttribute("noticeList", service.noticeList());		
		
		return "article/noticeArticleListForm";
	}
	
	/*
	@RequestMapping("/params/{paramId}")
	public ModelAndView exampleOf_URIParam(@PathVariable String paramId) {
		
	}
	@RequestMapping(value="/pageNo", method=RequestMethod.GET)
	public String test(Model model) {
		System.out.println("test 컨트롤러");
				
		return "article/noticeArticleListForm";
	}	

	
	/*
	@RequestMapping(value="/pageNo", method=RequestMethod.GET)
	public String noticeContent(Model model, @RequestParam int no) {
		
		System.out.println("전달받은 페이지 번호 : " + no);
		NoticeArticle noticeArticle = new NoticeArticle();
		
		model.addAttribute("noticeContent", service.noticeContent(noticeArticle));
		
		return "article/noticeArticleContentForm";
	}
	*/

}

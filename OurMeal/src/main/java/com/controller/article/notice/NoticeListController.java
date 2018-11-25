package com.controller.article.notice;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.all.model.Member;
import com.all.model.NoticeArticle;
import com.service.articles.NoticeArticleService;

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
		
		model.addAttribute("noticeList", service.noticeList());		
		
		return "article/noticeArticleListForm";
	}

	@RequestMapping(value="/noticeContent", method=RequestMethod.GET)
	public String noticeContent(Model model, HttpSession session, @RequestParam("pageNo") String no) {
		
		NoticeArticle noticeArticle = new NoticeArticle();
		
		noticeArticle.setNotice_no(Integer.parseInt(no));
		
		NoticeArticle board = service.noticeContent(noticeArticle);
		Member member = (Member)session.getAttribute("User");
		
		String writer_id = board.getAdmin_id();
		String login_id = member.getMember_id();
		
		if(writer_id.equals(login_id)) {
			model.addAttribute("userCheck", 1);
		}
			
		model.addAttribute("noticeContent", board);
		
		return "article/noticeArticleContentForm";
	}

}

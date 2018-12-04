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

	@RequestMapping(value = "/noticeWrite", method = RequestMethod.GET)
	public String noticeWrite() {

		return "article/noticeArticleWriteForm";

	}

	@RequestMapping(value = "/noticeList", method = RequestMethod.GET)
	public String noticeList(Model model, HttpSession session) {

		Member member = (Member) session.getAttribute("User");
		try {
			int check_type = member.getMember_type();
			model.addAttribute("typeCheck", check_type);
			model.addAttribute("noticeList", service.noticeList());
			return "article/noticeArticleListForm";
		} catch (Exception e) {
			model.addAttribute("noticeList", service.noticeList());
			return "article/noticeArticleListForm";
		}
	}

	@RequestMapping(value = "/noticeContent", method = RequestMethod.GET)
	public String noticeContent(Model model, HttpSession session, @RequestParam("pageNo") String no) {

		NoticeArticle noticeArticle = new NoticeArticle();

		noticeArticle.setNotice_no(Integer.parseInt(no));
		
		service.noticeCount(noticeArticle);
		NoticeArticle board = service.noticeContent(noticeArticle);		
		
		Member member = (Member) session.getAttribute("User");
		try {
			String login_id = member.getMember_id();
			int check_type = member.getMember_type();
			
			model.addAttribute("loginCheck", login_id);
			model.addAttribute("typeCheck", check_type);
			model.addAttribute("noticeContent", board);
			
			return "article/noticeArticleContentForm";
			
		} catch (Exception e) {
			model.addAttribute("noticeContent", board);
			return "article/noticeArticleContentForm";
		}
	}

}

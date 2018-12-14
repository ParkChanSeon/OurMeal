package com.controller.article.qna.member;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.all.model.Member;
import com.all.model.QnaMemberArticle;
import com.all.model.QnaMemberComment;
import com.service.articles.QnaMemberArticleService;
import com.service.comment.QnaMemberCommentService;

@Controller
public class QnaMemberListController {

	@Autowired
	private QnaMemberArticleService service;
	@Autowired
	private QnaMemberCommentService commentService;

	@RequestMapping(value = "/qnaMemberWrite", method = RequestMethod.GET)
	public String qnaMemberWrite() {

		return "article/qnaMemberWriteForm";

	}

	@RequestMapping(value = "/qnaMemberList", method = RequestMethod.GET)
	public String qnaMemberList(Model model, HttpSession session) {

		Member member = (Member) session.getAttribute("User");
		try {
			int check_type = member.getMember_type();
			model.addAttribute("typeCheck", check_type);
			model.addAttribute("qnaMemberList", service.qnaMemberList());
			return "article/qnaMemberListForm";
		} catch (Exception e) {
			model.addAttribute("qnaMemberList", service.qnaMemberList());
			return "article/qnaMemberListForm";
		}
	}

	@RequestMapping(value = "/qnaMemberContent", method = RequestMethod.GET)
	public String qnaMemberContent(Model model, HttpSession session, @RequestParam("pageNo") String no) {

		QnaMemberArticle qnaMemberArticle = new QnaMemberArticle();
		QnaMemberComment memberComment = new QnaMemberComment();

		qnaMemberArticle.setMqb_no(Integer.parseInt(no));
		memberComment.setMqb_no(Integer.parseInt(no));

		service.qnaMemberCount(qnaMemberArticle);
		QnaMemberArticle board = service.qnaMemberContent(qnaMemberArticle);
		
		List<QnaMemberComment> comment = commentService.qnaMemberCommentList(memberComment);
		Member member = (Member) session.getAttribute("User");
		try {
			String login_check = member.getMember_id();
			int check_type = member.getMember_type();
			model.addAttribute("loginCheck", login_check);
			model.addAttribute("typeCheck", check_type);
			model.addAttribute("qnaMemberContent", board);
			model.addAttribute("qnaMemberCommentList", comment);
			return "article/qnaMemberContentForm";
		} catch (Exception e) {
			model.addAttribute("qnaMemberContent", board);
			model.addAttribute("qnaMemberCommentList", comment);
			return "article/qnaMemberContentForm";
		}
	}
	
	@RequestMapping(value = "/qnaMemberSearch", method = RequestMethod.POST)
	public String qnaMemberSearch(Model model, HttpSession session, @RequestParam("search") String search) {
		
		Member member = (Member) session.getAttribute("User");

		if (member == null) {
			model.addAttribute("userCheck", false);
		}
		if (search != null) {
		HashMap<String, String> map = new HashMap<>();
		map.put("search", search);
		
		model.addAttribute("search", search);
		model.addAttribute("qnaMemberList", service.qnaMemberSearch(map));
		
		return "article/qnaMemberListForm";
		
		} else {
			model.addAttribute("qnaMemberList", service.qnaMemberList());
			return "article/qnaMemberListForm";
		}

	}

}

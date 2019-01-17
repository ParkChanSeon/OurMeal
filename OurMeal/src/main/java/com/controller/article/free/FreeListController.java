package com.controller.article.free;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.all.model.FreeArticle;
import com.all.model.FreeComment;
import com.all.model.Member;
import com.service.articles.FreeArticleService;
import com.service.comment.FreeCommentService;

@Controller
public class FreeListController {

	@Autowired
	private FreeArticleService service;
	@Autowired
	private FreeCommentService commentService;

	@RequestMapping(value = "/freeWrite", method = RequestMethod.GET)
	public String freeWrite() {
		
		return "article/freeArticleWriteForm";

	}

	@RequestMapping(value = "/freeList", method = RequestMethod.GET)
	public String freeList(Model model, HttpSession session) {
		
		Member member = (Member) session.getAttribute("User");

		if (member == null) {
			model.addAttribute("userCheck", false);
		}
		
		model.addAttribute("freeList", service.freeList());
		model.addAttribute("search", "");
		
		return "article/freeArticleListForm";

	}

	@RequestMapping(value = "/freeContent", method = RequestMethod.GET)
	public String freeContent(Model model, HttpSession session,HttpServletRequest req, @RequestParam("pageNo") String no) {

		FreeArticle freeArticle = new FreeArticle();
		FreeComment freeComment = new FreeComment();
		
		freeArticle.setFb_no(Integer.parseInt(no));
		freeComment.setFb_no(Integer.parseInt(no));
		
		FreeArticle board = service.freeContent(freeArticle);
		service.freeCount(freeArticle);
		
		List<FreeComment> comment = commentService.freeCommentList(freeComment);
		Member member = (Member) session.getAttribute("User");
		try {
			String login_id = member.getMember_id();
			int check_type = member.getMember_type();
			model.addAttribute("loginCheck", login_id);
			model.addAttribute("typeCheck", check_type);
			model.addAttribute("freeContent", board);
			model.addAttribute("freeCommentList", comment);
			model.addAttribute("search",req.getParameter("search"));
			return "article/freeArticleContentForm";
			
		} catch (Exception e) {
			
			model.addAttribute("commentCheck", false);
			model.addAttribute("freeContent", board);
			model.addAttribute("freeCommentList", comment);
			model.addAttribute("search",req.getParameter("search"));
			return "article/freeArticleContentForm";
		}
	}
	
	@RequestMapping(value = "/freeSearch", method = RequestMethod.POST)
	public String freeSearch(Model model, HttpSession session, @RequestParam("search") String search) {
		
		Member member = (Member) session.getAttribute("User");
		if (member == null) {
			model.addAttribute("userCheck", false);
		}
		
		if (search != null) {
		HashMap<String, String> map = new HashMap<>();
		map.put("search", search);
		model.addAttribute("search", search);
		model.addAttribute("freeList", service.freeSearch(map));
		} else {
			model.addAttribute("freeList", service.freeList());
		}
		
		return "article/freeArticleListForm";
	}
	/*
	@RequestMapping(value = "/freeList", method = RequestMethod.GET)
	public String freeList(Model model, HttpSession session) {
		
		Member member = (Member) session.getAttribute("User");
		if (member == null) {
			model.addAttribute("userCheck", false);
		}
		
		model.addAttribute("freeList", service.freeListPage());
		model.addAttribute("search", "");
		
		return "article/freeArticleListForm";

	}
	*/
}

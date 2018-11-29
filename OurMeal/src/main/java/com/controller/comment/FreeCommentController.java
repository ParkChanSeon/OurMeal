package com.controller.comment;

import java.util.List;

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
public class FreeCommentController {
	
	@Autowired
	private FreeArticleService service;
	
	@Autowired
	private FreeCommentService commentService;
	/*
	@RequestMapping(value="/freeCommentDelete", method=RequestMethod.GET)
	public String FreeCommentDelete(Model model, HttpServletRequest request) {
		
		FreeComment freeComment = new FreeComment();
		
		freeComment.setFc_no(Integer.parseInt(request.getParameter("fc_no")));
		
		model.addAttribute("freeCommentDelete", commentService.freeCommentDelete(freeComment));
		
		return "article/freeArticleContentForm";
		
	}
	*/
	@RequestMapping(value="/freeCommentWrite", method=RequestMethod.GET)
	public String FreeCommentWrite(Model model, HttpServletRequest request, HttpSession session) {

		FreeArticle freeArticle = new FreeArticle();
		FreeComment freeComment = new FreeComment();
		
		Member member = (Member)session.getAttribute("User");
		
		freeComment.setFb_no(Integer.parseInt(request.getParameter("fb_no")));
		freeComment.setMember_id(member.getMember_id());
		freeComment.setFc_content(request.getParameter("fc_content"));
		
		commentService.freeCommentWrite(freeComment);
		
		freeArticle.setFb_no(Integer.parseInt(request.getParameter("fb_no")));
		freeComment.setFb_no(Integer.parseInt(request.getParameter("fb_no")));
		
		FreeArticle board = service.freeContent(freeArticle);
		List<FreeComment> comment = commentService.freeCommentList(freeComment);
		
		try {
			String writer_id = board.getMember_id();
			String login_id = member.getMember_id();

			if (writer_id.equals(login_id) || member.getMember_type() == 9) {
				model.addAttribute("userCheck", login_id);
			}

			model.addAttribute("freeContent", board);
			model.addAttribute("freeCommentList", comment);
			
			return "article/freeArticleContentForm";

		} catch (Exception e) {
			model.addAttribute("freeContent", board);
			model.addAttribute("commentCheck", false);
			model.addAttribute("freeCommentList", comment);
			return "article/freeArticleContentForm";
		}
		
	}
	
	@RequestMapping(value="/freeCommentDelete", method=RequestMethod.GET)
	public String FreeCommentDelete(Model model, HttpServletRequest request, HttpSession session) {
		
		FreeArticle freeArticle = new FreeArticle();
		FreeComment freeComment = new FreeComment();
		
		Member member = (Member)session.getAttribute("User");
		
		freeComment.setFc_no(Integer.parseInt(request.getParameter("fc_no")));
		
		commentService.freeCommentDelete(freeComment);
		
		freeArticle.setFb_no(Integer.parseInt(request.getParameter("fb_no")));
		freeComment.setFb_no(Integer.parseInt(request.getParameter("fb_no")));
		
		FreeArticle board = service.freeContent(freeArticle);
		List<FreeComment> comment = commentService.freeCommentList(freeComment);
		
		try {
			String writer_id = board.getMember_id();
			String login_id = member.getMember_id();

			if (writer_id.equals(login_id) || member.getMember_type() == 9) {
				model.addAttribute("userCheck", login_id);
			}

			model.addAttribute("freeContent", board);
			model.addAttribute("freeCommentList", comment);
			
			return "article/freeArticleContentForm";

		} catch (Exception e) {
			model.addAttribute("freeContent", board);
			model.addAttribute("commentCheck", false);
			model.addAttribute("freeCommentList", comment);
			return "article/freeArticleContentForm";
		}
		
	}

}

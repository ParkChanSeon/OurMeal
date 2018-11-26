package com.controller.comment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.all.model.Comment;
import com.all.model.Member;
import com.service.comment.CommentService;

@Controller
public class CommentController {
	
	@Autowired
	private CommentService service;
	
	@RequestMapping(value="/commentWrite", method=RequestMethod.GET)
	public String commentWrite(Model model, HttpServletRequest request, HttpSession session) {
		
		Comment comment = new Comment();
		
		Member member = (Member)session.getAttribute("User");
		
		comment.setFb_no(Integer.parseInt((String)session.getAttribute("fb_no")));
		comment.setMember_id(member.getMember_id());
		comment.setFc_content(request.getParameter("fc_content"));
		
		model.addAttribute("commentWrite", service.commentWrite(comment));
		
		return "article/freeArticleContentForm";
		
	}
	
	@RequestMapping(value="/commentList", method=RequestMethod.GET)
	public String commentList(Model model) {
		
		model.addAttribute("commentList", service.commentList());
		
		return "article/freeArticleContentForm";
		
	}
	
	@RequestMapping(value="/commentDelete", method=RequestMethod.GET)
	public String commentDelete(Model model, @RequestParam() String no) {
		
		Comment comment = new Comment();
		
		comment.setFc_no(Integer.parseInt(no));
		
		model.addAttribute("commentDelete", service.commentDelete(comment));
		
		return "article/freeArticleContentForm";
		
	}

}

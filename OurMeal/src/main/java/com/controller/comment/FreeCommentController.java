package com.controller.comment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.all.model.FreeComment;
import com.all.model.Member;
import com.service.comment.FreeCommentService;

@Controller
public class FreeCommentController {
	
	@Autowired
	private FreeCommentService service;
	
	@RequestMapping(value="/FreeCommentWrite", method=RequestMethod.GET)
	public String FreeCommentWrite(Model model, HttpServletRequest request, HttpSession session) {
		
		FreeComment comment = new FreeComment();
		
		Member member = (Member)session.getAttribute("User");
		
		comment.setFb_no(Integer.parseInt(request.getParameter("fb_no")));
		comment.setMember_id(member.getMember_id());
		comment.setFc_content(request.getParameter("fc_content"));
		
		model.addAttribute("freeCommentWrite", service.FreeCommentWrite(comment));
		
		return "article/freeArticleContentForm";
		
	}
	
	@RequestMapping(value="/FreeCommentList", method=RequestMethod.GET)
	public String FreeCommentList(Model model, HttpSession session) {
		
		Member member = (Member) session.getAttribute("User");

		if (member == null) {
			model.addAttribute("userCheck", false);
		}
		
		model.addAttribute("freeCommentList", service.FreeCommentList());
		
		return "article/freeArticleContentForm";
		
	}
	
	@RequestMapping(value="/FreeCommentDelete", method=RequestMethod.GET)
	public String FreeCommentDelete(Model model, @RequestParam() String no) {
		
		FreeComment comment = new FreeComment();
		
		comment.setFc_no(Integer.parseInt(no));
		
		model.addAttribute("freeCommentDelete", service.FreeCommentDelete(comment));
		
		return "article/freeArticleContentForm";
		
	}

}

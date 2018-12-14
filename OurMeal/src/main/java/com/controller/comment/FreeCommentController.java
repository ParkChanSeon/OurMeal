package com.controller.comment;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.all.model.FreeComment;
import com.all.model.Member;
import com.service.comment.FreeCommentService;

@Controller
public class FreeCommentController {
	
	@Autowired
	private FreeCommentService commentService;
	
	@RequestMapping(value="/freeCommentWrite", method=RequestMethod.POST)
	public String FreeCommentWrite(Model model, HttpServletRequest request, HttpSession session) {
	
		FreeComment freeComment = new FreeComment();
		
		Member member = (Member)session.getAttribute("User");
				
		freeComment.setMember_id(member.getMember_id());
		freeComment.setFb_no(Integer.parseInt(request.getParameter("fb_no")));
		freeComment.setFc_content(request.getParameter("fc_content"));		
		
		commentService.freeCommentWrite(freeComment);
		
		return "redirect:" + "/freeContent/?pageNo=" + Integer.parseInt(request.getParameter("fb_no"));
		
	}
	
	@RequestMapping(value="/freeCommentDelete", method=RequestMethod.GET)
	public String FreeCommentDelete(Model model, HttpServletRequest request, HttpSession session) {
				
		FreeComment freeComment = new FreeComment();
		
		Member member = (Member)session.getAttribute("User");
		
		freeComment.setFc_no(Integer.parseInt(request.getParameter("fc_no")));
		
		commentService.freeCommentDelete(freeComment);
		
		return "redirect:" + "/freeContent/?pageNo=" + Integer.parseInt(request.getParameter("fb_no"));
		
	}

}

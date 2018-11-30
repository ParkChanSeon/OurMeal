package com.controller.comment;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.all.model.Member;
import com.all.model.QnaMemberComment;
import com.service.comment.QnaMemberCommentService;

@Controller
public class QnaMemberCommentController {
	
	@Autowired
	private QnaMemberCommentService commentService;
	
	@RequestMapping(value="/memberCommentWrite", method=RequestMethod.POST)
	public String memberCommentWrite(Model model, HttpServletRequest request, HttpSession session) {

		QnaMemberComment memberComment = new QnaMemberComment();
		
		Member member = (Member)session.getAttribute("User");
		
		memberComment.setAdmin_id(member.getMember_id());
		memberComment.setMqb_no(Integer.parseInt(request.getParameter("mqb_no")));		
		memberComment.setMqc_content(request.getParameter("mqc_content"));
		
		commentService.qnaMemberCommentWrite(memberComment);
			
		return "redirect:" + "/qnaMemberContent/?pageNo=" + Integer.parseInt(request.getParameter("mqb_no"));
		
	}
	
	@RequestMapping(value="/memberCommentDelete", method=RequestMethod.GET)
	public String memberCommentDelete(Model model, HttpServletRequest request, HttpSession session) {
		
		QnaMemberComment memberComment = new QnaMemberComment();
		
		Member member = (Member)session.getAttribute("User");
		
		memberComment.setMqc_no(Integer.parseInt(request.getParameter("mqc_no")));
		
		commentService.qnaMemberCommentDelete(memberComment);
		
		return "redirect:" + "/qnaMemberContent/?pageNo=" + Integer.parseInt(request.getParameter("mqb_no"));
		
	}

}
